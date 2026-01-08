<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class StockTransactions extends Model
{
    use HasFactory;

    protected $table = 'stock_transactions';
    protected $primaryKey = 'id';

    protected $fillable = [
        'product_id',
        'warehouse_location_id',
        'transaction_type',
        'quantity',
        'unit_price',
        'total_value',
        'reference_number',
        'reference_id',
        'reference_type',
        'from_warehouse_location_id',
        'to_warehouse_location_id',
        'employee_id',
        'customer_id',
        'supplier_id',
        'notes',
        'metadata',
    ];

    protected $casts = [
        'quantity' => 'integer',
        'unit_price' => 'decimal:2',
        'total_value' => 'decimal:2',
        'metadata' => 'array',
    ];

    public function product(): BelongsTo
    {
        return $this->belongsTo(products::class, 'product_id');
    }

    public function warehouseLocation(): BelongsTo
    {
        return $this->belongsTo(warehouse_locations::class, 'warehouse_location_id');
    }

    public function fromWarehouseLocation(): BelongsTo
    {
        return $this->belongsTo(warehouse_locations::class, 'from_warehouse_location_id');
    }

    public function toWarehouseLocation(): BelongsTo
    {
        return $this->belongsTo(warehouse_locations::class, 'to_warehouse_location_id');
    }

    public function employee(): BelongsTo
    {
        return $this->belongsTo(Employees::class, 'employee_id');
    }

    public function customer(): BelongsTo
    {
        return $this->belongsTo(Customer::class, 'customer_id');
    }

    public function supplier(): BelongsTo
    {
        return $this->belongsTo(suppliers::class, 'supplier_id');
    }
}
