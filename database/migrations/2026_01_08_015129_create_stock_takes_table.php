<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('stock_takes', function (Blueprint $table) {
            $table->id();
            $table->string('stock_take_number', 50)->unique(); // Số phiếu kiểm kê
            $table->foreignId('warehouse_id')->constrained('warehouses')->onDelete('cascade');
            $table->date('stock_take_date');
            $table->enum('status', ['pending', 'in_progress', 'completed', 'cancelled'])->default('pending');
            $table->enum('type', ['full', 'partial', 'cycle'])->default('full');
            $table->foreignId('employee_id')->constrained('employees')->onDelete('cascade');
            $table->text('notes')->nullable();
            $table->decimal('total_variance', 12, 2)->default(0); // Tổng chênh lệch giá trị
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('stock_takes');
    }
};
