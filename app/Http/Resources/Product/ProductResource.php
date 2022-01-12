<?php

namespace App\Http\Resources\Product;

use Illuminate\Http\Resources\Json\JsonResource;

class ProductResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            "id" => $this->id,
            "title" => $this->title,
            "sku" => $this->sku,
            "description" => $this->description,
            "date" => date('d-M-Y', strtotime($this->created_at)),
            "created_at" => $this->created_at,
            "variant" => $this->variant(),
            "variantPrice" => $this->variantPrice(),
            "images" => $this->images(),
        ];
    }

    protected function variant(){
        
    }
    protected function variantPrice(){
        
    }
    protected function images(){
        
    }

}
