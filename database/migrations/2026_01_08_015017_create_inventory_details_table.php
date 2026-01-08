<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('inventory_details', function (Blueprint $table) {
            $table->id();
            $table->foreignId('product_id')->constrained('products')->onDelete('cascade');
            $table->foreignId('warehouse_location_id')->constrained('warehouse_locations')->onDelete('cascade');
            $table->integer('quantity')->default(0);
            $table->string('batch_number', 100)->nullable();
            $table->date('expiry_date')->nullable();
            $table->date('manufacture_date')->nullable();
            $table->json('serial_numbers')->nullable();
            $table->decimal('cost_price', 12, 2)->default(0);
            $table->enum('stock_status', ['available', 'reserved', 'damaged', 'expired'])->default('available');
            $table->date('last_counted_date')->nullable();
            $table->integer('reorder_level')->default(0);
            $table->text('notes')->nullable();
            $table->timestamps();

            $table->index(['product_id', 'warehouse_location_id']);
            $table->index('batch_number');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('inventory_details');
    }
};
