@extends('admin.master')
@section('content')
<div class="table-container">
  <div class="button-create">
    <a href="{{route('admin.cart.create')}}">Create</a>
  </div>
  <table>
    <thead>
      <tr>
        <th>User</th>
        <th>Item</th> <!-- Đổi 'Product' thành 'Item' để có thể là sản phẩm hoặc vé -->
        <th>Quantity</th>
        <th>Action</th>
      </tr>
    </thead>
    <tbody>
      @foreach ($carts as $item)
      <tr>
        <td>{{ $item->user->name ?? 'Người dùng không tồn tại' }}</td>

        <td>
          @if ($item->type == 'product' && $item->product)
            {{ $item->product->name }}
          @elseif ($item->type == 'ticket' && $item->ticket)
            {{ $item->ticket->name }}
          @else
            {{ 'Sản phẩm hoặc vé không tồn tại' }}
          @endif
        </td>

        <td>{{ $item->quantity }}</td>
        <td style="text-align:center;">
          <a class="button-action" href="{{route('admin.cart.edit', ['cart' => $item->id])}}">Edit</a>
          <form action="{{ route('admin.cart.destroy', ['cart' => $item->id]) }}" method="POST" style="display: inline-block;">
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
    <a href="{{route('admin.cart.create')}}">Create</a>
  </div>
</div>
@endsection
