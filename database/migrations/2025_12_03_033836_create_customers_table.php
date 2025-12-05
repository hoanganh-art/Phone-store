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
            $table->id('customer_id');
            $table->string('full_name', 100); // Tên khách hàng
            $table->string('phone', 15)->unique(); // Số điện thoại khách hàng
            $table->string('email', 100)->unique(); // Email khách hàng
            $table->string('address', 255)->nullable(); // Địa chỉ khách hàng
            $table->enum('membership', ['Active', 'Inactive'])->default('Active'); // Trạng thái khách hàng
            $table->integer('some_integer_column'); // Example integer column
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
