@extends('admin.master')

@section('card')
    <div class="card">
        <div>
            <div class="numbers">{{ $orderCount }}</div>
            <div class="cardName">Tổng Đơn Hàng</div>
        </div>
        <div class="iconBx">
            <ion-icon name="receipt-outline"></ion-icon>
        </div>
    </div>

    <div class="card">
        <div>
            <div class="numbers">{{ $totalProductsSold }}</div>
            <div class="cardName">Sản Phẩm Đã Bán</div>
        </div>
        <div class="iconBx">
            <ion-icon name="cart-outline"></ion-icon>
        </div>
    </div>

    <div class="card">
        <div>
            <div class="numbers">{{ $userCount }}</div>
            <div class="cardName">Người Dùng</div>
        </div>
        <div class="iconBx">
            <ion-icon name="people-outline"></ion-icon>
        </div>
    </div>

    <div class="card">
        <div>
            <div class="numbers">{{ number_format($totalEarnings, 2) }} VNĐ</div>
            <div class="cardName">Doanh Thu</div>
        </div>
        <div class="iconBx">
            <ion-icon name="cash-outline"></ion-icon>
        </div>
    </div>
@endsection

@section('content')
    <div class="container">
        <h2 class="title">Doanh Thu Theo Tháng</h2>

        <!-- Dropdown Bộ lọc -->
        {{-- <div class="filters">
            <div class="dropdown">
                <button id="yearDropdown" class="dropdown-toggle">Chọn Năm</button>
                <div id="yearMenu" class="dropdown-menu">
                    <a href="#" data-year="all">Tất Cả</a>
                    @for ($year = now()->year; $year >= 2000; $year--)
                        <a href="#" data-year="{{ $year }}">{{ $year }}</a>
                    @endfor
                </div>
            </div>
            <div class="dropdown">
                <button id="monthDropdown" class="dropdown-toggle">Chọn Tháng</button>
                <div id="monthMenu" class="dropdown-menu">
                    <a href="#" data-month="all">Tất Cả</a>
                    @for ($month = 1; $month <= 12; $month++)
                        <a href="#" data-month="{{ $month }}">Tháng {{ $month }}</a>
                    @endfor
                </div>
            </div>
        </div> --}}

        <!-- Bảng Thống Kê -->
        <div class="table-container">
            <table class="revenue-table">
                <thead>
                    <tr>
                        <th>Tháng</th>
                        <th>Doanh Thu (VNĐ)</th>
                    </tr>
                </thead>
                <tbody id="revenueTableBody">
                    @foreach ($monthlyRevenue as $revenue)
                        <tr>
                            <td>Tháng {{ $revenue->month }}</td>
                            <td>{{ number_format($revenue->revenue, 0, ',', '.') }}</td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>

        <!-- Biểu Đồ -->
        <div class="chart-container">
            <canvas id="revenueChart"></canvas>
        </div>
    </div>

    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        let originalData = @json($monthlyRevenue);

        document.addEventListener("DOMContentLoaded", function() {
            renderChart(originalData);

            document.getElementById('yearMenu').addEventListener('click', function(e) {
                if (e.target.tagName === 'A') {
                    e.preventDefault();
                    const selectedYear = e.target.dataset.year;
                    document.getElementById('yearDropdown').innerText = e.target.innerText;
                    updateChart(selectedYear, null);
                }
            });

            document.getElementById('monthMenu').addEventListener('click', function(e) {
                if (e.target.tagName === 'A') {
                    e.preventDefault();
                    const selectedMonth = e.target.dataset.month;
                    document.getElementById('monthDropdown').innerText = e.target.innerText;
                    updateChart(null, selectedMonth);
                }
            });
        });

        function updateChart(year = 'all', month = 'all') {
            let filteredData = originalData;

            if (year && year !== 'all') {
                filteredData = filteredData.filter(data => data.year == year);
            }

            if (month && month !== 'all') {
                filteredData = filteredData.filter(data => data.month == month);
            }

            renderChart(filteredData);
            updateTable(filteredData);
        }

        function renderChart(data) {
            const ctx = document.getElementById('revenueChart').getContext('2d');
            const chartData = {
                labels: data.map(item => `Tháng ${item.month}`),
                datasets: [{
                    label: 'Doanh Thu (VNĐ)',
                    data: data.map(item => item.revenue),
                    backgroundColor: 'rgba(54, 162, 235, 0.2)',
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 1
                }]
            };

            window.revenueChart = new Chart(ctx, {
                type: 'bar',
                data: chartData,
                options: {
                    responsive: true,
                    plugins: {
                        legend: {
                            display: true,
                            position: 'top'
                        }
                    },
                    scales: {
                        y: {
                            beginAtZero: true,
                            ticks: {
                                callback: function(value) {
                                    return new Intl.NumberFormat('vi-VN', {
                                        style: 'currency',
                                        currency: 'VND'
                                    }).format(value);
                                }
                            }
                        }
                    }
                }
            });
        }
    </script>
@endsection
