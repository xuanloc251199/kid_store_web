@extends('admin.master')

@section('content')
    <div class="table-container">
        <h1>Chi tiết Đơn hàng #{{ $order->id }}</h1>

        <h2>Thông tin Khách hàng</h2>
        <p><strong>Tên:</strong> {{ $order->user->name }}</p>
        <p><strong>Email:</strong> {{ $order->user->email }}</p>
        <p><strong>Số điện thoại:</strong> {{ $order->user->number_phone ?? 'Chưa cung cấp' }}</p>
        <p><strong>Địa chỉ:</strong> {{ $order->user->address ?? 'Chưa cung cấp' }}</p>

        <h2>Thông tin Đơn hàng</h2>
        <p><strong>Trạng thái:</strong> {{ $order->status }}</p>
        <p><strong>Tổng tiền:</strong> {{ number_format($order->total_price, 2) }} VNĐ</p>
        <p><strong>Ngày đặt:</strong> {{ $order->created_at->format('d/m/Y') }}</p>

        <h2>Sản phẩm trong Đơn hàng</h2>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Tên Sản phẩm</th>
                    <th>Số lượng</th>
                    <th>Giá</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($order->orderItems as $item)
                    <tr>
                        <td>{{ $item->id }}</td>
                        <td>{{ $item->product->name ?? 'Vé sự kiện' }}</td>
                        <td>{{ $item->quantity }}</td>
                        <td>{{ number_format($item->price, 2) }} VNĐ</td>
                    </tr>
                @endforeach
            </tbody>
        </table>

        <a href="{{ route('admin.order.index') }}" class="button-action">Quay lại</a>
    </div>
@endsection
