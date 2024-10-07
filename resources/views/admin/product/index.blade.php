@extends('admin.master')
@section('content')
    <div class="table-container">
        <div class="button-create">
            <a href="{{ route('admin.product.create') }}">Create</a>
        </div>
        <form action="{{ route('admin.product.setPromotionForAll') }}" method="POST">
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
                    <th>Id</th>
                    <th>Image</th>
                    <th>Name</th>
                    <th>Category</th>
                    <th>Detail</th>
                    <th>Description</th>
                    <th>Promotion (%)</th>
                    <th>Price</th>
                    <th>Price After Promotion</th>
                    <th>Sold</th>
                    <th>Quantity</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($products as $item)
                    <tr>
                        <td>{{ $item->id }}</td>
                        <td style="text-align:center;"><img style="max-width:75px; max-height: 75px; object-fit:cover; "
                                src="{{ asset($item->thumbnail) }}" alt="{{ $item->name }}"></td>
                        <td>{{ $item->name }}</td>
                        <td>{!! $item->category->name !!}</td>
                        <td>{!! $item->detail !!}</td>
                        <td>{!! $item->description !!}</td>
                        <td>{{ $item->promotion }}%</td>
                        <td>{{ number_format($item->price, 0, ',', '.') }} VNĐ</td>
                        <td>
                            @if ($item->promotion > 0)
                                {{ number_format($item->price * (1 - $item->promotion / 100), 0, ',', '.') }} VNĐ
                            @else
                                Không giảm
                            @endif
                        </td>
                        <td>{!! $item->sold !!}</td>
                        <td>{!! $item->quantity !!}</td>
                        <td style="text-align:center;">
                            <a class="button-action"
                                href="{{ route('admin.product.edit', ['product' => $item->id]) }}">Edit</a>
                            <form action="{{ route('admin.product.destroy', ['product' => $item->id]) }}" method="POST">
                                @csrf
                                @method('DELETE') <!-- Create phương thức DELETE -->
                                <button class="button-action" type="submit" style=" cursor: pointer;">Delete</button>
                            </form>
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
        <div class="button-create">
            <a href="{{ route('admin.product.create') }}">Create</a>
        </div>
    </div>
@endsection
