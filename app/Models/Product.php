<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    // Các trường có thể được gán hàng loạt (mass-assignable)
    protected $fillable = [
        'name',
        'category_id',
        'detail',
        'description',
        'price',
        'thumbnail',
        'sold',
        'quantity',
    ];

    // Nếu bạn có các trường ngày tháng
    protected $dates = [
        'created_at',
        'updated_at',
    ];

    // Định nghĩa mối quan hệ với bảng Category (nếu có)
    public function category()
    {
        return $this->belongsTo(Category::class);
    }
}