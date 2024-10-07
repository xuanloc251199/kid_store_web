<?php

namespace App\Services;

class PaymentService
{
    public function processPayment($paymentInfo, $totalAmount)
    {
        // Giả lập thanh toán, bạn cần thay bằng tích hợp thực tế với cổng thanh toán
        if (strpos($paymentInfo['card_number'], '1234') === 0) {
            return [
                'success' => true, // Thanh toán thành công
            ];
        }
        return [
            'success' => false, // Thanh toán thất bại
            'error' => 'Thẻ không hợp lệ', // Lý do thất bại
        ];
    }
}
