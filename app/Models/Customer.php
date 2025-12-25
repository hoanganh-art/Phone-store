<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Customer extends Model
{
    use HasFactory;

    protected $table = "customers";
    protected $primaryKey = 'id';

    protected $fillable = [
        'full_name',
        'phone',
        'email',
        'address',
        'date_of_birth',
        'gender',
        'membership',
        'points',
        'description',
        'created_at'
    ];

    protected $casts = [
        'created_at' => 'datetime',
        'date_of_birth' => 'date'
    ];

    // Quan hệ: Một khách hàng có nhiều hóa đơn
    public function invoices()
    {
        return $this->hasMany(invoices::class, 'customer_id');
    }
}
