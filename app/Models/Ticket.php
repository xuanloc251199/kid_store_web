<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Ticket extends Model
{
    protected $fillable = [
        'name',
        'thumbnail',
        'place',
        'date',
        'detail',
        'description',
        'price',
        'number_ticket',
        'sold',
    ];

    protected $dates = [
        'created_at',
        'updated_at',
    ];

    // Phương thức kiểm tra vé đã bán được 70% chưa
    public function isLowStock()
    {
        $totalTickets = $this->number_ticket + $this->sold;
        $soldPercentage = ($this->sold / $totalTickets) * 100;

        return $soldPercentage >= 70;
    }
}
