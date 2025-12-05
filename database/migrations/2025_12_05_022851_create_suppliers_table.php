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
        Schema::create('suppliers', function (Blueprint $table) {
            $table->id();
            $table->string('supplier_name', 255); //Tên nhà cung cấp
            $table->string('contact_name', 255); //Tên người liên hệ
            $table->string('phone', 15); //Số điện thoại nhà cung cấp
            $table->string('email', 255); //Email nhà cung cấp
            $table->text('address'); //Địa chỉ nhà cung cấp
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('suppliers');
    }
};
