<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class invoices extends Model
{
    //
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
    ];

    protected $casts = [
        'invoice_date' => 'datetime',
        'subtotal' => 'decimal:2',
        'discount' => 'decimal:2',
        'total_amount' => 'decimal:2'
    ];

    // Quan hệ: Một hóa đơn thuộc về một khách hàng
    public function customer()
    {
        return $this->belongsTo(customers::class, 'customer_id');
    }

    // Quan hệ: Một hóa đơn thuộc về một nhân viên
    public function employee()
    {
        return $this->belongsTo(employees::class, 'employee_id');
    }

      // Quan hệ: Một hóa đơn có nhiều chi tiết hóa đơn
    public function invoiceDetails()
    {
        return $this->hasMany(invoice_details::class, 'invoice_id');
    }
}
