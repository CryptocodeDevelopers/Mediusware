<?php

namespace App\Http\Controllers;

use Image;
use Carbon\Carbon;
use App\Models\Product;
use App\Models\Variant;
use App\Models\ProductImage;
use Illuminate\Http\Request;
use App\Models\ProductVariant;
use App\Models\ProductVariantPrice;
use App\Http\Controllers\FileHandler;
use Illuminate\Support\Facades\Validator;
use App\Http\Resources\Product\ProductResource;
use App\Http\Resources\Product\ProductCollection;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\Factory|\Illuminate\Http\Response|\Illuminate\View\View
     */
    public function index(Request $get)
    {
        $variants = Variant::all();
        $paginate = $get->paginate ? $get->paginate : 5;
        $search = $this->searchQuery($get);
        // return $search;
        if($get->search){
            $total = Product::whereIn('id', $search)->orderBy('id', 'desc')->count();
            $product = Product::whereIn('id', $search)->orderBy('id', 'desc')->paginate($paginate);
        }else{
            $total = Product::orderBy('id', 'desc')->count();
            $product = Product::orderBy('id', 'desc')->paginate($paginate);
        }
        $qry = $get;
        return view('products.index', compact('product', 'total', 'paginate', 'variants', 'qry'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\Factory|\Illuminate\Http\Response|\Illuminate\View\View
     */
    public function create()
    {
        $variants = Variant::all();
        return view('products.create', compact('variants'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(Request $get)
    {
        $validator = Validator::make($get->all(), [
            "title" => "required",
            "sku" => "required|unique:products,sku",
            "description" => "required",
            "product_image" => "required",
        ],[
            "title.required" => "Enter product title",
            "sku.required" => "Enter product sku",
            "sku.unique" => "Product sku already taken.",
            "description.required" => "Enter product descriptions",
            "product_image.required" => "Choose some image of this product",
        ]);
        if($validator->fails()){
            return response()->json(['status' => false, "message" => "Some fileds are requied, please provided valid data", "validator" => false, 'errors' => $validator->errors()]);
        }

        $title = $get->title;
        $sku = $get->sku;
        $description = $get->description;
        
        $product_image = $get->product_image;
        $product_variant = $get->product_variant;
        $product_variant_prices = $get->product_variant_prices;

        $checkExt = collect($product_image)->map(function($item){
            $getType = explode("/", $item['type']);
            $getExt = $getType[1];
            return $getExt;
        });
        $oddExtension = array_diff($checkExt->toArray(), ['png', 'jpg', 'jpeg']);
        if(count($oddExtension) > 0){
            return response()->json(['status' => false, "message" => "Please use valid image. Image extension should be png, jpg, jpeg"]);
        }

        // return $product_variant_prices;
               
        $product = new Product();
        $product->title = $title;
        $product->sku = $sku;
        $product->description = $get->description;
        $product->created_at = Carbon::now();
        $product->save();

        foreach($product_variant as $item){
            $id = $item['option'];
            foreach($item['tags'] as $tag){
                $var = new ProductVariant;
                $var->variant = strtolower($tag);
                $var->variant_id = $id;
                $var->product_id = $product->id;
                $var->created_at = Carbon::now();
                $var->save();
            }
        } 

        $pvr = [];
        foreach($product_variant_prices as $item){
            $pvr_title = array_filter(explode("/", $item['title']));
            $pvtrItem = 1;
            $pvrDataItem = [];
            foreach($pvr_title as $pvTitle){
                $gtpv = ProductVariant::where('variant', strtolower($pvTitle))->where('product_id', $product->id)->first();
                if($gtpv){
                    $pvrDataItem['item_'.$pvtrItem] = $gtpv->id;
                }
                $pvtrItem++;
            }
            $pvrDataItem['price'] = $item['price'];
            $pvrDataItem['stock'] = $item['stock'];
            $pvrDataItem['product_id'] = $product->id;
            array_push($pvr, $pvrDataItem);
        }

        foreach($pvr as $pvItem){
            $prPrice = new ProductVariantPrice;
            $prPrice->product_variant_one = isset($pvItem['item_1']) ? $pvItem['item_1'] : null;
            $prPrice->product_variant_two = isset($pvItem['item_2']) ? $pvItem['item_2'] : null;
            $prPrice->product_variant_three = isset($pvItem['item_3']) ? $pvItem['item_3'] : null;
            $prPrice->product_id = $pvItem['product_id'];
            $prPrice->price = $pvItem['price'];
            $prPrice->stock = $pvItem['stock'];
            $prPrice->created_at = Carbon::now();
            $prPrice->save();
        }
        
        $fileHandler = new FileHandler();
        foreach($product_image as $img){
            try{
                $image = Image::make(file_get_contents($img['url']));
                $file = $fileHandler->getFile([
                    'data' => $img,
                    'oldFile' => null,
                    'type' => 'product_file',
                    'path' => 'product', 
                    'height' => 300, 
                    'width' => null, 
                    'image' => $image, 
                    'title' => $get->title
                ]);
                $productImg = new ProductImage;
                $productImg->product_id = $product->id;
                $productImg->file_path = '/dist/product/'.$file;
                $productImg->thumbnail = 1;
                $productImg->created_at = Carbon::now();
                $productImg->save();                
            }catch(\Exception $e){
            
            }            
        }
        return response()->json(['status' => true, 'message' => "Product has been stored successfully"]);

    }


    /**
     * Display the specified resource.
     *
     * @param \App\Models\Product $product
     * @return \Illuminate\Http\Response
     */
    public function show($product)
    {
        
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param \App\Models\Product $product
     * @return \Illuminate\Http\Response
     */
    public function edit(Product $product)
    {
        $productImage = $product->images;
        // return $productImage;
        $productVariant = $product->variant;
        $ownVariant = collect($productVariant)->unique("variant_id")->values()->pluck('variant_id')->all();
        $newVariant = [];
        foreach($ownVariant as $item){
            $items = Variant::where('id', $item)->first();
            if($items){
                array_push($newVariant, $items);
            }
        }
        if(Variant::count() > count($newVariant)){
            $lastItems = collect(Variant::whereNotIn('id', $ownVariant)->get());
            $newVariant = collect($newVariant)->merge($lastItems);
        }
        $variants = $newVariant;        
        $productVariantPrice = $product->priceVariant;
        return view('products.edit', compact('variants', 'product', 'ownVariant', 'productVariant', 'productVariantPrice', 'productImage'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param \App\Models\Product $product
     * @return \Illuminate\Http\Response
     */
    public function update(Request $get, Product $product)
    {
        $validator = Validator::make($get->all(), [
            "title" => "required",
            "sku" => "required|unique:products,sku,$product->id,id",
            "description" => "required",
        ],[
            "title.required" => "Enter product title",
            "sku.required" => "Enter product sku",
            "sku.unique" => "Product sku already taken.",
            "description.required" => "Enter product descriptions"
        ]);
        if($validator->fails()){
            return response()->json(['status' => false, "message" => "Some fileds are requied, please provided valid data", "validator" => false, 'errors' => $validator->errors()]);
        }

        $title = $get->title;
        $sku = $get->sku;
        $description = $get->description;
        
        $removeImage = $get->removeImage;
        $product_image = $get->product_image;
        $product_variant = $get->product_variant;
        $product_variant_prices = $get->product_variant_prices;

        // return $product_variant_prices;
        $product->title = $title;
        $product->sku = $sku;
        $product->description = $get->description;
        $product->updated_at = Carbon::now();
        $product->save();
        
        $fileHandler = new FileHandler();
        if($product_image){
            $checkExt = collect($product_image)->map(function($item){
                $getType = explode("/", $item['type']);
                $getExt = $getType[1];
                return $getExt;
            });
            $oddExtension = array_diff($checkExt->toArray(), ['png', 'jpg', 'jpeg']);
            if(count($oddExtension) > 0){
                return response()->json(['status' => false, "message" => "Please use valid image. Image extension should be png, jpg, jpeg"]);
            }
            foreach($product_image as $img){
                try{
                    $image = Image::make(file_get_contents($img['url']));
                    $file = $fileHandler->getFile([
                        'data' => $img,
                        'oldFile' => null,
                        'type' => 'product_file',
                        'path' => 'product', 
                        'height' => 300, 
                        'width' => null, 
                        'image' => $image, 
                        'title' => $get->title
                    ]);
                    $productImg = new ProductImage;
                    $productImg->product_id = $product->id;
                    $productImg->file_path = '/dist/product/'.$file;
                    $productImg->thumbnail = 1;
                    $productImg->created_at = Carbon::now();
                    $productImg->save();                
                }catch(\Exception $e){
                
                }            
            }
        }

        foreach($removeImage as $item){
            if(isset($item['imageName'])){
                $imageName = $item['imageName'];
                $fileHandler->deleteFile(['path' => 'product', 'file' => str_replace("/dist/product/", "", $item['file_path'])]);
                ProductImage::where('id', $item['id'])->delete();
            }
        }

        ProductVariant::where('product_id', $product->id)->delete();

        foreach($product_variant as $item){
            $id = $item['option'];
            foreach($item['tags'] as $tag){
                $var = new ProductVariant;
                $var->variant = strtolower($tag);
                $var->variant_id = $id;
                $var->product_id = $product->id;
                $var->created_at = Carbon::now();
                $var->save();
            }
        } 

        ProductVariantPrice::where('product_id', $product->id)->delete();
        $pvr = [];
        foreach($product_variant_prices as $item){
            $pvr_title = array_filter(explode("/", $item['title']));
            $pvtrItem = 1;
            $pvrDataItem = [];
            foreach($pvr_title as $pvTitle){
                $gtpv = ProductVariant::where('variant', strtolower($pvTitle))->where('product_id', $product->id)->first();
                if($gtpv){
                    $pvrDataItem['item_'.$pvtrItem] = $gtpv->id;
                }
                $pvtrItem++;
            }
            $pvrDataItem['price'] = $item['price'];
            $pvrDataItem['stock'] = $item['stock'];
            $pvrDataItem['product_id'] = $product->id;
            array_push($pvr, $pvrDataItem);
        }

        foreach($pvr as $pvItem){
            $prPrice = new ProductVariantPrice;
            $prPrice->product_variant_one = isset($pvItem['item_1']) ? $pvItem['item_1'] : null;
            $prPrice->product_variant_two = isset($pvItem['item_2']) ? $pvItem['item_2'] : null;
            $prPrice->product_variant_three = isset($pvItem['item_3']) ? $pvItem['item_3'] : null;
            $prPrice->product_id = $pvItem['product_id'];
            $prPrice->price = $pvItem['price'];
            $prPrice->stock = $pvItem['stock'];
            $prPrice->created_at = Carbon::now();
            $prPrice->save();
        }
        return response()->json(['status' => true, 'message' => "Product has been updated successfully"]);

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param \App\Models\Product $product
     * @return \Illuminate\Http\Response
     */
    public function destroy(Product $product)
    {
        //
    }

    
    protected function searchQuery($get){
        $titleProduct = [];
        $dateProduct = [];
        $priceProduct = [];
        $variantProduct = [];
        $variantFound = $dateFound = $priceFound = false;
        $title = $get['title'];

        $product = Product::where('title', 'LIKE', "%$title%")->get();
        $titleProduct = $product->pluck('id')->toArray();

        if($get['date'] && $get['date'] != null){
            $dateFound = true;
            $newDate = Carbon::parse($get['date']);
            $product = Product::whereDate('created_at', $newDate)->get();
            $dateProduct = $product->pluck('id')->toArray();
        }
        if($get['price_from'] != null && $get['price_to'] != null){
            $priceFound = true;
            $from = (double) $get['price_from'];
            $to = (double) $get['price_to'];
            $product = ProductVariantPrice::where('price', ">=", $from)->where('price', '<=', $to)->get();
            $priceProduct = $product->pluck('product_id')->toArray();
        }
        if($get['variant'] != null){
            $variantFound = true;
            $variant = $get['variant'];
            $product = ProductVariant::where('variant', $variant)->get();
            $variantProduct = $product->pluck('product_id')->toArray();
            // return [$variant, $variantProduct];
        }
        $takeId = $titleProduct;
        if($dateFound==true){
            $takeId = collect($takeId)->filter(function($item) use ($dateProduct){
                if(in_array($item, $dateProduct)){
                    return $item;
                }
            })->toArray();
            $takeId = array_values($takeId);
        }
        if($priceFound==true){
            $takeId = collect($takeId)->filter(function($item) use ($priceProduct){
                if(in_array($item, $priceProduct)){
                    return $item;
                }
            })->toArray();
            $takeId = array_values($takeId);
        }
        
        if($variantFound==true){
            $takeId = collect($takeId)->filter(function($item) use ($variantProduct){
                if(in_array($item, $variantProduct)){
                    return $item;
                }
            })->toArray();
            $takeId = array_values($takeId);
        }
        return array_values(array_filter($takeId));
    }

}
