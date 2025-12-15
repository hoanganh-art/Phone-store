<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\ProductsController;
use App\Http\Controllers\API\InvoicesController;
use App\Http\Controllers\API\invoicesController as APIInvoicesController;
use App\Http\Controllers\CustomersController;
use App\Http\Controllers\EmployeesController;

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

// API routes cho đơn hàng
Route::prefix('api')->group(function () {
    // Đơn hàng
    Route::get('/orders', [InvoicesController::class, 'index']);
    Route::get('/orders/stats', [InvoicesController::class, 'stats']);
    Route::get('/orders/{id}', [InvoicesController::class, 'show']);
    Route::post('/orders', [InvoicesController::class, 'store']);
    Route::put('/orders/{id}', [InvoicesController::class, 'update']);
    Route::put('/orders/{id}/status', [InvoicesController::class, 'updateStatus']);
    Route::delete('/orders/{id}', [InvoicesController::class, 'destroy']);

    // Khách hàng
    Route::get('/customers', [CustomersController::class, 'index']);

    // Nhân viên
    Route::get('/employees', [EmployeesController::class, 'index']);
});
