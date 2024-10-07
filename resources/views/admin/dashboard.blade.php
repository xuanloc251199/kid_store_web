@extends('admin.master')

@section('card')
<div class="card">
    <div>
        <div class="numbers">{{ $orderCount }}</div>
        <div class="cardName">Tổng Đơn Hàng</div>
    </div>
    <div class="iconBx">
        <ion-icon name="receipt-outline"></ion-icon>
    </div>
</div>

<div class="card">
    <div>
        <div class="numbers">{{ $totalProductsSold }}</div>
        <div class="cardName">Sản Phẩm Đã Bán</div>
    </div>
    <div class="iconBx">
        <ion-icon name="cart-outline"></ion-icon>
    </div>
</div>

<div class="card">
    <div>
        <div class="numbers">{{ $userCount }}</div>
        <div class="cardName">Người Dùng</div>
    </div>
    <div class="iconBx">
        <ion-icon name="people-outline"></ion-icon>
    </div>
</div>

<div class="card">
    <div>
        <div class="numbers">{{ number_format($totalEarnings, 2) }} VNĐ</div>
        <div class="cardName">Doanh Thu</div>
    </div>
    <div class="iconBx">
        <ion-icon name="cash-outline"></ion-icon>
    </div>
</div>
@endsection
