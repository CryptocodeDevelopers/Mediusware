<template>
    <div class="paginate-box" :align="align" v-if="totalPage > 1">
        <button title="Previous" :disabled="activePage == 1" @click="choosePage(activePage-1)"><i class="mdi mdi-arrow-left"></i></button>
        <button :class="`${activePage == 1 ?  'active-page' : ''}`" title="Page 1" @click="choosePage(1)">1</button>
        <span v-for="page, ik in allPage" :key="ik">
            <button v-if="page > 1" :title="`Page ${page}`" :class="`${activePage == page ?  'active-page' : ''}`" @click="choosePage(page)">{{ page }}</button>
        </span>
        <button v-if="totalPage > 1" :class="`${activePage == totalPage ?  'active-page' : ''}`" :title="`Page ${totalPage}`" @click="choosePage(totalPage)">{{ totalPage }}</button>
        <button title="Next" :disabled="activePage == totalPage" @click="choosePage(activePage+1)"><i class="mdi mdi-arrow-right"></i></button>
    </div>
</template>
<script>
export default {
    name: 'm-paginate',
    props: ['total-page', 'align', 'active', 'show'],
    data: () => ({
        activePage: 1,
        showing: true,
        lastPage: 0,
        firstObject: [],
        secondObject: [],
        devidedPage:0,
        allPage: 1,
    }),
    model: {
        event: "change",
    },
    created(){
        if(this.active){
            this.activePage = this.active;
        }
        if(this.show){
            this.showing = this.show;
        }
        this.loadPageInfo();
    },
    methods: {
        choosePage(page){
            this.activePage = page;
            this.$emit('loadPage', page);
        },
        loadPageInfo(val = null){
            let getLastPage = this.totalPage;
            if(val != null){
                this.showing = val.show;
                getLastPage = val.totalPage;
            }
            this.allPage = parseInt(getLastPage)-1;
        }
    },
    watch: {
        page: function(newVal, oldval){
            this.$emit('loadPage', newVal);
        },
        $props: {
            handler(val){
                this.loadPageInfo(val);
            },
            deep: true
        }
    },
}
</script>
<style scoped>
:root{
    --whiteColor: #fff;
    --primary: #3a7ee3;
    --secondary: #6c757d;
    --purple: #9959EA;
    --dark: #113452;
    --success: #44BD62;
    --info: #00b0ff;
    --warning: #F57C00;
    --danger: #f14e4d;
}
    
.paginate-box {
    display: block;
    width: 100%;
    padding: 20px 0px;
}

.paginate-box[align="center"] {
    text-align: center;
}

.paginate-box[align="right"] {
    text-align: right;
}

.paginate-box button {
    margin-right: 5px;
    border-radius: 50%;
    min-height: 32px;
    min-width: 32px;
    padding: 0px;
    text-align: center;
}

.paginate-box button:hover {
    transition: all 200ms linear;
    background: var(--primary);
}

.paginate-box button.active-page {
    background: var(--primary);
    color: var(--whiteColor);
}
</style>