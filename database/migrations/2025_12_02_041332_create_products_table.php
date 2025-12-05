<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id('product_id'); //id sản phẩm
            $table->string('product_name',100); //tên sản phẩm
            $table->foreignId('brand_id')->constrained('brands')->onDelete('cacade'); // ID thương hiệu + khóa ngoại tới brands
            $table->string('category',50); // Danh muc
            $table->decimal('price',12,2); //Giá bán
            $table->decimal('cost_price',12,2); //Giá nhập
            $table->integer('stock'); //Số lượng tồn kho
            $table->enum('status',['Available', 'Out of Stock', 'Discontinued'])->default('Available');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('products');
    }
};
