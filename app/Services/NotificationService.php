<?php

namespace App\Services;

use App\Models\Notification;
use App\Models\Ticket;
use App\Models\User;

class NotificationService
{
    /**
     * Tạo thông báo thành công cho người dùng sau khi mua hàng
     *
     * @param int $userId
     * @param int $orderId
     * @return Notification
     */
    public function createSuccessNotification($userId, $orderId)
    {
        // Tạo thông báo loại 'success' cho người dùng sau khi đặt hàng thành công
        return Notification::create([
            'title' => 'Mua hàng thành công!',
            'message' => 'Đơn hàng #' . $orderId . ' đã được đặt thành công. Cảm ơn bạn đã mua hàng!',
            'type' => 'success',
            'user_id' => $userId,
        ]);
    }

    /**
     * Tạo thông báo lỗi
     *
     * @param int $userId
     * @param string $message
     * @return Notification
     */
    public function createErrorNotification($userId, $message)
    {
        return Notification::create([
            'title' => 'Có lỗi xảy ra!',
            'message' => $message,
            'type' => 'error',
            'user_id' => $userId,
        ]);
    }

    /**
     * Tạo thông báo cảnh báo
     *
     * @param int $userId
     * @param string $message
     * @return Notification
     */
    public function createWarningNotification($userId, $message)
    {
        return Notification::create([
            'title' => 'Cảnh báo!',
            'message' => $message,
            'type' => 'warning',
            'user_id' => $userId,
        ]);
    }
 
     // Tạo thông báo cho tất cả người dùng khi vé sắp hết
     public function createLowTicketNotificationForAllUsers($ticketId, $ticketName)
     {
         $users = User::all(); // Lấy tất cả người dùng
 
         foreach ($users as $user) {
             Notification::create([
                 'title' => 'Vé sắp hết!',
                 'message' => 'Vé cho sự kiện ' . $ticketName . ' sắp hết! Hãy nhanh tay đặt vé.',
                 'type' => 'warning',
                 'user_id' => $user->id,
             ]);
         }
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
