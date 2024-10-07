<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Order;

class RevenueController extends Controller
{
    public function index()
    {
        // Lấy dữ liệu doanh thu theo tháng
        $monthlyRevenue = Order::selectRaw('MONTH(created_at) as month, SUM(total_price) as revenue')
            ->groupBy('month')
            ->orderBy('month')
            ->get();

        // Tổng doanh thu
        $totalRevenue = $monthlyRevenue->sum('revenue');

        // Tháng có doanh thu cao nhất và thấp nhất
        $highestRevenueMonth = $monthlyRevenue->sortByDesc('revenue')->first();
        $lowestRevenueMonth = $monthlyRevenue->sortBy('revenue')->first();

        return view('revenue.index', compact('monthlyRevenue', 'totalRevenue', 'highestRevenueMonth', 'lowestRevenueMonth'));
    }
}
