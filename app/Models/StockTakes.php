<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class StockTakes extends Model
{
    use HasFactory;

    protected $table = 'stock_takes';
    protected $primaryKey = 'id';

    protected $fillable = [
        'stock_take_number',
        'warehouse_id',
        'stock_take_date',
        'status',
        'type',
        'employee_id',
        'notes',
        'total_variance',
    ];

    protected $casts = [
        'stock_take_date' => 'date',
        'total_variance' => 'decimal:2',
    ];

    public function warehouse(): BelongsTo
    {
        return $this->belongsTo(warehouses::class, 'warehouse_id');
    }

    public function employee(): BelongsTo
    {
        return $this->belongsTo(Employees::class, 'employee_id');
    }

    public function items(): HasMany
    {
        return $this->hasMany(StockTakeItems::class, 'stock_take_id');
    }
}
