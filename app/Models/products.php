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
        'sku',
        'brand_id',
        'category',
        'ram',
        'storage',
        'price',
        'cost_price',
        'stock',
         'min_stock',
        'max_stock',
        'reorder_point',
        'location_code',
        'status',
        'description',
        'image',
        'created_at'
    ];

    protected $casts = [
        'price' => 'decimal:2',
        'cost_price' => 'decimal:2',
        'created_at' => 'datetime',
        'stock' => 'integer',
        'min_stock' => 'integer',
        'max_stock' => 'integer',
        'reorder_point' => 'integer',
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

    // // QUAN HỆ MỚI: Một sản phẩm có nhiều bản ghi tồn kho ở các kho khác nhau
    // public function inventories(): HasMany
    // {
    //     return $this->hasMany(Inventory::class, 'product_id');
    // }

    // // QUAN HỆ MỚI: Một sản phẩm có nhiều giao dịch tồn kho
    // public function stockTransactions(): HasMany
    // {
    //     return $this->hasMany(StockTransaction::class, 'product_id');
    // }

    // // QUAN HỆ MỚI: Một sản phẩm có nhiều chi tiết điều chỉnh
    // public function adjustmentDetails(): HasMany
    // {
    //     return $this->hasMany(AdjustmentDetail::class, 'product_id');
    // }

    // // QUAN HỆ MỚI: Một sản phẩm có nhiều chi tiết chuyển kho
    // public function transferDetails(): HasMany
    // {
    //     return $this->hasMany(TransferDetail::class, 'product_id');
    // }

}