<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\ProductsController;
use App\Http\Controllers\API\InvoicesController;
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

// ========== ROUTE INVOICES/ORDERS ==========
Route::prefix('orders')->group(function () {
    Route::get('/', [InvoicesController::class, 'index']);
    Route::get('/stats', [InvoicesController::class, 'stats']);
    Route::get('/{id}', [InvoicesController::class, 'show']);
    Route::post('/', [InvoicesController::class, 'store']);
    Route::put('/{id}', [InvoicesController::class, 'update']);
    Route::put('/{id}/status', [InvoicesController::class, 'updateStatus']);
    Route::delete('/{id}', [InvoicesController::class, 'destroy']);
});

// ========== ROUTE CUSTOMERS ==========
Route::prefix('customers')->group(function () {
    Route::get('/', [CustomersController::class, 'index']);
});

// ========== ROUTE EMPLOYEES ==========
Route::prefix('employees')->group(function () {
    Route::get('/', [EmployeesController::class, 'index']);
});
