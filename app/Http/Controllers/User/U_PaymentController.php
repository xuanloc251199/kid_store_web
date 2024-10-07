<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\UserCard;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\Cart;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use App\Services\PaymentService; // Custom service for handling payment
use App\Services\NotificationService;
use Illuminate\Support\Facades\Crypt;

class U_PaymentController extends Controller
{

    public function show(Request $request)
    {
        $userId = $request->user()->id;

        // Lấy danh sách thẻ của người dùng
        $cards = UserCard::where('user_id', $userId)->get();

        if ($cards->isEmpty()) {
            return response()->json(['message' => 'No cards found for this user'], 404);
        }

        // Giải mã số thẻ và chỉ trả về bốn số cuối
        $cards = $cards->map(function ($card) {
            $decryptedCardNumber = Crypt::decryptString($card->card_number);
            $decryptedCVV = Crypt::decryptString($card->cvv);
            return [
                'id' => $card->id,
                'card_number' => '**** **** **** ' . substr($decryptedCardNumber, -4), // Chỉ hiển thị bốn số cuối
                'expiry_date' => $card->expiry_date,
                'cvv' => $decryptedCVV,
                'created_at' => $card->created_at,
                'updated_at' => $card->updated_at,
            ];
        });

        return response()->json(['cards' => $cards], 200);
    }

    public function getCardById($id)
    {
        // Lấy thông tin người dùng hiện tại
        $userId = auth()->id();

        // Tìm thẻ của người dùng theo ID và kiểm tra xem thẻ có thuộc về người dùng không
        $card = UserCard::where('id', $id)->where('user_id', $userId)->first();

        if (!$card) {
            // Nếu không tìm thấy thẻ hoặc thẻ không thuộc về người dùng, trả về lỗi
            return response()->json(['message' => 'Card not found or you do not have permission to view this card'], 404);
        }

        // Giải mã số thẻ và chỉ trả về bốn số cuối
        $decryptedCardNumber = Crypt::decryptString($card->card_number);
        $decryptedCVV = Crypt::decryptString($card->cvv);

        // Trả về thông tin thẻ đã được giải mã
        return response()->json([
            'id' => $card->id,
            'card_number' => $decryptedCardNumber, // Chỉ hiển thị bốn số cuối
            'expiry_date' => $card->expiry_date,
            'cvv' => $decryptedCVV,
            'created_at' => $card->created_at,
            'updated_at' => $card->updated_at,
        ], 200);
    }

    public function storeCard(Request $request)
    {
        // Validate card data
        $validator = Validator::make($request->all(), [
            'card_number' => 'required|string|min:16|max:16|unique:user_cards,card_number',
            'expiry_date' => 'required|string',
            'cvv' => 'required|digits:3',
        ]);

        if ($validator->fails()) {
            return response()->json(['message' => 'Invalid card data', 'errors' => $validator->errors()], 422);
        }

        // Mã hóa số thẻ tín dụng trước khi lưu vào cơ sở dữ liệu
        $encryptedCardNumber = Crypt::encryptString($request->input('card_number'));

        // Kiểm tra xem số thẻ đã mã hóa có tồn tại hay không
        $existingCard = UserCard::where('card_number', $encryptedCardNumber)
        ->where('user_id', auth()->id())
        ->first();

        if ($existingCard) {
            return response()->json(['message' => 'The card number already exists'], 422);
        }

        // Lưu thông tin thẻ của người dùng với số thẻ đã mã hóa
        $card = UserCard::create([
            'user_id' => auth()->id(),
            'card_number' => $encryptedCardNumber,
            'expiry_date' => $request->input('expiry_date'),
            'cvv' => Crypt::encryptString($request->input('cvv')), // Mã hóa CVV
        ]);

        return response()->json([
            'message' => 'Card information saved successfully',
            'card' => $card,
        ], 201);
    }

    protected $paymentService;
    protected $notificationService;

    public function __construct(PaymentService $paymentService, NotificationService $notificationService)
    {
        $this->paymentService = $paymentService;
        $this->notificationService = $notificationService;
    }

    public function processPayment(Request $request)
    {
        $userId = $request->user()->id;
        $paymentInfo = $request->only('card_number', 'expiry_date', 'cvv');
        $totalAmount = $request->input('amount');

        // Lấy thông tin giỏ hàng
        $cartItems = Cart::with(['product', 'ticket'])->where('user_id', $userId)->get();
        if ($cartItems->isEmpty()) {
            return response()->json(['message' => 'Giỏ hàng của bạn trống'], 400);
        }

        // Xử lý thanh toán (PaymentService xử lý logic thanh toán)
        $paymentSuccess = $this->paymentService->processPayment($paymentInfo, $totalAmount);
        if (!$paymentSuccess) {
            return response()->json(['message' => 'Thanh toán thất bại'], 400);
        }

        // Nếu thanh toán thành công, tạo đơn hàng
        DB::beginTransaction();
        try {
            $order = Order::create([
                'user_id' => $userId,
                'status' => 'paid',
                'total_price' => $totalAmount,
            ]);

            foreach ($cartItems as $cartItem) {
                OrderItem::create([
                    'order_id' => $order->id,
                    'product_id' => $cartItem->type == 'product' ? $cartItem->product_id : null,
                    'ticket_id' => $cartItem->type == 'ticket' ? $cartItem->ticket_id : null,
                    'quantity' => $cartItem->quantity,
                    'price' => $cartItem->type == 'product' ? $cartItem->product->price : $cartItem->ticket->price,
                ]);
            }

            // Xóa giỏ hàng sau khi thanh toán
            Cart::where('user_id', $userId)->delete();

            // Gửi thông báo thanh toán thành công cho người dùng
            $this->notificationService->createSuccessNotification($userId, $order->id);

            DB::commit();
            return response()->json(['message' => 'Thanh toán thành công', 'order' => $order], 201);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json(['message' => 'Có lỗi xảy ra khi tạo đơn hàng', 'error' => $e->getMessage()], 500);
        }
    }

    public function updateCard(Request $request, $cardId)
    {
        // Xác thực dữ liệu đầu vào
        $validator = Validator::make($request->all(), [
            'card_number' => 'required|string|min:16|max:16',
            'expiry_date' => 'required|string',
            'cvv' => 'required|digits:3',
        ]);

        if ($validator->fails()) {
            return response()->json(['message' => 'Invalid card data', 'errors' => $validator->errors()], 422);
        }

        // Tìm kiếm thông tin thẻ theo ID
        $card = UserCard::where('id', $cardId)->where('user_id', auth()->id())->first();

        if (!$card) {
            return response()->json(['message' => 'Card not found or you do not have permission to update this card'], 404);
        }

        // Kiểm tra xem số thẻ mới có bị trùng với thẻ khác không
        $existingCard = UserCard::where('card_number', Crypt::encryptString($request->input('card_number')))
                                ->where('user_id', auth()->id())
                                ->where('id', '!=', $cardId)
                                ->first();

        if ($existingCard) {
            return response()->json(['message' => 'The card number already exists'], 422);
        }

        // Mã hóa số thẻ và CVV trước khi cập nhật
        $encryptedCardNumber = Crypt::encryptString($request->input('card_number'));
        $encryptedCvv = Crypt::encryptString($request->input('cvv'));

        // Cập nhật thông tin thẻ
        $card->update([
            'card_number' => $encryptedCardNumber,
            'expiry_date' => $request->input('expiry_date'),
            'cvv' => $encryptedCvv,
        ]);

        return response()->json(['message' => 'Card updated successfully', 'card' => $card], 200);
    }
}
