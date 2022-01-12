@extends('layouts.app')

@section('content')
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Edit Product</h1>
    </div>
    <div id="app">
        <update-product :product="{{ $product }}" :own-variant="{{ json_encode($ownVariant) }}" :product-variant="{{ $productVariant }}" :product-image="{{ $productImage }}" :product-variant-price="{{ $productVariantPrice }}" :variants="{{ json_encode($variants) }}">Loading</update-product>
    </div>
@endsection
