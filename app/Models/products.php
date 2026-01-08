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

    // Accessor: Tính trạng thái tồn kho hiện tại
    public function getStockStatusAttribute()
    {
        if ($this->stock <= 0) {
            return 'Out of Stock';
        } elseif ($this->stock <= $this->min_stock) {
            return 'Low Stock';
        } else {
            return 'In Stock';
        }
    }

    // Accessor: Tính phần trăm tồn kho
    public function getStockPercentageAttribute()
    {
        if ($this->max_stock <= 0) {
            return 0;
        }
        return round(($this->stock / $this->max_stock) * 100, 2);
    }

    // Method: Tự động tính điểm đặt hàng lại
    public function calculateReorderPoint()
    {
        // Điểm đặt hàng lại thường là 150% của min_stock
        $this->reorder_point = ceil($this->min_stock * 1.5);
        return $this->reorder_point;
    }

    // Method: Kiểm tra xem có cần đặt hàng không
    public function needsReorder()
    {
        return $this->stock <= $this->reorder_point;
    }

    // Method: Cập nhật số lượng tồn kho
    public function updateStock($quantity, $operation = 'add')
    {
        if ($operation === 'add') {
            $this->stock += $quantity;
        } elseif ($operation === 'subtract') {
            $this->stock -= $quantity;
        } elseif ($operation === 'set') {
            $this->stock = $quantity;
        }

        // Cập nhật trạng thái
        if ($this->stock <= 0) {
            $this->status = 'Out of Stock';
        } elseif ($this->stock > 0 && $this->status === 'Out of Stock') {
            $this->status = 'Available';
        }

        $this->save();
    }
}