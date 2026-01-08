<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('stock_transactions', function (Blueprint $table) {
            $table->id();
            $table->foreignId('product_id')->constrained('products')->onDelete('cascade');
            $table->foreignId('warehouse_location_id')->nullable()->constrained('warehouse_locations')->onDelete('set null');
            $table->enum('transaction_type', ['receive', 'adjust', 'transfer', 'return', 'sale', 'damage', 'expired']);
            $table->integer('quantity');
            $table->decimal('unit_price', 12, 2)->nullable();
            $table->decimal('total_value', 12, 2)->nullable();
            $table->string('reference_number', 100)->nullable(); // Số chứng từ
            $table->foreignId('reference_id')->nullable(); // ID tham chiếu (import_id, invoice_id)
            $table->string('reference_type', 50)->nullable(); // Loại tham chiếu (App\Models\Import, App\Models\Invoice)

            // Kho nguồn và đích cho transfer
            $table->foreignId('from_warehouse_location_id')->nullable()->constrained('warehouse_locations')->onDelete('set null');
            $table->foreignId('to_warehouse_location_id')->nullable()->constrained('warehouse_locations')->onDelete('set null');

            // Thông tin người thực hiện
            $table->foreignId('employee_id')->constrained('employees')->onDelete('cascade');
            $table->foreignId('customer_id')->nullable()->constrained('customers')->onDelete('set null');
            $table->foreignId('supplier_id')->nullable()->constrained('suppliers')->onDelete('set null');

            // Thông tin bổ sung
            $table->text('notes')->nullable();
            $table->json('metadata')->nullable(); // Dữ liệu bổ sung dạng JSON
            $table->timestamps();

            // Indexes
            $table->index(['product_id', 'created_at']);
            $table->index(['transaction_type', 'created_at']);
            $table->index('reference_number');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('stock_transactions');
    }
};
