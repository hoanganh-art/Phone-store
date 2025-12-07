<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class imports extends Model
{
    //
    protected $table = " imports";
    protected $primaryKey = 'id';
    public $incrementing = true;

    protected $fillable = [
        'supplier_id',
        'employee_id',
        'import_date',
        'total_amount',
        'status',
    ];

    protected $casts = [
        'import_date' => 'datetime',
        'total_cost' => 'decimal:2'
    ];

    // Quan hệ: Phiếu nhập thuộc về một nhà cung cấp
    public function supplier(): BelongsTo
    {
        return $this->belongsTo(suppliers::class, 'supplier_id');
    }

    // Quan hệ: Phiếu nhập được tạo bởi một nhân viên
    public function employee(): BelongsTo
    {
        return $this->belongsTo(employees::class, 'employee_id');
    }

    // Quan hệ: Một phiếu nhập có nhiều chi tiết
    public function details(): HasMany
    {
        return $this->hasMany(import_details::class, 'import_id');
    }
}
