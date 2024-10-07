@extends('admin.master')

@section('content')
    <h1>Chi tiết Thông báo</h1>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Tiêu đề</th>
                <th>Nội dung</th>
                <th>Người nhận</th>
                <th>Ngày tạo</th>
                <th>Hành động</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($notifications as $notification)
                <tr>
                    <td>{{ $notification->id }}</td>
                    <td>{{ $notification->title }}</td>
                    <td>{{ $notification->message }}</td>
                    <td>{{ $notification->user->name }}</td>
                    <td>{{ $notification->created_at ? $notification->created_at->format('d/m/Y H:i') : 'Chưa có dữ liệu' }}</td>
                    <td>
                        <form action="{{ route('admin.notification.destroy', $notification['id']) }}" method="POST" style="display:inline;">
                            @csrf
                            @method('DELETE')
                            <button type="submit" onclick="return confirm('Bạn có chắc muốn xóa thông báo này?')" class="button-action">Xóa</button>
                        </form>
                    </td>
                </tr>
            @endforeach
        </tbody>
    </table>

    <a href="{{ route('admin.notification.index') }}" class="button-action">Quay lại</a>
@endsection
