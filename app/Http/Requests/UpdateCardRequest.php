<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdateCardRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize()
    {
        return true; // Hoặc logic để xác thực quyền truy cập
    }

    public function rules()
    {
        return [
            'card_number' => 'required|string|min:16|max:16',
            'expiry_date' => 'required|string',
            'cvv' => 'required|digits:3',
        ];
    }
}
