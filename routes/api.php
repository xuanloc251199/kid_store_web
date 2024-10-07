<?php

use App\Http\Controllers\Admin\CartController;
use App\Http\Controllers\Admin\CategoryController;
use App\Http\Controllers\Admin\ProductController;
use App\Http\Controllers\Admin\ReviewController;
use App\Http\Controllers\Admin\TicketController;
use App\Http\Controllers\Admin\UserController;

use App\Http\Controllers\User\U_AuthController;
use App\Http\Controllers\User\U_CategoryController;
use App\Http\Controllers\User\U_SearchController;
use App\Http\Controllers\User\U_ProductController;
use App\Http\Controllers\User\U_TicketController;
use App\Http\Controllers\User\U_UserController;
use App\Http\Controllers\User\U_ReviewController;
use App\Http\Controllers\User\U_CartController;
use App\Http\Controllers\User\U_PaymentController;
use App\Http\Controllers\User\U_NotificationController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/



Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

####################### User #######################

## Auth ##

## Auth ##
Route::prefix('u')->group(function () {
    Route::post('/register', [U_AuthController::class, 'register']);
    Route::post('/login', [U_AuthController::class, 'login']);
    Route::post('/logout', [U_AuthController::class, 'logout'])->middleware('auth:sanctum');
    Route::put('/update', [U_AuthController::class, 'updateProfile'])->middleware('auth:sanctum');
    Route::get('/profile', [U_AuthController::class, 'showProfile'])->middleware('auth:sanctum');
    
    Route::get('/search', [U_SearchController::class, 'search']);
});

Route::prefix('u/cards')->group(function() {
    Route::get('/show', [U_PaymentController::class, 'show'])->middleware('auth:sanctum');
    Route::get('/getCardById/{id?}',[U_PaymentController::class, 'getCardById'])->middleware('auth:sanctum');
    Route::post('/directPayment',[U_PaymentController::class, 'directPayment'])->middleware('auth:sanctum');
    Route::post('/store', [U_PaymentController::class, 'storeCard'])->middleware('auth:sanctum');
    Route::put('/update/{id}', [U_PaymentController::class, 'updateCard'])->middleware('auth:sanctum');
    Route::post('/processPayment', [U_PaymentController::class, 'processPayment'])->middleware('auth:sanctum');
    Route::get('/purchases', [U_PaymentController::class, 'getPurchasedItems'])->middleware('auth:sanctum');
});

## User ##
Route::prefix('u/user')->group(function () {

    Route::get('/', [U_UserController::class, 'show'])->middleware('auth:sanctum');

    // Route để thêm người dùng mới (có thể không cần bảo mật)
    Route::post('/store', [U_UserController::class, 'store']);

    // Route để cập nhật người dùng
    Route::put('/update', [U_UserController::class, 'update'])->middleware('auth:sanctum');

    // Route để xóa người dùng
    Route::delete('/{id}', [U_UserController::class, 'destroy'])->middleware('auth:sanctum');
    
    // Route để cập nhật người dùng
    Route::put('/updateUserInfo', [U_UserController::class, 'updateUserInfo'])->middleware('auth:sanctum');
    
    // Route để cập nhật người dùng
    Route::get('/getPaidOrder', [U_UserController::class, 'getPaidOrder'])->middleware('auth:sanctum');
});

## Category ##
Route::prefix('u/categories')->group(function () {
    // Route để hiển thị danh sách danh mục
    Route::get('/', [U_CategoryController::class, 'index']);

    // Route để thêm danh mục mới
    Route::post('/store', [U_CategoryController::class, 'store']);

    // Route để cập nhật danh mục
    Route::put('/update/{id}', [U_CategoryController::class, 'update']);

    // Route để xóa danh mục
    Route::delete('/destroy/{id}', [U_CategoryController::class, 'destroy']);

    // Route để hiển thị sản phẩm theo danh mục
    Route::get('/{id}/products', [U_CategoryController::class, 'getProductsByCategory']);
});
## Product ##
Route::prefix('u/products')->group(function () {
    // Route để hiển thị danh sách sản phẩm
    Route::get('/', [U_ProductController::class, 'index']);

    Route::get('/search', [U_ProductController::class, 'search']);

    // Route để thêm sản phẩm mới
    Route::post('/store', [U_ProductController::class, 'store']);

    // Route để cập nhật sản phẩm
    Route::put('/update/{id}', [U_ProductController::class, 'update']);

    // Route để xóa sản phẩm
    Route::delete('/destroy/{id}', [U_ProductController::class, 'destroy']);

    Route::get('/{id}', [U_ProductController::class, 'show']);

    Route::get('/category/{category_id}', [U_ProductController::class, 'getProductsByCategory']);
});
## Tickets ##
Route::prefix('u/tickets')->group(function () {
    // Route để hiển thị danh sách vé
    Route::get('', [U_TicketController::class, 'index']);

    // Route để thêm vé mới
    Route::post('/store', [U_TicketController::class, 'store']);

    // Route để cập nhật vé
    Route::put('/update/{id}', [U_TicketController::class, 'update']);

    Route::put('/{id}/update-sold', [U_TicketController::class, 'updateSoldTickets']);

    // Route để xóa vé
    Route::delete('/destrou/{id}', [U_TicketController::class, 'destroy']);

    Route::get('/{id}', [U_TicketController::class, 'show']);
});
## Review ##
Route::prefix('u/reviews')->group(function () {
    // Route để hiển thị danh sách đánh giá
    Route::get('/', [U_ReviewController::class, 'index']);

    // Route để thêm đánh giá mới
    Route::post('/store', [U_ReviewController::class, 'store']);

    // Route để cập nhật đánh giá
    Route::put('/update/{id}', [U_ReviewController::class, 'update']);

    // Route để xóa đánh giá
    Route::delete('/destroy/{id}', [U_ReviewController::class, 'destroy']);
});

## Notification ##
Route::prefix('u/notification')->group(function () {
    Route::get('/', [U_NotificationController::class, 'index']); // Lấy tất cả thông báo
    Route::post('/store', [U_NotificationController::class, 'store']); // Tạo thông báo mới
    Route::put('/update/{id}', [U_NotificationController::class, 'update']); // Cập nhật thông báo
    Route::delete('/destroy/{id}', [U_NotificationController::class, 'destroy']); // Xóa thông báo
    Route::get('/getUserNotifications', [U_NotificationController::class, 'getUserNotifications'])->middleware('auth:sanctum');//gửi thông báo theo user
    Route::delete('/clearAll', [U_NotificationController::class, 'clearAllNotifications'])->middleware('auth:sanctum');// Xóa toàn bộ thông báo
});

## Cart ##
Route::prefix('u/cart')->group(function () {
    // Route để hiển thị giỏ hàng
    Route::get('/', [U_CartController::class, 'index'])->middleware('auth:sanctum');

    // Route để thêm sản phẩm vào giỏ hàng
    Route::post('/store', [U_CartController::class, 'store'])->middleware('auth:sanctum');

    // Route để cập nhật số lượng sản phẩm trong giỏ hàng
    Route::put('/update/{id}', [U_CartController::class, 'update'])->middleware('auth:sanctum');

    // Route để xóa sản phẩm khỏi giỏ hàng
    Route::delete('/destroy/{id}', [U_CartController::class, 'destroy'])->middleware('auth:sanctum');

    // Route cho API checkout
    Route::post('/checkout', [U_CartController::class, 'checkout'])->middleware('auth:sanctum');
});

####################### Admin #######################
// Route::prefix('user')->group(function () {
//     Route::get('', [UserController::class, 'show'])->middleware('auth:sanctum');
//     Route::post('/store', [UserController::class, 'store']);
//     Route::put('/update', [UserController::class, 'update'])->middleware('auth:sanctum');
//     Route::delete('/{id}', [UserController::class, 'destroy'])->middleware('auth:sanctum');
// });


// Route::prefix('categories')->group(function () {
//     Route::get('', [CategoryController::class, 'index']);
//     Route::post('/store', [CategoryController::class, 'store']);
//     Route::put('/update/{id}', [CategoryController::class, 'update']);
//     Route::delete('/destroy/{id}', [CategoryController::class, 'destroy']);
//     Route::get('/{id}/products', [CategoryController::class, 'show']);
// });

// Route::prefix('product')->group(function () {
//     Route::get('', [ProductController::class, 'index']);
//     Route::post('/store', [ProductController::class, 'store']);
//     Route::put('/update/{id}', [ProductController::class, 'update']);
//     Route::delete('/destroy/{id}', [ProductController::class, 'destroy']);
// });

// Route::prefix('ticket')->group(function () {
//     Route::get('', [TicketController::class, 'index']);
//     Route::post('/store', [TicketController::class, 'store']);
//     Route::put('/update/{id}', [TicketController::class, 'update']);
//     Route::delete('/destroy/{id}', [TicketController::class, 'destroy']);
// });

// Route::prefix('review')->group(function () {
//     Route::get('', [ReviewController::class, 'index']);
//     Route::post('/store', [ReviewController::class, 'store']);
//     Route::put('/update/{id}', [ReviewController::class, 'update']);
//     Route::delete('/destroy/{id}', [ReviewController::class, 'destroy']);
// });

// Route::prefix('cart')->group(function () {
//     Route::get('', [CartController::class, 'index']);
//     Route::post('/store', [CartController::class, 'store']);
//     Route::put('/update/{id}', [CartController::class, 'update']);
//     Route::delete('/destroy/{id}', [CartController::class, 'destroy']);
// });
