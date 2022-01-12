<?php

namespace App\Models;

use App\Models\ProductVariant;
use Illuminate\Database\Eloquent\Model;

class ProductVariantPrice extends Model
{
    public function getVariant(){
        return $this->belongsTo(ProductVariant::class);
    }
    public function variantOne(){
        return $this->belongsTo(ProductVariant::class, 'id', 'product_variant_one');
    }
    public function variantTwo(){
        return $this->belongsTo(ProductVariant::class, 'id', 'product_variant_two');
    }
    public function variantThree(){
        return $this->belongsTo(ProductVariant::class, 'id', 'product_variant_three');
    }
}
