<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class import_details extends Model
{
    use HasFactory;

    protected $table = 'import_details';

    protected $primaryKey = 'id';

    protected $fillable = [
        'import_id',
        'product_id',
        'quantity',
        'const_price',
        'amount',
    ];

    protected $casts = [
        'const_price' => 'decimal:2',
        'amount' => 'decimal:2',
    ];

    public function import(): BelongsTo
    {
        return $this->belongsTo(imports::class, 'import_id');
    }

    public function product(): BelongsTo
    {
        return $this->belongsTo(products::class, 'product_id');
    }
}
