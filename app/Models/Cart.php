<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cart extends Model
{
    use HasFactory;

    protected $table = 'cart';

    // Khai báo các trường có thể được gán hàng loạt
    protected $fillable = [
        'user_id',
        'product_id',
        'ticket_id',
        'quantity',
        'type', // Phân biệt giữa sản phẩm và vé
    ];

    /**
     * Quan hệ với model Product.
     * Sản phẩm được liên kết với cart qua product_id
     */
    public function product()
    {
        return $this->belongsTo(Product::class);
    }

    /**
     * Quan hệ với model Ticket.
     * Vé được liên kết với cart qua ticket_id
     */
    public function ticket()
    {
        return $this->belongsTo(Ticket::class);
    }

    /**
     * Quan hệ với model User.
     * Mỗi cart thuộc về một user.
     */
    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
