<?php

namespace Database\Seeders;

use App\Models\brands;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class BrandsSeeder extends Seeder
{
    use WithoutModelEvents;

    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        brands::create([
            'brand_name' => 'Apple',
            'country' => 'USA',
            'description' => 'Premium smartphone manufacturer',
        ]);

        brands::create([
            'brand_name' => 'Samsung',
            'country' => 'South Korea',
            'description' => 'Leading electronics company',
        ]);

        brands::create([
            'brand_name' => 'Xiaomi',
            'country' => 'China',
            'description' => 'Affordable tech innovator',
        ]);

        brands::create([
            'brand_name' => 'Oppo',
            'country' => 'China',
            'description' => 'Camera-focused smartphones',
        ]);

        brands::create([
            'brand_name' => 'Vivo',
            'country' => 'China',
            'description' => 'Innovation-driven brand',
        ]);
    }
}
