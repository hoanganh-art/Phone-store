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
            $table->id(); // ID chính, tự động tăng
            $table->string('product_name', 100); // Tên sản phẩm
            $table->string('sku', 50)->unique(); // Mã SKU duy nhất cho sản phẩm
            $table->foreignId('brand_id')->constrained('brands')->onDelete('cascade'); // Khóa ngoại tham chiếu brands, xóa theo cascade
            $table->string('category', 50); // Danh mục sản phẩm (smartphone, tablet, laptop, accessory)
            $table->string('ram', 20)->nullable(); // Thông tin RAM (ví dụ: 8GB, 12GB)
            $table->string('storage', 20)->nullable(); // Dung lượng lưu trữ (ví dụ: 128GB, 256GB)
            $table->decimal('price', 12, 2); // Giá bán lẻ
            $table->decimal('cost_price', 12, 2); // Giá vốn (giá nhập)
            $table->integer('stock')->default(0); // Tổng số lượng tồn kho toàn hệ thống
            $table->integer('min_stock')->default(5); // Số lượng tối thiểu cảnh báo nhập hàng
            $table->integer('max_stock')->default(100); // Số lượng tối đa có thể lưu trữ
            $table->integer('reorder_point')->nullable(); // Điểm đặt hàng lại (tự động tính)
            $table->string('location_code')->nullable(); // Mã vị trí mặc định trong kho
            $table->enum('status', ['Available', 'Out of Stock', 'Discontinued'])->default('Available'); // Trạng thái sản phẩm
            $table->text('description')->nullable(); // Mô tả chi tiết sản phẩm
            $table->string('image')->nullable(); // Đường dẫn hình ảnh sản phẩm
            $table->timestamps(); // created_at và updated_at
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
