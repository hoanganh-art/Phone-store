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
        Schema::create('imports', function (Blueprint $table) {
            $table->id(); //Mã phiếu nhập
            $table->foreignId('supplier_id')->constrained('suppliers');
            $table->foreignId('employee_id')->constrained('employees');
            $table->date('import_date'); //Ngày nhập hàng
            $table->decimal('total_amount', 12, 2); //Tổng tiền nhập hàng
            $table->text('notes')->nullable(); //Ghi chú
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('imports');
    }
};
