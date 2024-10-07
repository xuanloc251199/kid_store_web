<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;

use App\Models\User;
use App\Models\Order;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class U_UserController extends Controller
{
    // Hiển thị danh sách người dùng
    public function index()
    {
        $users = User::with('role')->get(); // Tải thông tin vai trò
        return response()->json($users);
    }

    // Hiển thị thông tin
    public function show(Request $request)
    {
        return response()->json($request->user());
    }

    // Cập nhật người dùng
    public function update(Request $request)
    {
        // Lấy thông tin người dùng hiện tại
        $user = $request->user();
        // Xác thực dữ liệu
        $validator = Validator::make($request->all(), [
            'name' => 'sometimes|required|string|max:255',
            'email' => 'sometimes|required|string|email|max:255|unique:users,email,' . $user->id,
            'password' => 'sometimes',
            'role_id' => 'nullable|exists:roles,id',
            'number_phone' => 'nullable|string|max:15',
            'address' => 'nullable|string',
            'avatar' => 'nullable|file|mimes:jpg,jpeg,png|max:10240', // Thêm quy tắc cho avatar
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        // Cập nhật thông tin người dùng
        $user->update($request->only('name', 'number_phone', 'address'));

        // Nếu có mật khẩu mới, mã hóa và lưu lại
        if ($request->has('password') && !empty($request->password)) {
            $user->password = bcrypt($request->password); // Sử dụng bcrypt để mã hóa mật khẩu
        }

        // Xử lý upload avatar nếu có
        $avatarPath = null;
        if ($request->hasFile('avatar')) {
            // Xóa avatar cũ nếu có
            if ($user->avatar) {
                $oldAvatarPath = public_path($user->avatar);
                if (file_exists($oldAvatarPath)) {
                    unlink($oldAvatarPath); // Xóa file cũ
                }
            }

            $file = $request->file('avatar');
            $originalName = $file->getClientOriginalName();
            $extension = $file->getClientOriginalExtension();
            $filename = pathinfo($originalName, PATHINFO_FILENAME);
            $filename = Str::slug($filename) . '_' . time(); // Tạo tên file an toàn
            $filename .= '.' . $extension;

            $destinationPath = public_path('avatars'); // Thư mục lưu trữ avatar
            while (file_exists($destinationPath . '/' . $filename)) {
                $filename = pathinfo($originalName, PATHINFO_FILENAME) . '_' . time() . '_' . rand(1, 1000) . '.' . $extension;
            }

            $file->move($destinationPath, $filename); // Lưu file vào thư mục
            $avatarPath = 'avatars/' . $filename; // Lưu đường dẫn avatar
            $user->avatar = $avatarPath; // Cập nhật đường dẫn avatar mới
        }

        $user->save(); // Lưu tất cả thông tin đã cập nhật

        return response()->json($user, 200);
    }


    // Xóa người dùng
    public function destroy($id)
    {
        $user = User::findOrFail($id);
        $user->delete();

        return response()->json(['message' => 'User deleted successfully'], 200);
    }

    public function updateUserInfo(Request $request)
    {
        // Lấy thông tin người dùng hiện tại từ token đăng nhập
        $user = $request->user();

        // Xác thực dữ liệu đầu vào
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:8',
            'role_id' => 'required|integer',
            'number_phone' => 'nullable|string|max:20',
            'address' => 'nullable|string|max:255',
            'avatar' => 'nullable|file|mimes:jpg,jpeg,png|max:10240'
        ]);

        // Kiểm tra nếu xác thực không thành công
        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        // Cập nhật các thông tin: tên, số điện thoại, địa chỉ
        $user->update($request->only('name', 'number_phone', 'address'));

        // Lưu thông tin đã cập nhật
        $user->save();

        // Trả về thông báo cập nhật thành công và thông tin người dùng đã cập nhật
        return response()->json([
            'message' => 'Cập nhật thông tin thành công!',
            'user' => $user
        ], 200);
    }
    
    /**
     * Lấy danh sách đơn hàng đã thanh toán của người dùng dựa trên token.
     */
    public function getPaidOrder(Request $request)
    {
        // Lấy thông tin người dùng từ token
        $userId = $request->user()->id;

        // Lấy danh sách đơn hàng đã thanh toán của người dùng
        $paidOrders = Order::where('user_id', $userId)
            ->where('status', 'paid')
            ->with(['orderItems.product', 'orderItems.ticket']) // Lấy cả sản phẩm và ticket
            ->get();

        if ($paidOrders->isEmpty()) {
            return response()->json(['message' => 'No paid orders found'], 404);
        }

        return response()->json([
            'success' => true,
            'orders' => $paidOrders
        ], 200);
    }

}
