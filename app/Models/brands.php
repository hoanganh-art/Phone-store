<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class brands extends Model
{
    //
    protected $table = "brands";
    protected $primaryKey = 'id';
    protected $fillable = [
        'brand_name',
        'country',
        'description',
    ];

    public function products()
    {
        return $this->hasMany(products::class, 'brand_id', 'id');
    }
}
