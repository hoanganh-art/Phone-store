<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class warehouses extends Model
{
    use HasFactory;

    protected $table = 'warehouses';
    protected $primaryKey = 'id';

    protected $fillable = [
        'warehouse_code',
        'warehouse_name',
        'address',
        'manager_id',
        'phone',
        'email',
        'capacity',
        'current_occupancy',
        'status',
        'notes',
    ];

    protected $casts = [
        'capacity' => 'integer',
        'current_occupancy' => 'integer',
    ];

    public function manager(): BelongsTo
    {
        return $this->belongsTo(Employees::class, 'manager_id');
    }

    public function locations(): HasMany
    {
        return $this->hasMany(warehouse_locations::class, 'warehouse_id');
    }

    public function stockTakes(): HasMany
    {
        return $this->hasMany(StockTakes::class, 'warehouse_id');
    }
}
