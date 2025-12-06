<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class employees extends Model
{
    //
    protected $table = "employees";
    protected $primaryKey = 'id';
    protected $fillable = [
        'username',
        'password',
        'full_name',
        'role',
        'salary',
        'hire_date',
        'email',
        'status'
    ];

    protected $hidden = [
        'password'
    ];

    protected $casts = [
        'salary' => 'decimal:2',
        'hire_date' => 'date'
    ];

    // Quan hệ: Một nhân viên tạo nhiều hóa đơn
    public function invoices(): HasMany
    {
        return $this->hasMany(invoices::class, 'employee_id');
    }

    // Quan hệ: Một nhân viên tạo nhiều phiếu nhập hàng
    public function imports(): HasMany
    {
        return $this->hasMany(imports::class, 'employee_id');
    }
}
