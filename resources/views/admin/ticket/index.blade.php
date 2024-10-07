@extends('admin.master')
@section('content')
<div class="table-container">
    <div class="button-create">
        <a href="{{ route('admin.ticket.create') }}">Create</a>
    </div>
    <form action="{{ route('admin.ticket.setPromotionForAll') }}" method="POST">
        @csrf
        @method('PUT')
        <div class="formbold-mb-5">
            <input type="number" name="promotion" id="promotion" placeholder="Enter discount percentage"
                class="formbold-form-input" min="0" max="100" required />
            <button type="submit" class="button-action">Set Promotion for All</button>
        </div>
    </form>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Thumbnail</th>
                <th>Name</th>
                <th>Place</th>
                <th>Date</th>
                <th>Price (VNĐ)</th>
                <th>Promotion (%)</th>
                <th>Final Price (VNĐ)</th>
                <th>Quantity</th>
                <th>Sold</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($tickets as $item)
                <tr>
                    <td>{{ $item->id }}</td>
                    <td style="text-align:center;">
                        <img style="max-width:75px; max-height: 75px; object-fit:cover;" src="{{ asset($item->thumbnail) }}" alt="{{ $item->name }}">
                    </td>
                    <td>{{ $item->name }}</td>
                    <td>{{ $item->place }}</td>
                    <td>{{ $item->date }}</td>
                    <td>{{ number_format($item->price, 0, ',', '.') }} VNĐ</td>
                    <td>{{ $item->promotion }}%</td>
                    <td>
                        @if ($item->promotion > 0)
                            {{ number_format($item->price * (1 - $item->promotion / 100), 0, ',', '.')}} VNĐ
                        @else
                            {{ number_format($item->price, 0, ',', '.')}} VNĐ 
                        @endif
                    </td>
                    <td>{{ $item->number_ticket }}</td>
                    <td>{{ $item->sold }}</td>
                    <td style="text-align:center;">
                        <a class="button-action" href="{{ route('admin.ticket.edit', ['ticket' => $item->id]) }}">Edit</a>
                        <form action="{{ route('admin.ticket.destroy', ['ticket' => $item->id]) }}" method="POST" style="display:inline-block;">
                            @csrf
                            @method('DELETE')
                            <button class="button-action" type="submit" style="cursor: pointer;">Delete</button>
                        </form>
                    </td>
                </tr>
            @endforeach
        </tbody>
    </table>
    <div class="button-create">
        <a href="{{ route('admin.ticket.create') }}">Create</a>
    </div>
</div>
@endsection
