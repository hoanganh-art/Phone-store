<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\ProductsController;

// ========== ROUTE CHÍNH ==========
Route::get('/', function () {
    return response()->json([
        'app' => 'PhoneStore API',
        'version' => '1.0',
        'status' => 'online',
        'endpoints' => [
            'products' => '/api/products',
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
