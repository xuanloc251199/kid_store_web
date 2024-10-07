@extends('admin.master')

@section('content')
    <h1>Danh sách Thông báo</h1>

    @if (session('success'))
        <p style="color: green">{{ session('success') }}</p>
    @endif
    <a href="{{ route('admin.notification.create') }}" class="button-action">Tạo Thông báo</a>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Tiêu đề</th>
                <th>Nội dung</th>
                <th>Loại</th>
                <th>Ngày tạo</th>
                <th>Người nhận</th>
                <th>Hành động</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($notifications as $notification)
                <tr>
                    <td>{{ $loop->iteration }}</td>
                    <td>{{ $notification['title'] }}</td>
                    <td>{{ $notification['message'] }}</td>
                    <td>{{ ucfirst($notification['type']) }}</td>
                    <td>{{ $notification['created_at'] ? $notification['created_at']->format('d/m/Y H:i') : 'Chưa có dữ liệu' }}</td>
                    <td>{{ $notification['users'] }}</td>
                    <td>
                        @if ($notification['is_group'])
                            <a href="{{ route('admin.notification.showGroupDetails', implode(',', $notification['ids'])) }}" class="button-action">Xem Chi Tiết</a>
                        @else
                            <form action="{{ route('admin.notification.destroy', $notification['ids'][0]) }}" method="POST" style="display:inline;">
                                @csrf
                                @method('DELETE')
                                <button type="submit" onclick="return confirm('Bạn có chắc muốn xóa thông báo này?')" class="button-action">Xóa</button>
                            </form>
                        @endif
                    </td>
                </tr>
            @endforeach
        </tbody>
    </table>
@endsection
