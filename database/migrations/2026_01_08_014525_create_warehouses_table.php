<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('warehouses', function (Blueprint $table) {
            $table->id();
            $table->string('warehouse_code', 50)->unique();
            $table->string('warehouse_name', 255);
            $table->text('address');
            $table->foreignId('manager_id')->nullable()->constrained('employees')->onDelete('set null');
            $table->string('phone', 15)->nullable();
            $table->string('email', 100)->nullable();
            $table->integer('capacity')->default(0);
            $table->integer('current_occupancy')->default(0);
            $table->enum('status', ['active', 'inactive', 'maintenance'])->default('active');
            $table->text('notes')->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('warehouses');
    }
};