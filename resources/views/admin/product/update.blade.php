@extends('admin.master')
@section('content')
<div class="table-container">
  <div class="formbold-main-wrapper">
    <div class="formbold-form-wrapper">
      <form action="{{ route('admin.product.update', $products->id) }}" method="POST" enctype="multipart/form-data">
        @csrf
        @method('PUT')
        
        <!-- Name -->
        <div class="formbold-mb-5">
          <label for="name" class="formbold-form-label"> Name </label>
          <input type="text" name="name" id="name" value="{{ old('name', $products->name) }}" class="formbold-form-input" required />
        </div>

        <!-- Category -->
        <div class="formbold-mb-5">
          <label for="Category" class="formbold-form-label"> Category </label>
          <select class="select-css" name="category_id" id="Category" required>
            @foreach ($categories as $item)
              <option value="{{ $item->id }}" {{ ($products->category_id == $item->id) ? "selected" : "" }}>{{ $item->name }}</option>
            @endforeach
          </select>
        </div>

        <!-- Thumbnail -->
        <div class="formbold-mb-5">
          <label for="image" class="formbold-form-label"> Thumbnail </label>
          <input type="file" name="thumbnail" id="image" accept="image/*" class="formbold-form-input" />

          <!-- Hiển thị hình ảnh hiện tại nếu có -->
          @if ($products->thumbnail)
            <div>
              <img src="{{ asset($products->thumbnail) }}" alt="Thumbnail" style="max-width: 150px; max-height: 150px; margin-top: 10px;">
            </div>
          @endif
        </div>

        <!-- Price -->
        <div class="formbold-mb-5">
          <label for="price" class="formbold-form-label"> Price </label>
          <input type="number" name="price" id="price" value="{{ old('price', $products->price) }}" class="formbold-form-input" required />
        </div>

        <!-- Quantity -->
        <div class="formbold-mb-5">
          <label for="quantity" class="formbold-form-label"> Quantity </label>
          <input type="number" name="quantity" id="quantity" value="{{ old('quantity', $products->quantity) }}" class="formbold-form-input" required />
        </div>

        <!-- Promotion -->
        <div class="formbold-mb-5">
          <label for="promotion" class="formbold-form-label"> Promotion (%) </label>
          <input type="number" name="promotion" id="promotion" value="{{ old('promotion', $products->promotion) }}" class="formbold-form-input" min="0" max="100" required />
        </div>

        <!-- Detail -->
        <div class="formbold-mb-5">
          <label for="detail" class="formbold-form-label"> Detail </label>
          <textarea rows="6" name="detail" id="FormControlTextarea1" class="formbold-form-input">{{ old('detail', $products->detail) }}</textarea>
        </div>

        <!-- Description -->
        <div class="formbold-mb-5">
          <label for="description" class="formbold-form-label"> Description </label>
          <textarea rows="6" name="description" id="FormControlTextarea2" class="formbold-form-input">{{ old('description', $products->description) }}</textarea>
        </div>

        <!-- Submit Button -->
        <div>
          <button type="submit" class="formbold-btn">Submit</button>
        </div>
      </form>
    </div>
  </div>
</div>
@endsection
