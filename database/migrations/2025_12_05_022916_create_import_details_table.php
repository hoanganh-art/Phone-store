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
        Schema::create('import_details', function (Blueprint $table) {
            $table->id();
            $table->foreignId('import_id')->constrained('imports'); //Mã phiếu nhập
            $table->foreignId('product_id')->constrained('products'); //Mã sản phẩm
            $table->integer('quantity'); //Số lượng sản phẩm nhập
            $table->decimal('const_price', 12, 2); //Đơn giá nhập
            $table->decimal('amount', 12, 2); //Thành tiền
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('import_details');
    }
};
