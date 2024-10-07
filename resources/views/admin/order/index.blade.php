@extends('admin.master')

@section('content')
    <div class="table-container">
        <h1>Danh sách Đơn hàng</h1>

        @if (session('success'))
            <script>
                document.addEventListener('DOMContentLoaded', function() {
                    Swal.fire({
                        icon: 'success',
                        title: 'Thành công!',
                        text: '{{ session('success') }}',
                        confirmButtonText: 'OK'
                    });
                });
            </script>
        @endif

        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Tên Khách hàng</th>
                    <th>Email</th>
                    <th>Số điện thoại</th>
                    <th>Tổng tiền</th>
                    <th>Trạng thái</th>
                    <th>Ngày đặt</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($orders as $order)
                    <tr>
                        <td>{{ $order->id }}</td>
                        <td>{{ $order->user->name ?? 'Không xác định' }}</td>
                        <td>{{ $order->user->email ?? 'Không xác định' }}</td>
                        <td>{{ $order->user->number_phone ?? 'Chưa cung cấp' }}</td>
                        <td>{{ number_format($order->total_price, 2) }} VNĐ</td>
                        <td>{{ $order->status }}</td>
                        <td>{{ $order->created_at->format('d/m/Y') }}</td>
                        <td>
                            <a href="{{ route('admin.order.show', $order->id) }}" class="button-action">Xem chi tiết</a>
                            <form action="{{ route('admin.order.destroy', $order->id) }}" method="POST" style="display:inline;">
                                @csrf
                                @method('DELETE')
                                <button type="submit" onclick="return confirm('Bạn có chắc muốn xóa đơn hàng này?')" class="button-action">
                                    Xóa
                                </button>
                            </form>
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>
@endsection
