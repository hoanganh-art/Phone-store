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
            $table->id();
            $table->string('product_name', 100); // Tên sản phẩmq
            $table->string('sku', 50)->unique(); // Mã SKU sản phẩm
            $table->foreignId('brand_id')->constrained('brands')->onDelete('cascade'); // Thương hiệu sản phẩm
            $table->string('category', 50); // Loại sản phẩm
            $table->string('ram', 20)->nullable(); // RAM
            $table->string('storage', 20)->nullable(); // Bộ nhớ trong
            $table->decimal('price', 12, 2); // Giá bán
            $table->decimal('cost_price', 12, 2); // Giá vốn
            $table->integer('stock')->default(0); // Số lượng tồn kho
            $table->enum('status', ['active', 'inactive', 'draft'])->default('active'); // Trạng thái sản phẩm
            $table->text('description')->nullable(); // Mô tả sản phẩm
            $table->string('image')->nullable(); // Hình ảnh sản phẩm
            $table->timestamps(); // Thời gian tạo và cập nhật
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
