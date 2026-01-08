<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class inventory_details extends Model
{
    use HasFactory;

    protected $table = 'inventory_details';
    protected $primaryKey = 'id';

    protected $fillable = [
        'product_id',
        'warehouse_location_id',
        'quantity',
        'batch_number',
        'expiry_date',
        'manufacture_date',
        'serial_numbers',
        'cost_price',
        'stock_status',
        'last_counted_date',
        'reorder_level',
        'notes',
    ];

    protected $casts = [
        'quantity' => 'integer',
        'expiry_date' => 'date',
        'manufacture_date' => 'date',
        'serial_numbers' => 'array',
        'cost_price' => 'decimal:2',
        'last_counted_date' => 'date',
        'reorder_level' => 'integer',
    ];

    public function product(): BelongsTo
    {
        return $this->belongsTo(products::class, 'product_id');
    }

    public function warehouseLocation(): BelongsTo
    {
        return $this->belongsTo(warehouse_locations::class, 'warehouse_location_id');
    }
}
