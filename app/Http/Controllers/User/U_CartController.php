<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;

use App\Models\Cart;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\Product;
use App\Services\NotificationService;
use App\Http\Controllers\User\U_NotificationController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class U_CartController extends Controller
{

    protected $notificationService;

    public function __construct(NotificationService $notificationService)
    {
        $this->notificationService = $notificationService;
    }
    // Hiển thị giỏ hàng của người dùng
    public function index(Request $request)
    {
        $userId = $request->user()->id; // Lấy ID người dùng đã đăng nhập
        $cartItems = Cart::where('user_id', $userId)
            ->with(['product', 'ticket']) // Bao gồm cả sản phẩm và vé
            ->get();

        // Tính tổng số lượng và giá tiền
        $totalQuantity = $cartItems->sum('quantity');
        $totalPrice = $cartItems->reduce(function ($carry, $cartItem) {
            if ($cartItem->type == 'product') {
                return $carry + ($cartItem->product->price * $cartItem->quantity);
            } else if ($cartItem->type == 'ticket') {
                return $carry + ($cartItem->ticket->price * $cartItem->quantity);
            }
            return $carry;
        }, 0);

        return response()->json([
            'total_quantity' => $totalQuantity,
            'total_price' => $totalPrice,
            'cart_items' => $cartItems,
        ]);
    }

    // Thêm sản phẩm vào giỏ hàng
    public function store(Request $request)
    {
        // Xác thực dữ liệu
        $validator = Validator::make($request->all(), [
            'item_id' => 'required', // Có thể là product_id hoặc ticket_id
            'type' => 'required|in:product,ticket', // Xác định loại: product hoặc ticket
            'quantity' => 'required|integer|min:1',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $userId = auth()->id(); // Lấy ID người dùng đã đăng nhập
        $type = $request->input('type'); // Lấy giá trị 'type'

        // Kiểm tra xem sản phẩm/vé đã có trong giỏ hàng chưa
        $cartItem = Cart::where('user_id', $userId)
            ->where($type == 'product' ? 'product_id' : 'ticket_id', $request->item_id)
            ->first();

        if ($cartItem) {
            // Nếu sản phẩm/vé đã có, cập nhật số lượng
            $cartItem->quantity += $request->quantity;
            $cartItem->save();
        } else {
            // Nếu sản phẩm/vé chưa có, tạo mới
            $cartItemData = [
                'user_id' => $userId,
                'quantity' => $request->quantity,
                'type' => $type,  // Đảm bảo 'type' được lưu vào bảng
                'created_at' => now(),
                'updated_at' => now()
            ];

            // Thêm product_id hoặc ticket_id tùy vào loại item
            if ($type == 'product') {
                $cartItemData['product_id'] = $request->item_id;
            } else {
                $cartItemData['ticket_id'] = $request->item_id;
            }

            $cartItem = Cart::create($cartItemData);
        }

        return response()->json($cartItem, 201);
    }




    // Cập nhật số lượng sản phẩm trong giỏ hàng
    public function update(Request $request, $id)
    {
        $cartItem = Cart::findOrFail($id);

        // Xác thực dữ liệu
        $validator = Validator::make($request->all(), [
            'quantity' => 'required|integer|min:1',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        // Cập nhật số lượng
        $cartItem->quantity = $request->quantity;
        $cartItem->save();

        return response()->json($cartItem, 200);
    }

    // Xóa sản phẩm khỏi giỏ hàng
    public function destroy($id)
    {
        $cartItem = Cart::findOrFail($id);
        $cartItem->delete();

        return response()->json(['message' => 'Item removed from cart successfully'], 200);
    }

    // Checkout giỏ hàng
    public function checkout(Request $request)
    {
        $userId = $request->user()->id;

        // Lấy tất cả các sản phẩm/vé trong giỏ hàng
        $cartItems = Cart::with(['product', 'ticket'])->where('user_id', $userId)->get();

        if ($cartItems->isEmpty()) {
            return response()->json(['message' => 'Giỏ hàng của bạn đang trống'], 400);
        }

        // Xác thực sản phẩm và vé trong giỏ hàng
        foreach ($cartItems as $cartItem) {
            if ($cartItem->type == 'product' && !$cartItem->product) {
                return response()->json(['message' => 'Sản phẩm không tồn tại trong giỏ hàng'], 400);
            } elseif ($cartItem->type == 'ticket' && !$cartItem->ticket) {
                return response()->json(['message' => 'Vé không tồn tại trong giỏ hàng'], 400);
            }

            // Kiểm tra số lượng tồn kho của sản phẩm
            if ($cartItem->type == 'product' && $cartItem->product->quantity < $cartItem->quantity) {
                return response()->json(['message' => 'Số lượng sản phẩm ' . $cartItem->product->name . ' không đủ'], 400);
            }

            // Kiểm tra số lượng vé
            if ($cartItem->type == 'ticket' && $cartItem->ticket->number_ticket < $cartItem->quantity) {
                return response()->json(['message' => 'Số lượng vé ' . $cartItem->ticket->name . ' không đủ'], 400);
            }
        }

        DB::beginTransaction();

        try {
            // Tạo đơn hàng
            $order = Order::create([
                'user_id' => $userId,
                'status' => 'pending',
                'total_price' => $cartItems->reduce(function ($carry, $cartItem) {
                    if ($cartItem->type == 'product') {
                        return $carry + ($cartItem->product->price * $cartItem->quantity);
                    } elseif ($cartItem->type == 'ticket') {
                        return $carry + ($cartItem->ticket->price * $cartItem->quantity);
                    }
                    return $carry;
                }, 0),
            ]);

            // Lưu thông tin từng item trong đơn hàng và cập nhật số lượng
            foreach ($cartItems as $cartItem) {
                OrderItem::create([
                    'order_id' => $order->id,
                    'product_id' => $cartItem->type == 'product' ? $cartItem->product_id : null,
                    'ticket_id' => $cartItem->type == 'ticket' ? $cartItem->ticket_id : null,
                    'quantity' => $cartItem->quantity,
                    'price' => $cartItem->type == 'product' ? $cartItem->product->price : $cartItem->ticket->price,
                ]);

                // Cập nhật số lượng tồn kho của sản phẩm
                if ($cartItem->type == 'product') {
                    $product = $cartItem->product;
                    $product->quantity -= $cartItem->quantity;
                    $product->sold += $cartItem->quantity;
                    $product->save();
                }

                // Cập nhật số lượng vé còn lại và kiểm tra nếu đã bán hơn 70%
                if ($cartItem->type == 'ticket') {
                    $ticket = $cartItem->ticket;
                    $ticket->number_ticket -= $cartItem->quantity;
                    $ticket->sold += $cartItem->quantity;
                    $ticket->save();
                }
            }

            // Xóa giỏ hàng sau khi hoàn tất thanh toán
            Cart::where('user_id', $userId)->delete();

            // Tạo thông báo thành công
            $this->notificationService->createSuccessNotification($userId, $order->id);

            DB::commit();

            return response()->json([
                'message' => 'Checkout thành công',
                'order' => $order,
            ], 201);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json(['message' => 'Có lỗi xảy ra khi thực hiện checkout', 'error' => $e->getMessage()], 500);
        }
    }
}
