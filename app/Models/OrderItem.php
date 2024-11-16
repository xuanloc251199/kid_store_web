<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrderItem extends Model
{
    use HasFactory;

    protected $fillable = [
        'order_id',
        'product_id',
        'ticket_id',
        'quantity',
        'price',
    ];

    // Quan hệ với model Product
    public function product()
    {
        return $this->belongsTo(Product::class);
    }

    // Quan hệ với model Ticket
    public function ticket()
    {
        return $this->belongsTo(Ticket::class);
    }

    // Quan hệ với model Order
    public function order()
    {
        return $this->belongsTo(Order::class);
    }
}
