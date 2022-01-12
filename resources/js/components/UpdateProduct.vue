<template>
    <section>
        <div class="row">
            <div class="col-md-6">
                <div class="card shadow mb-4">
                    <div class="card-body">
                        <div class="form-group">
                            <label for="">Product Name</label>
                            <input type="text" v-model="product_name" placeholder="Product Name" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="">Product SKU</label>
                            <input type="text" v-model="product_sku" placeholder="Product Name" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="">Description</label>
                            <textarea v-model="description" id="" cols="30" rows="4" class="form-control"></textarea>
                        </div>
                    </div>
                </div>

                <div class="card shadow mb-4">
                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                        <h6 class="m-0 font-weight-bold text-primary">Media</h6>
                    </div>
                    <div class="card-body border">
                        <vue-dropzone ref="myVueDropzone" @vdropzone-success="fileUploaded" id="dropzone" :options="dropzoneOptions"></vue-dropzone>
                    </div>
                </div>
                <div class="card shadow mb-4">
                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                        <h6 class="m-0 font-weight-bold text-primary">Images</h6>
                    </div>
                    <div class="card-body border">
                        <div class="img-item mb-2" v-for="img, im in productImage" :key="im">
                            <img :src="img.file_path" style="width: 60px">
                            <span class="pl-2">
                                {{ img.file_path }}
                            </span>
                            <label :for="`removeImg_+${im}`" class="pl-2">
                                <input :id="`removeImg_+${im}`" type="checkbox" name="imageLists" v-model="img.imageName">
                                Remove
                            </label>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <div class="card shadow mb-4">
                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                        <h6 class="m-0 font-weight-bold text-primary">Variants</h6>
                    </div>
                    <div class="card-body">
                        <div class="row" v-for="(item,index) in product_variant" :key="index">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="">Option</label>
                                    <select v-model="item.option" class="form-control">
                                        <option v-for="variant, vkey in variants" :value="variant.id" :key="vkey">
                                            {{ variant.title }}
                                        </option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="form-group">
                                    <!-- <label v-if="product_variant.length != 1" @click="product_variant.splice(index,1); checkVariant" -->
                                    <label v-if="product_variant.length != 1" @click="removeVariant(item, index)"
                                           class="float-right text-primary"
                                           style="cursor: pointer;">Remove</label>
                                    <label v-else for="">.</label>
                                    <input-tag v-model="item.tags" @input="checkVariant" class="form-control"></input-tag>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer" v-if="product_variant.length < variants.length && product_variant.length < 3">
                        <button @click="newVariant" class="btn btn-primary">Add another option</button>
                    </div>

                    <div class="card-header text-uppercase">Preview</div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                <tr>
                                    <td>Variant</td>
                                    <td>Price</td>
                                    <td>Stock</td>
                                </tr>
                                </thead>
                                <tbody>
                                <tr v-for="variant_price, ksvr in product_variant_prices" :key="ksvr">
                                    <td>{{ variant_price.title }}</td>
                                    <td>
                                        <input type="text" class="form-control" v-model="variant_price.price">
                                    </td>
                                    <td>
                                        <input type="text" class="form-control" v-model="variant_price.stock">
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="alert alert-primary" v-if="loading">
            Please wait, process is preparing for store this product.
        </div>

        <button @click="saveProduct" type="submit" class="btn btn-lg btn-primary">Update Product</button>
        <button type="button" class="btn btn-secondary btn-lg">Cancel</button>
        <alert v-model="alertCard.status" :title="alertCard.title" :type="alertCard.type" :message="alertCard.message" :items="alertCard.items"/>
    </section>
</template>

<script>
import vue2Dropzone from 'vue2-dropzone'
import 'vue2-dropzone/dist/vue2Dropzone.min.css'
import InputTag from 'vue-input-tag'

export default {
    components: {
        vueDropzone: vue2Dropzone,
        InputTag
    },
    props: {
        variants: {
            type: Array,
            required: true
        },
        ownVariant: {
            type: Array,
            required: true
        },
        product: {
            type: Object,
            required: true
        },
        productVariant: {
            type: Array,
            required: true
        },
        productVariantPrice: {
            type: Array,
            required: true
        },
        productImage: {
            type: Array,
            required: true
        },
    },
    data() {
        return {
            loading: false,
            alertCard: {
                status: false,
                type: 'success',
                title: 'Title',
                message: 'Message',
                items: [],
            },
            product_id: null,
            product_name: '',
            product_sku: '',
            description: '',
            images: [],
            product_variant: [],
            product_variant_prices: [],
            dropzoneOptions: {
                url: 'https://httpbin.org/post',
                thumbnailWidth: 150,
                maxFilesize: 0.5,
                headers: {"My-Awesome-Header": "header value"}
            }
        }
    },
    created(){
        this.product_id = this.product.id;
        this.product_name = this.product.title;
        this.product_sku = this.product.sku;
        this.description = this.product.description;
        this.initVariant();
    },
    methods: {
        // it will push a new object into product variant
        newVariant() {
            let all_variants = this.variants.map(el => el.id)
            let selected_variants = this.product_variant.map(el => el.option);
            let available_variants = all_variants.filter(entry1 => !selected_variants.some(entry2 => entry1 == entry2))
            this.product_variant.push({
                option: available_variants[0],
                tags: []
            })
        },

        initVariant(){
            this.variants.filter(ele => {
                let tags = [];
                let id = ele.id;
                let getIndex = this.productVariant.findIndex(findEle => findEle.variant_id == id);
                if(getIndex != -1){
                    this.productVariant.map(newEle => {
                        if(id == newEle.variant_id){
                            tags.push(newEle.variant);
                        }
                    });
                    this.product_variant.push({
                        option: id,
                        tags: tags
                    });
                }
             });
            this.product_variant_prices = [];
            this.productVariantPrice.map((ele) => {
                let firstVarient = this.productVariant.find(fl => fl.id == ele.product_variant_one);
                let secondVarient = this.productVariant.find(fl => fl.id == ele.product_variant_two);
                let thirdVarient = this.productVariant.find(fl => fl.id == ele.product_variant_three);
                this.product_variant_prices.push({
                    title: this.varItems(firstVarient,secondVarient,thirdVarient),
                    price: ele.price,
                    stock: ele.stock,
                });
            });
        },

        varItems(firstItem, secondItem, thirdItem){
            let makeFullObject = firstItem.variant;
            if(secondItem){
                makeFullObject = makeFullObject + "/" + secondItem.variant;
            }
            if(thirdItem){
                makeFullObject = makeFullObject + "/" + thirdItem.variant;
            }
            return makeFullObject;
        },

        // check the variant and render all the combination
        checkVariant() {
            let tags = [];
            this.product_variant.filter((item) => {
                console.log(item);
                tags.push(item.tags);
            });
            let newEntry = [];
            this.getCombn(tags).forEach((item) => {
                let findIndex = this.product_variant_prices.findIndex(ele => {
                    let getTitle = item.slice(0, -1);
                    return getTitle == ele.title
                });
                if(findIndex == -1) {
                    newEntry.push({
                        title: item,
                        price: 0,
                        stock: 0
                    });
                }else{
                    let findItem = this.product_variant_prices[findIndex];
                    return newEntry.push({
                        title: item,
                        price: findItem.price,
                        stock: findItem.stock
                    });
                }
            });
            this.product_variant_prices = newEntry;
        },

        // combination algorithm
        getCombn(arr, pre) {
            pre = pre || '';
            if (!arr.length) {
                return pre;
            }
            let self = this;
            let ans = arr[0].reduce(function (ans, value) {
                let titleData = ans.concat(self.getCombn(arr.slice(1), pre + value + '/'));
                return titleData;  
            }, []);
            return ans;
        },

        // store product into database
        saveProduct() {
            let product = {
                title: this.product_name,
                sku: this.product_sku,
                description: this.description,
                product_image: this.images,
                product_variant: this.product_variant,
                product_variant_prices: this.product_variant_prices,
                removeImage: this.productImage,
            }
            this.loading = true;
            axios.put('/product/'+this.product_id, product).then(response => {
                let data = response.data;
                this.loading = false;
                if(data.status == false){
                    this.showAlert({
                        type: 'error',
                        title: 'What\'s wrong!',
                        message: data.message,
                        validator: data.validator ?? true,
                        items: data.errors ?? [],
                    });
                }else{
                     this.showAlert({
                        type: 'success',
                        title: 'Product Updated',
                        message: data.message,
                        validator: true,
                        items: [],
                    });
                }
            }).catch(error => {
                this.loading = false;
            })
        },
        fileUploaded(file, response){
            this.images.push({
                url: file.dataURL,
                type: file.type,
                name: file.name,
            });
        },
        showAlert(array){
            this.alertCard.type = array.type;
            this.alertCard.title = array.title;
            this.alertCard.message = array.message;
            this.alertCard.items = array.items;
            this.alertCard.status = true;
        },
        removeVariant(item, index){
            this.product_variant.splice(index,1); 
            this.checkVariant();
        }
    },
    mounted() {
        // console.log('Component mounted.')
    },
    watch: {
        product_variant:{
            handler(val){

            },
            deep: true,
        }
    }
}
</script>
