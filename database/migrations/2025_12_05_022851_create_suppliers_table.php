<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('suppliers', function (Blueprint $table) {
            $table->id();
            $table->string('supplier_code', 50)->unique(); // Mã NCC (VD: NCC001)
            $table->string('supplier_name', 255); // Tên nhà cung cấp
            $table->string('tax_code', 50)->nullable(); // Mã số thuế
            $table->string('contact_name', 255); // Tên người liên hệ (có thể giữ)
            $table->string('representative_name', 255)->nullable(); // Người đại diện
            $table->string('company_phone', 15); // SĐT công ty
            $table->string('representative_phone', 15)->nullable(); // SĐT người đại diện
            $table->string('email', 255); // Email
            $table->text('address'); // Địa chỉ
            $table->string('website', 255)->nullable(); // Website
            $table->json('product_types')->nullable(); // Loại sản phẩm (JSON array)
            $table->decimal('rating', 2, 1)->default(0.0); // Xếp hạng 0-5
            $table->text('payment_terms')->nullable(); // Điều khoản thanh toán
            $table->string('logo_url', 500)->nullable(); // Đường dẫn logo
            $table->enum('status', ['active', 'inactive', 'pending'])->default('pending');
            $table->date('cooperation_date')->nullable(); // Ngày bắt đầu hợp tác
            $table->timestamps();
            $table->softDeletes(); // Thêm xóa mềm
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('suppliers');
    }
};
