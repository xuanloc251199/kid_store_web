@extends('admin.master')

@section('content')
    <div class="table-container">
        <div class="formbold-main-wrapper">
            <div class="formbold-form-wrapper">
                <form action="{{ route('admin.notification.store') }}" method="POST">
                    @csrf
                    <div class="formbold-mb-5">
                        <label for="title" class="formbold-form-label"> Tiêu đề </label>
                        <input type="text" name="title" id="title" placeholder="Nhập tiêu đề thông báo"
                            class="formbold-form-input" required />
                    </div>

                    <div class="formbold-mb-5">
                        <label for="message" class="formbold-form-label"> Nội dung </label>
                        <textarea rows="6" name="message" id="message" placeholder="Nhập nội dung thông báo" class="formbold-form-input"
                            required></textarea>
                    </div>

                    <div class="formbold-mb-5">
                        <label for="type" class="formbold-form-label"> Loại thông báo </label>
                        <select class="select-css" name="type" id="type" required>
                            <option value="success">Thành công</option>
                            <option value="error">Lỗi</option>
                            <option value="warning">Cảnh báo</option>
                            <option value="promotion">Ưu đãi/Khuyến mãi</option>
                        </select>
                    </div>


                    <div>
                        <button class="formbold-btn">Gửi thông báo</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection
