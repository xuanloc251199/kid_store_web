@extends('admin.master')
@section('content')
<div class="table-container">
  <div class="formbold-main-wrapper">
    <div class="formbold-form-wrapper">
      <form action="{{ route('admin.ticket.update', $ticket->id) }}" method="POST" enctype="multipart/form-data">
        @csrf
        @method('PUT')
        <div class="formbold-mb-5">
          <label for="name" class="formbold-form-label"> Name </label>
          <input type="text" name="name" id="name" value="{{ $ticket->name }}" class="formbold-form-input" required />
        </div>
        <div class="formbold-mb-5">
          <label for="image" class="formbold-form-label"> Thumbnail </label>
          <input type="file" name="thumbnail" id="image" accept="image/*" class="formbold-form-input" />
          @if ($ticket->thumbnail)
            <div>
              <img src="{{ asset($ticket->thumbnail) }}" alt="Thumbnail" style="max-width: 150px; max-height: 150px; margin-top: 10px;">
            </div>
          @endif
        </div>
        <div class="formbold-mb-5">
          <label for="place" class="formbold-form-label"> Place </label>
          <input type="text" name="place" id="place" value="{{ $ticket->place }}" class="formbold-form-input" required />
        </div>
        <div class="formbold-mb-5">
          <label for="price" class="formbold-form-label"> Price </label>
          <input type="number" name="price" id="price" value="{{ $ticket->price }}" class="formbold-form-input" required />
        </div>
        <div class="formbold-mb-5">
          <label for="promotion" class="formbold-form-label"> Promotion (%) </label>
          <input type="number" name="promotion" id="promotion" value="{{ $ticket->promotion }}" class="formbold-form-input" min="0" max="100" required />
        </div>
        <div class="formbold-mb-5">
          <label for="number_ticket" class="formbold-form-label"> Quantity </label>
          <input type="number" name="number_ticket" id="number_ticket" value="{{ $ticket->number_ticket }}" class="formbold-form-input" required />
        </div>
        <div class="formbold-mb-5">
          <label for="sold" class="formbold-form-label"> Sold </label>
          <input type="number" name="sold" id="sold" value="{{ $ticket->sold }}" class="formbold-form-input" required />
        </div>
        <div class="formbold-mb-5">
          <label for="date" class="formbold-form-label"> Date </label>
          <input type="date" name="date" id="date" value="{{ $ticket->date }}" class="formbold-form-input" required />
        </div>
        <div class="formbold-mb-5">
          <label for="detail" class="formbold-form-label"> Detail </label>
          <textarea name="detail" id="detail" rows="6" class="formbold-form-input" required>{{ $ticket->detail }}</textarea>
        </div>
        <div class="formbold-mb-5">
          <label for="description" class="formbold-form-label"> Description </label>
          <textarea name="description" id="description" rows="6" class="formbold-form-input" required>{{ $ticket->description }}</textarea>
        </div>
        <button class="formbold-btn">Submit</button>
      </form>
    </div>
  </div>
</div>
@endsection
