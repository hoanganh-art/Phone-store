<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class suppliers extends Model
{
    protected $table = "suppliers";
    protected $primaryKey = 'id';
    protected $fillable = [
        'supplier_code',
        'supplier_name',
        'tax_code',
        'contact_name',
        'representative_name',
        'company_phone',
        'representative_phone',
        'email',
        'address',
        'website',
        'product_types',
        'rating',
        'payment_terms',
        'logo_url',
        'status',
        'cooperation_date'
    ];

    protected $casts = [
        'product_types' => 'json',
        'rating' => 'decimal:1',
        'cooperation_date' => 'date'
    ];
    // Quan hệ: Một nhà cung cấp có nhiều phiếu nhập hàng
}