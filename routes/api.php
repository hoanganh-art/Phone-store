<?php

use App\Http\Controllers\API\CustomersController;
use App\Http\Controllers\API\EmployeesController;
use App\Http\Controllers\API\InvoicesController;
use App\Http\Controllers\API\ProductsController;
use Illuminate\Support\Facades\Route;

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
            'categories' => '/api/products/categories',
            'employees' => '/api/employees',
            'employees_statistics' => '/api/employees/statistics',
        ],
        'timestamp' => now()->toDateTimeString(),
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
Route::prefix('invoices')->group(function () {
    Route::get('/', [InvoicesController::class, 'index']);
    Route::get('/stats', [InvoicesController::class, 'stats']);
    Route::get('/{id}', [InvoicesController::class, 'show']);
    Route::post('/', [InvoicesController::class, 'store']);
    Route::match(['put', 'patch'], '/{id}', [InvoicesController::class, 'update']);
    Route::match(['put', 'patch'], '/{id}/status', [InvoicesController::class, 'updateStatus']);
    Route::delete('/{id}', [InvoicesController::class, 'destroy']);
});

// ========== ROUTE CUSTOMERS ==========
// Route::prefix('customers')->group(function () {
//     Route::get('/', [CustomersController::class, 'index']);
// });

// ========== ROUTE EMPLOYEES ==========
// Route::prefix('employees')->group(function () {
//     Route::get('/', [EmployeesController::class, 'index']);
// });

// ========== ROUTE CUSTOMERS ==========
Route::prefix('customers')->group(function () {
    Route::get('/', [CustomersController::class, 'index']);
    Route::get('/stats', [CustomersController::class, 'stats']);
    Route::post('/', [CustomersController::class, 'store']);
    Route::get('/{id}', [CustomersController::class, 'show']);
    Route::put('/{id}', [CustomersController::class, 'update']);
    Route::delete('/{id}', [CustomersController::class, 'destroy']);
});
// ========== ROUTE EMPLOYEES ==========
// Thêm vào routes/api.php
Route::prefix('employees')->group(function () {
    Route::get('/', [EmployeesController::class, 'index']);
    Route::get('/statistics', [EmployeesController::class, 'statistics']); // Đặt trước /{id}
    Route::post('/', [EmployeesController::class, 'store']);
    Route::post('/login', [EmployeesController::class, 'login']);
    Route::get('/{id}', [EmployeesController::class, 'show']);
    Route::put('/{id}', [EmployeesController::class, 'update']);
    Route::delete('/{id}', [EmployeesController::class, 'destroy']);
    Route::post('/{id}/change-password', [EmployeesController::class, 'changePassword']);
});
