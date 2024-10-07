<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ProductsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $categories = [1, 2, 3, 10, 11, 12];
        $thumbnail = 'thumbnails/products/product_1728150572.jpg';
        $products = [];

        foreach ($categories as $category_id) {
            for ($i = 1; $i <= 10; $i++) {
                $products[] = [
                    'name' => 'Product ' . $i . ' Category ' . $category_id,
                    'category_id' => $category_id,
                    'detail' => 'Detail for Product ' . $i . ' in Category ' . $category_id,
                    'description' => 'Description for Product ' . $i . ' in Category ' . $category_id,
                    'price' => rand(1000, 10000) / 100, // Tạo giá ngẫu nhiên từ 10.00 đến 100.00
                    'thumbnail' => $thumbnail,
                    'sold' => rand(1, 100), // Số lượng bán ngẫu nhiên từ 1 đến 100
                    'quantity' => rand(50, 200), // Số lượng tồn kho ngẫu nhiên từ 50 đến 200
                    'created_at' => now(),
                    'updated_at' => now(),
                ];
            }
        }

        // Chèn dữ liệu vào bảng products
        DB::table('products')->insert($products);
    }
}
