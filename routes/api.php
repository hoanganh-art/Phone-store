<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\ProductsController;

Route::prefix('products')->group(function () {
    Route::get('/', [ProductsController::class, 'index']);
    Route::get('/stats', [ProductsController::class, 'stats']);
    Route::get('/filter-options', [ProductsController::class, 'filterOptions']); // THÊM
    Route::get('/brands', [ProductsController::class, 'getBrands']);
    Route::get('/categories', [ProductsController::class, 'getCategories']);
    Route::post('/', [ProductsController::class, 'store']);
    Route::get('/{id}', [ProductsController::class, 'show']);
    Route::put('/{id}', [ProductsController::class, 'update']);
    Route::delete('/{id}', [ProductsController::class, 'destroy']);
});
