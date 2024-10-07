<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\Notification;
use App\Models\User;
use App\Models\Ticket;
use Illuminate\Http\Request;

class U_NotificationController extends Controller
{
    // Lấy tất cả thông báo
    public function index()
    {
        $notifications = Notification::all();
        return response()->json($notifications);
    }

    // Tạo thông báo mới
    public function store(Request $request)
    {
        $request->validate([
            'title' => 'required|string|max:255',
            'message' => 'required|string',
            'type' => 'required|in:error,success,warning',  // Chỉ cho phép 3 loại thông báo
        ]);

        $notification = Notification::create($request->all());

        return response()->json([
            'message' => 'Notification created successfully!',
            'notification' => $notification,
        ], 201);
    }

    // Cập nhật thông báo
    public function update(Request $request, $id)
    {
        $notification = Notification::find($id);

        if (!$notification) {
            return response()->json(['message' => 'Notification not found'], 404);
        }

        $request->validate([
            'title' => 'required|string|max:255',
            'message' => 'required|string',
            'type' => 'required|in:error,success,warning',
        ]);

        $notification->update($request->all());

        return response()->json([
            'message' => 'Notification updated successfully!',
            'notification' => $notification,
        ]);
    }

    // Xóa thông báo
    public function destroy($id)
    {
        $notification = Notification::find($id);

        if (!$notification) {
            return response()->json(['message' => 'Notification not found'], 404);
        }

        $notification->delete();

        return response()->json(['message' => 'Notification deleted successfully!']);
    }

    public function clearAllNotifications(Request $request)
    {
        // Lấy user_id từ token (người dùng đã đăng nhập)
        $userId = $request->user()->id;

        // Xóa tất cả thông báo của người dùng
        Notification::where('user_id', $userId)->delete();

        return response()->json(['message' => 'All notifications have been deleted successfully!']);
    }


    // Phương thức để tạo thông báo mua hàng thành công
    public function createSuccessNotification($userId, $orderId)
    {
        // Tạo thông báo mới với loại 'success'
        $notification = Notification::create([
            'title' => 'Mua hàng thành công!',
            'message' => 'Đơn hàng #' . $orderId . ' đã được đặt thành công. Cảm ơn bạn đã mua hàng!',
            'type' => 'success',
            'user_id' => $userId,  // Gửi thông báo cho người dùng
        ]);

        return $notification;
    }

    public function getUserNotifications(Request $request)
    {
        $userId = $request->user()->id; 
        $notifications = Notification::where('user_id', $userId)->get();
        return response()->json($notifications);
    }

    // Gửi thông báo cho tất cả người dùng khi vé đã bán vượt quá 70%
    public function sendLowStockNotificationForTickets(Ticket $ticket)
    {
        $users = User::all(); // Lấy tất cả người dùng từ bảng `users`

        foreach ($users as $user) {
            Notification::create([
                'user_id' => $user->id,
                'title' => 'Vé sắp hết!',
                'message' => 'Vé "' . $ticket->name . '" đã bán hơn 70%. Đặt vé ngay!',
                'type' => 'warning',
            ]);
        }
    }
}
