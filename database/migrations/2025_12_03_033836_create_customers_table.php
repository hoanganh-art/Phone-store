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
        Schema::create('customers', function (Blueprint $table) {
            $table->id();
            $table->string('full_name', 100); // Tên khách hàng
            $table->string('phone', 15)->unique(); // Số điện thoại khách hàng
            $table->date('date_of_birth')->nullable(); // Ngày sinh khách hàng
            $table->string('email', 100)->unique(); // Email khách hàng
            $table->enum('gender', ['Nam', 'Nữ', 'Khác'])->nullable(); // Giới tính khách hàng
            $table->string('address', 255)->nullable(); // Địa chỉ khách hàng
            $table->enum('membership', ['Đồng', 'Bạc', 'Vàng','VIP'])->default('Đồng'); // Cấp độ thành viên
            $table->integer('points')->default(0); // Điểm tích lũy
            $table->text('description')->nullable(); // Mô tả thêm về khách hàng(Ghi chú)
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('customers');
    }
};
