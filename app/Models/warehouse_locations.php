<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class warehouse_locations extends Model
{
    use HasFactory;

    protected $table = 'warehouse_locations';
    protected $primaryKey = 'id';

    protected $fillable = [
        'warehouse_id',
        'location_code',
        'location_name',
        'zone',
        'aisle',
        'rack',
        'shelf',
        'max_capacity',
        'current_quantity',
        'status',
    ];

    protected $casts = [
        'max_capacity' => 'integer',
        'current_quantity' => 'integer',
    ];

    public function warehouse(): BelongsTo
    {
        return $this->belongsTo(warehouses::class, 'warehouse_id');
    }

    public function inventoryDetails(): HasMany
    {
        return $this->hasMany(inventory_details::class, 'warehouse_location_id');
    }

    public function stockTransactions(): HasMany
    {
        return $this->hasMany(StockTransactions::class, 'warehouse_location_id');
    }

    public function stockTakeItems(): HasMany
    {
        return $this->hasMany(StockTakeItems::class, 'warehouse_location_id');
    }
}
