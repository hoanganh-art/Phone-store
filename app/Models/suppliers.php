<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class suppliers extends Model
{
    //
    protected $table = "suppliers";
    protected $primaryKey = 'id';
    protected $fillable = [
        'supplier_name',
        'contact_name',
        'phone',
        'email',
        'address'
    ];
    // Quan hệ: Một nhà cung cấp có nhiều phiếu nhập hàng
    public function imports()
    {
        return $this->hasMany(imports::class, 'supplier_id');
    }
}
