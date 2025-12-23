<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class invoices extends Model
{
    protected $table = "invoices";
    protected $primaryKey = 'id';

    protected $fillable = [
        'customer_id',
        'employee_id',
        'invoice_date',
        'subtotal',
        'discount',
        'total_amount',
        'payment_method',
        'status',
        'invoice_code',  // Thêm vào
        'notes',         // Thêm vào
    ];

    protected $casts = [
        'invoice_date' => 'datetime',
        'subtotal' => 'decimal:2',
        'discount' => 'decimal:2',
        'total_amount' => 'decimal:2'
    ];

    public function customer()
    {
        return $this->belongsTo(customers::class, 'customer_id');
    }

    public function employee()
    {
        return $this->belongsTo(employees::class, 'employee_id');
    }

    public function invoiceDetails()
    {
        return $this->hasMany(invoice_details::class, 'invoice_id');
    }

    // Quan hệ cho items (để tương thích với frontend)
    public function items()
    {
        return $this->hasMany(invoice_details::class, 'invoice_id');
    }
}
