<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class imports extends Model
{
    use HasFactory;

    protected $table = 'imports';
    protected $primaryKey = 'id';

    protected $fillable = [
        'supplier_id',
        'employee_id',
        'import_date',
        'total_amount',
        'notes'
    ];

    protected $casts = [
        'import_date' => 'date',
        'total_amount' => 'decimal:2'
    ];

    public function supplier(): BelongsTo
    {
        return $this->belongsTo(suppliers::class, 'supplier_id');
    }

    public function employee(): BelongsTo
    {
        return $this->belongsTo(Employees::class, 'employee_id');
    }

    public function importDetails(): HasMany
    {
        return $this->hasMany(import_details::class, 'import_id');
    }
}
