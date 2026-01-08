<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('warehouse_locations', function (Blueprint $table) {
            $table->id();
            $table->foreignId('warehouse_id')->constrained('warehouses')->onDelete('cascade');
            $table->string('location_code', 50);
            $table->string('location_name', 255);
            $table->string('zone', 50)->nullable();
            $table->string('aisle', 20)->nullable();
            $table->string('rack', 20)->nullable();
            $table->string('shelf', 20)->nullable();
            $table->integer('max_capacity')->default(0);
            $table->integer('current_quantity')->default(0);
            $table->enum('status', ['available', 'full', 'restricted'])->default('available');
            $table->timestamps();

            $table->unique(['warehouse_id', 'location_code']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('warehouse_locations');
    }
};
