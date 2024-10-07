<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserCard extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'card_number',
        'expiry_date',
        'cvv',
    ];

    // Mã hóa khi lưu thẻ vào database
    public function setCardNumberAttribute($value)
    {
        $this->attributes['card_number'] = encrypt($value);
    }

    public function setExpiryDateAttribute($value)
    {
        $this->attributes['expiry_date'] = encrypt($value);
    }

    public function setCvvAttribute($value)
    {
        $this->attributes['cvv'] = encrypt($value);
    }

    // Giải mã khi lấy thẻ ra
    public function getCardNumberAttribute($value)
    {
        return decrypt($value);
    }

    public function getExpiryDateAttribute($value)
    {
        return decrypt($value);
    }

    public function getCvvAttribute($value)
    {
        return decrypt($value);
    }
}
