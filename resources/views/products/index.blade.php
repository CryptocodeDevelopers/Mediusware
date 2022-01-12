@extends('layouts.app')
@php
    use App\Models\ProductVariant;
    $sl = $product->firstItem();
@endphp

@section('content')
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Products</h1>
    </div>
    <div class="card">
        <form action="{{ URL::current() }}" method="get" class="card-header">
            <input type="hidden" name="search" value="product">
            <div class="form-row justify-content-between">
                <div class="col-md-2">
                    <input type="text" name="title" placeholder="Product Title" class="form-control" value="{{ $qry->title ? $qry->title : '' }}">
                </div>
                <div class="col-md-2">
                    <select name="variant" id="" class="form-control">
                        <option value="">Choose Variant</option>
                        @foreach($variants as $item)
                            @php 
                                $productVariant = App\Models\ProductVariant::where('variant_id', $item->id)->groupBy('variant')->get();
                            @endphp
                            <optgroup label="{{ $item->title }}">
                                @foreach($productVariant as $vItem)
                                <option {{ $qry && $qry->variant == $vItem->variant ? 'selected' : '' }} value="{{ $vItem->variant }}">{{ ucfirst($vItem->variant) }}</option>
                                @endforeach
                            </optgroup>
                        @endforeach
                    </select>
                </div>

                <div class="col-md-3">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Price Range</span>
                        </div>
                        <input type="text" name="price_from" aria-label="First name" placeholder="From" class="form-control" value="{{ $qry->price_from ? $qry->price_from : '' }}">
                        <input type="text" name="price_to" aria-label="Last name" placeholder="To" class="form-control" value="{{ $qry->price_to ? $qry->price_to : '' }}">
                    </div>
                </div>
                <div class="col-md-2">
                    <input type="date" name="date" placeholder="Date" class="form-control" value="{{ $qry->date ? $qry->date : '' }}">
                </div>
                <div class="col-md-1">
                    <button type="submit" class="btn btn-primary float-right"><i class="fa fa-search"></i></button>
                </div>
            </div>
        </form>

        <div class="card-body">
            <div class="table-response">
                <table class="table">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Title</th>
                            <th>Description</th>
                            <th>Variant</th>
                            <th width="150px">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                    @if($total > 0)
                        @foreach($product as $item)
                        <tr>
                            <td>{{ $sl }}</td>
                            <td>{{ $item->title }} <br> Created at : {{ date('d-M-Y', strtotime($item->created_at)) }}</td>
                            <td>{{ $item->description }}</td>
                            <td>
                                <dl class="row mb-0" style="height: 80px; overflow: hidden" id="variant">
                                    @foreach($item->priceVariant as $pv)
                                    <dt class="col-sm-3 pb-0" style="white-space: nowrap">
                                        @php
                                            $vA = ProductVariant::where('id', $pv->product_variant_one)->first();
                                            $vTW = ProductVariant::where('id', $pv->product_variant_two)->first();
                                            $vTH = ProductVariant::where('id', $pv->product_variant_three)->first();
                                            if($vA){
                                                echo strtoupper($vA->variant);
                                            }
                                            if($vTW){
                                                echo '/'.strtoupper($vTW->variant);
                                            }
                                            if($vTH){
                                                echo '/'.strtoupper($vTH->variant);
                                            }
                                        @endphp
                                    </dt>
                                    <dd class="col-sm-9">
                                        <dl class="row mb-0">
                                            <dt class="col-sm-4 pb-0">Price : {{ number_format($pv->price, 2) }}</dt>
                                            <dd class="col-sm-8 pb-0">InStock : {{ number_format($pv->stock, 2) }}</dd>
                                        </dl>
                                    </dd>
                                    @endforeach
                                </dl>
                                <button onclick="$('#variant').toggleClass('h-auto')" class="btn btn-sm btn-link">Show more</button>
                            </td>
                            <td>
                                <div class="btn-group btn-group-sm">
                                    <a href="{{ route("product.edit", $item->id) }}" class="btn btn-success">Edit</a>
                                </div>
                            </td>
                        </tr>
                        @php
                            $sl++;
                        @endphp
                        @endforeach
                    @else 
                        <tr class="text-center">
                            <td colspan="5">Sorry, there nothing to show</td>
                        </tr>
                    @endif
                </tbody>

                </table>
            </div>

        </div>

        <div class="card-footer">
            <div class="row justify-content-between">
                <div class="col-md-6">
                    @if($total > 0)
                    <p>Showing {{ $product->firstItem() }} to {{ $product->firstItem() + $product->count() -1 }} out of {{ $total }}</p>
                    @else
                    <p>No result found here</p>
                    @endif
                </div>
                <div class="col-md-2">
                    {!! $product->withQueryString()->links() !!}
                </div>
            </div>
        </div>
    </div>

@endsection
