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
            $table->string('product_name', 100);
            $table->string('sku', 50)->unique();
            $table->foreignId('brand_id')->constrained('brands')->onDelete('cascade');
            $table->string('category', 50);
            $table->string('ram', 20)->nullable();
            $table->string('storage', 20)->nullable();
            $table->decimal('price', 12, 2);
            $table->decimal('cost_price', 12, 2);
            $table->integer('stock')->default(0);
            $table->enum('status', ['Available', 'Out of Stock', 'Discontinued'])->default('Available');
            $table->text('description')->nullable();
            $table->string('image')->nullable();
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
