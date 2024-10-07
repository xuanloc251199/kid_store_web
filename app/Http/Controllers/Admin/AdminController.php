<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Order;
use App\Models\Product;
use App\Models\User;
use Illuminate\Http\Request;

class AdminController extends Controller
{
    public function index(Request $request)
    {
        $orderCount = Order::count();
        $totalProductsSold = Product::sum('sold');
        $userCount = User::count();
        $totalEarnings = Order::sum('total_price');

        $selectedYear = $request->query('year', date('Y'));

        $monthlyRevenue = Order::selectRaw('MONTH(created_at) as month, SUM(total_price) as revenue')
            ->when($selectedYear !== 'all', function ($query) use ($selectedYear) {
                $query->whereYear('created_at', $selectedYear);
            })
            ->groupBy('month')
            ->orderBy('month')
            ->get();

        if ($request->ajax()) {
            return response()->json(['monthlyRevenue' => $monthlyRevenue]);
        }

        return view('admin.dashboard', compact(
            'orderCount',
            'totalProductsSold',
            'userCount',
            'totalEarnings',
            'monthlyRevenue',
            'selectedYear'
        ));
    }
}
