<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class invoice_details extends Model
{
    //
    protected $table = "invoice_details";
    protected $primaryKey = 'id';
    protected $fillable = [
        'invoice_id',
        'product_id',
        'quantity',
        'unit_price',
        'total_price'
    ];

    protected $casts = [
        'unit_price' => 'decimal:2',
        'amount' => 'decimal:2'
    ];

    // Quan hệ: Chi tiết thuộc về một hóa đơn
    public function invoice(): BelongsTo
    {
        return $this->belongsTo(invoices::class, 'invoice_id');
    }

    // Quan hệ: Chi tiết thuộc về một sản phẩm
    public function product(): BelongsTo
    {
        return $this->belongsTo(products::class, 'product_id');
    }
}
