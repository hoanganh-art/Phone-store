<?php

require __DIR__.'/vendor/autoload.php';

$app = require_once __DIR__.'/bootstrap/app.php';
$app->make('Illuminate\Contracts\Console\Kernel')->bootstrap();

try {
    $product = App\Models\products::create([
        'product_name' => 'iPhone 15 Pro',
        'sku' => 'IP15P-256-BLK',
        'brand_id' => 1,
        'category' => 'Flagship',
        'ram' => '8GB',
        'storage' => '256GB',
        'price' => 999.99,
        'cost_price' => 650.00,
        'stock' => 50,
        'status' => 'Available'
    ]);
    
    echo "✓ Thành công! Product ID: " . $product->id . "\n";
    echo "Tên: " . $product->product_name . "\n";
    echo "Brand: " . $product->brand->brand_name . "\n";
    
} catch (\Exception $e) {
    echo "✗ Lỗi: " . $e->getMessage() . "\n";
    echo "\nChi tiết:\n";
    echo $e->getTraceAsString();
}
