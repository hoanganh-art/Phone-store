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
        Schema::create('invoices', function (Blueprint $table) {
            $table->id('invoice_id');
            $table->foreignId('customer_id')->constrained('customers'); //Liên kết khóa ngoại tới customers
            $table->foreignId('employee_id')->constrained('employees'); //Liên kết khóa ngoại tới employees
            $table->date('invoice_date'); //Ngày bán
            $table->decimal('subtotal', 12, 2); //Tổng tiền trả trước khi khuyến mãi
            $table->decimal('discount', 12, 2); //Tiền khuyến mãi
            $table->decimal('total_amount', 12, 2); //Tổng tiền sau khi khuyến mãi
            $table->enum('payment_method', ['cash', 'credit_card', 'bank_transfer']); //Phương thức thanh toán
            $table->enum('status', ['paid', 'unpaid', 'pending']); //Trạng thái hóa đơn
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('invoices');
    }
};
