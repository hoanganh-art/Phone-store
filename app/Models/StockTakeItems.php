<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class StockTakeItems extends Model
{
    use HasFactory;

    protected $table = 'stock_take_items';
    protected $primaryKey = 'id';

    protected $fillable = [
        'stock_take_id',
        'product_id',
        'warehouse_location_id',
        'system_quantity',
        'actual_quantity',
        'variance',
        'unit_cost',
        'variance_value',
        'status',
        'notes',
    ];

    protected $casts = [
        'system_quantity' => 'integer',
        'actual_quantity' => 'integer',
        'variance' => 'integer',
        'unit_cost' => 'decimal:2',
        'variance_value' => 'decimal:2',
    ];

    public function stockTake(): BelongsTo
    {
        return $this->belongsTo(StockTakes::class, 'stock_take_id');
    }

    public function product(): BelongsTo
    {
        return $this->belongsTo(products::class, 'product_id');
    }

    public function warehouseLocation(): BelongsTo
    {
        return $this->belongsTo(warehouse_locations::class, 'warehouse_location_id');
    }
}
