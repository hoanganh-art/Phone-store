<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('stock_take_items', function (Blueprint $table) {
            $table->id();
            $table->foreignId('stock_take_id')->constrained('stock_takes')->onDelete('cascade');
            $table->foreignId('product_id')->constrained('products')->onDelete('cascade');
            $table->foreignId('warehouse_location_id')->constrained('warehouse_locations')->onDelete('cascade');
            $table->integer('system_quantity')->default(0); // Số lượng hệ thống
            $table->integer('actual_quantity')->default(0); // Số lượng thực tế
            $table->integer('variance'); // Chênh lệch = actual - system
            $table->decimal('unit_cost', 12, 2)->default(0);
            $table->decimal('variance_value', 12, 2)->default(0); // Giá trị chênh lệch
            $table->enum('status', ['matched', 'excess', 'shortage', 'damaged'])->default('matched');
            $table->text('notes')->nullable();
            $table->timestamps();

            $table->index(['stock_take_id', 'product_id']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('stock_take_items');
    }
};
