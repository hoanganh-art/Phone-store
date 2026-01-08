<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\SoftDeletes;

class Employees extends Model
{
    use HasFactory, SoftDeletes;

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
        'status',
        'avatar',  // Thêm vào
        'phone',   // Thêm vào
        'position' // Thêm vào
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
        // Kiểm tra xem model Invoices có tồn tại không
        if (class_exists(invoices::class)) {
            return $this->hasMany(invoices::class, 'employee_id');
        }
        return $this->hasMany(\App\Models\invoices::class, 'employee_id');
    }

    public function imports(): HasMany
    {
        return $this->hasMany(imports::class, 'employee_id');
    }
}
