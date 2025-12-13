<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\ProductsController;
use App\Http\Controllers\API\InvoicesController;


// ========== ROUTE CHÍNH ==========
Route::get('/', function () {
    return response()->json([
        'app' => 'PhoneStore API',
        'version' => '1.0',
        'status' => 'online',
        'endpoints' => [
            'products' => '/api/products',
            'orders' => '/api/orders',
            'stats' => '/api/products/stats',
            'filter_options' => '/api/products/filter-options',
            'brands' => '/api/products/brands',
            'categories' => '/api/products/categories'
        ],
        'timestamp' => now()->toDateTimeString()
    ]);
});

// ========== ROUTE PRODUCTS ==========
Route::prefix('products')->group(function () {
    Route::get('/', [ProductsController::class, 'index']);
    Route::get('/stats', [ProductsController::class, 'stats']);
    Route::get('/filter-options', [ProductsController::class, 'filterOptions']);
    Route::get('/brands', [ProductsController::class, 'getBrands']);
    Route::get('/categories', [ProductsController::class, 'getCategories']);
    Route::post('/', [ProductsController::class, 'store']);
    Route::get('/{id}', [ProductsController::class, 'show']);
    Route::put('/{id}', [ProductsController::class, 'update']);
    Route::delete('/{id}', [ProductsController::class, 'destroy']);
});


// ========== ROUTE ORDERS (INVOICES) ==========
Route::prefix('orders')->group(function () {
    Route::get('/', [InvoicesController::class, 'index']);          // Lấy danh sách đơn hàng
    Route::get('/stats', [InvoicesController::class, 'stats']);     // Lấy thống kê
    Route::get('/{id}', [InvoicesController::class, 'show']);       // Lấy chi tiết 1 đơn hàng
    Route::post('/', [InvoicesController::class, 'store']);         // Tạo đơn hàng mới
    Route::put('/{id}', [InvoicesController::class, 'update']);     // Cập nhật đơn hàng
    Route::delete('/{id}', [InvoicesController::class, 'destroy']); // Xóa đơn hàng
    Route::put('/{id}/status', [InvoicesController::class, 'updateStatus']); // Cập nhật trạng thái
});
