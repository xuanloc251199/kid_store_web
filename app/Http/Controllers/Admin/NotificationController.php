<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Notification;
use App\Models\User;
use Illuminate\Http\Request;

class NotificationController extends Controller
{
    // Hiển thị danh sách thông báo
    public function index()
    {
        $notifications = Notification::latest('created_at')
            ->with('user:id,name') // Load thông tin user
            ->get()
            ->groupBy(function ($notification) {
                return $notification->title . '|' . $notification->message . '|' . $notification->type;
            });

        // Tạo danh sách user dạng chuỗi
        $groupedNotifications = $notifications->map(function ($group) {
            return [
                'title' => $group->first()->title,
                'message' => $group->first()->message,
                'type' => $group->first()->type,
                'created_at' => $group->first()->created_at,
                'users' => $group->pluck('user.name')->unique()->join(', '), // Ghép tên user thành chuỗi
                'ids' => $group->pluck('id')->toArray(), // Thêm ids của nhóm thông báo
                'is_group' => $group->count() > 1 // Kiểm tra xem đây có phải là nhóm hay không
            ];
        });

        return view('admin.notification.index', ['notifications' => $groupedNotifications]);
    }

    public function showGroupDetails($groupId)
    {
        // Lấy thông tin nhóm thông báo từ ids
        $notifications = Notification::whereIn('id', explode(',', $groupId))
            ->with('user:id,name') // Lấy thông tin user
            ->get();

        return view('admin.notification.group_details', ['notifications' => $notifications]);
    }

    // Hiển thị form tạo thông báo
    public function create()
    {
        return view('admin.notification.create');
    }

    // Lưu thông báo vào cơ sở dữ liệu và gửi đến tất cả user có role_id = 2
    public function store(Request $request)
    {
        $request->validate([
            'title' => 'required|string|max:255',
            'message' => 'required|string',
            'type' => 'required|in:error,success,warning,promotion',
        ]);

        // Lấy danh sách tất cả User có role_id = 2
        $users = User::where('role_id', 2)->get();

        foreach ($users as $user) {
            Notification::create([
                'user_id' => $user->id,
                'title' => $request->input('title'),
                'message' => $request->input('message'),
                'type' => $request->input('type'),
            ]);
        }

        return redirect()->route('admin.notification.index')->with('success', 'Thông báo đã được gửi!');
    }

    // Xóa thông báo
    public function destroy($id)
    {
        $notification = Notification::findOrFail($id);
        $notification->delete();

        return redirect()->route('admin.notification.index')->with('success', 'Thông báo đã được xóa!');
    }
}
