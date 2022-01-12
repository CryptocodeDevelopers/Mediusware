<?php

namespace App\Models;

use App\Models\ProductImage;
use App\Models\ProductVariant;
use App\Models\ProductVariantPrice;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $fillable = [
        'title', 'sku', 'description'
    ];

    public function images(){
        return $this->hasMany(ProductImage::class, 'product_id');
    }
    
    public function variant(){
        return $this->hasMany(ProductVariant::class, 'product_id');
    }
    
    public function priceVariant(){
        return $this->hasMany(ProductVariantPrice::class, 'product_id');
    }

}
