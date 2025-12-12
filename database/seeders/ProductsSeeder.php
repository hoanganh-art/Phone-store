<?php

namespace Database\Seeders;

use App\Models\products;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class ProductsSeeder extends Seeder
{
    use WithoutModelEvents;

    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        products::create([
            'product_name' => 'iPhone 15 Pro',
            'sku' => 'IP15P-256',
            'brand_id' => 1,
            'category' => 'Flagship',
            'ram' => '8GB',
            'storage' => '256GB',
            'price' => 999.99,
            'cost_price' => 650.00,
            'stock' => 50,
            'status' => 'Available',
            'description' => 'iPhone 15 Pro với chip A17 Pro',
            'image' => 'iphone15pro.jpg',
        ]);

        products::create([
            'product_name' => 'iPhone 15',
            'sku' => 'IP15-128',
            'brand_id' => 1,
            'category' => 'Flagship',
            'ram' => '6GB',
            'storage' => '128GB',
            'price' => 799.99,
            'cost_price' => 520.00,
            'stock' => 45,
            'status' => 'Available',
            'description' => 'iPhone 15 tiêu chuẩn',
            'image' => 'iphone15.jpg',
        ]);

        products::create([
            'product_name' => 'Galaxy S24 Ultra',
            'sku' => 'GS24U-512',
            'brand_id' => 2,
            'category' => 'Flagship',
            'ram' => '12GB',
            'storage' => '512GB',
            'price' => 1299.99,
            'cost_price' => 850.00,
            'stock' => 30,
            'status' => 'Available',
            'description' => 'Samsung Galaxy S24 Ultra',
            'image' => 's24ultra.jpg',
        ]);

        products::create([
            'product_name' => 'Galaxy A54',
            'sku' => 'GA54-256',
            'brand_id' => 2,
            'category' => 'Mid-range',
            'ram' => '8GB',
            'storage' => '256GB',
            'price' => 449.99,
            'cost_price' => 280.00,
            'stock' => 60,
            'status' => 'Available',
            'description' => 'Samsung Galaxy A54',
            'image' => 'galaxya54.jpg',
        ]);

        products::create([
            'product_name' => 'Xiaomi 14',
            'sku' => 'XM14-512',
            'brand_id' => 3,
            'category' => 'Flagship',
            'ram' => '12GB',
            'storage' => '512GB',
            'price' => 699.99,
            'cost_price' => 420.00,
            'stock' => 40,
            'status' => 'Available',
            'description' => 'Xiaomi 14 flagship',
            'image' => 'xiaomi14.jpg',
        ]);

        products::create([
            'product_name' => 'Redmi Note 13',
            'sku' => 'RMN13-128',
            'brand_id' => 3,
            'category' => 'Budget',
            'ram' => '4GB',
            'storage' => '128GB',
            'price' => 199.99,
            'cost_price' => 110.00,
            'stock' => 100,
            'status' => 'Available',
            'description' => 'Redmi Note 13 giá rẻ',
            'image' => 'redminote13.jpg',
        ]);

        products::create([
            'product_name' => 'Oppo Find X6',
            'sku' => 'OFX6-256',
            'brand_id' => 4,
            'category' => 'Flagship',
            'ram' => '12GB',
            'storage' => '256GB',
            'price' => 899.99,
            'cost_price' => 550.00,
            'stock' => 25,
            'status' => 'Available',
            'description' => 'Oppo Find X6 flagship',
            'image' => 'oppofindx6.jpg',
        ]);

        products::create([
            'product_name' => 'Oppo A78',
            'sku' => 'OA78-128',
            'brand_id' => 4,
            'category' => 'Budget',
            'ram' => '6GB',
            'storage' => '128GB',
            'price' => 249.99,
            'cost_price' => 140.00,
            'stock' => 80,
            'status' => 'Available',
            'description' => 'Oppo A78 giá rẻ',
            'image' => 'oppoa78.jpg',
        ]);

        products::create([
            'product_name' => 'Vivo X90',
            'sku' => 'VX90-512',
            'brand_id' => 5,
            'category' => 'Flagship',
            'ram' => '12GB',
            'storage' => '512GB',
            'price' => 799.99,
            'cost_price' => 480.00,
            'stock' => 35,
            'status' => 'Available',
            'description' => 'Vivo X90 cao cấp',
            'image' => 'vivox90.jpg',
        ]);

        products::create([
            'product_name' => 'Vivo Y36',
            'sku' => 'VY36-128',
            'brand_id' => 5,
            'category' => 'Budget',
            'ram' => '4GB',
            'storage' => '128GB',
            'price' => 179.99,
            'cost_price' => 95.00,
            'stock' => 120,
            'status' => 'Available',
            'description' => 'Vivo Y36 giá rẻ',
            'image' => 'vivoy36.jpg',
        ]);
    }
}
