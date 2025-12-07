<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Validation\Rules\In;

class products extends Model
{
    //
    protected $table = "products";
    protected $primaryKey = 'id';
    protected $fillable = [
        'product_name',
        'sku', // THÊM VÀO
        'brand_id',
        'category',
        'ram',
        'storage',
        'price',
        'cost_price',
        'stock',
        'status',
        'description', // THÊM VÀO
        'image', // THÊM VÀO
        'created_at'
    ];

    protected $casts = [
        'price' => 'decimal:2',
        'cost_price' => 'decimal:2',
        'created_at' => 'datetime',
        'stock' => 'integer'
    ];

    // Quan hệ: Sản phẩm thuộc về một thương hiệu
    public function brand(): BelongsTo
    {
        return $this->belongsTo(brands::class, 'brand_id');
    }
    // Quan hệ: Một sản phẩm có nhiều chi tiết hóa đơn
    public function invoiceDetails(): HasMany
    {
        return $this->hasMany(invoice_details::class, 'product_id');
    }

    // Quan hệ: Một sản phẩm có nhiều chi tiết nhập hàng
    public function importDetails(): HasMany
    {
        return $this->hasMany(import_details::class, 'product_id');
    }
}
