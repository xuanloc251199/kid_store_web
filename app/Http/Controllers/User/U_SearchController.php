<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Ticket;
use Illuminate\Support\Facades\DB;

class U_SearchController extends Controller
{
    public function search(Request $request)
    {
        $query = $request->input('query');

        // Kiểm tra nếu từ khóa rỗng
        if (!$query) {
            return response()->json(['message' => 'Bạn chưa nhập từ khóa tìm kiếm'], 400);
        }

        // Tìm kiếm sản phẩm
        $products = Product::where(DB::raw('LOWER(name)'), 'LIKE', '%' . strtolower($query) . '%')
            ->orWhere(DB::raw('LOWER(description)'), 'LIKE', '%' . strtolower($query) . '%')
            ->orWhere(DB::raw('LOWER(detail)'), 'LIKE', '%' . strtolower($query) . '%')
            ->get();

        // Tìm kiếm vé
        $tickets = Ticket::where(DB::raw('LOWER(name)'), 'LIKE', '%' . strtolower($query) . '%')
            ->orWhere(DB::raw('LOWER(description)'), 'LIKE', '%' . strtolower($query) . '%')
            ->orWhere(DB::raw('LOWER(place)'), 'LIKE', '%' . strtolower($query) . '%')
            ->get();

        // Nếu không có kết quả
        if ($products->isEmpty() && $tickets->isEmpty()) {
            return response()->json(['error' => 'Không tìm thấy kết quả nào cho từ khóa: ' . $query], 404);
        }

        // Trả về kết quả tìm kiếm cho cả sản phẩm và vé
        return response()->json([
            'products' => $products,
            'tickets' => $tickets,
        ], 200);
    }
}

