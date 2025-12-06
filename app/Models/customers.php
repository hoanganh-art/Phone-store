<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class customers extends Model
{
    //
    protected $table = "customers";
    protected $primaryKey = 'id';
    protected $fillable = [
        'full_name',
        'phone',
        'email',
        'address',
        'created_at'
    ];

    protected $casts = [
        'created_at' => 'datetime'
    ];

     // Quan hệ: Một khách hàng có nhiều hóa đơn
    public function customers()
    {
        return $this->hasMany(invoices::class, 'customer_id');
    }

}
