<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\Order;
use Illuminate\Http\Request;

class U_OrderController extends Controller
{
    /**
     * Lấy danh sách đơn hàng đã thanh toán.
     */
    public function getPaidOrders()
    {
        // Lấy danh sách các đơn hàng đã thanh toán
        $paidOrders = Order::where('status', 'paid')->with('user', 'orderItems.product')->get();

        return response()->json([
            'success' => true,
            'orders' => $paidOrders
        ], 200);
    }
}
