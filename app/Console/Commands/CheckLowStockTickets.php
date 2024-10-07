<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\Ticket;
use App\Services\NotificationService;

class CheckLowStockTickets extends Command
{
    protected $signature = 'check:low-stock-tickets';
    protected $description = 'Kiểm tra và gửi thông báo khi vé bán được hơn 70%';

    protected $notificationService;

    public function __construct(NotificationService $notificationService)
    {
        parent::__construct();
        $this->notificationService = $notificationService;
    }

    public function handle()
    {
        // Lấy tất cả các vé
        $tickets = Ticket::all();

        foreach ($tickets as $ticket) {
            // Nếu vé đã bán hơn 70%, gửi thông báo
            if ($ticket->isLowStock()) {
                $this->notificationService->sendLowStockNotificationForTickets($ticket);
            }
        }

        $this->info('Checked tickets for low stock.');
    }
}
