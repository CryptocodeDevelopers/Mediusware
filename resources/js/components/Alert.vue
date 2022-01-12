<template>
    <transition name="slide-x" appear v-if="showAlert" :duration="100">
        <div class="alert-card" :key="showAlert">
            <div class="overlay-screen">
                <div class="alert-card-box" :type="type">
                    <div class="alert-icon text-center">
                        <i :class="`${alertIcon}`"></i>
                    </div>
                    <div class="alert-title">
                        {{ title }}
                    </div>
                    <div class="alert-message" v-html="message"></div>
                    <div class="alert-items" v-if="showItem">
                        <div class="alert-item" v-for="(eItem, ei) in errorItems" :key="ei">
                            <strong>{{ ucFirst(ei, '_') }}</strong> :
                            <span>{{ eItem[0] }}</span>
                        </div>
                    </div>
                    <div class="alert-card-action">
                        <slot name="action">
                            <button @click="closeModel" color="success" outline text>
                                Okay
                            </button>
                            <button @click="closeModel" color="danger" outline text>
                                Close
                            </button>
                        </slot>
                    </div>
                </div>
            </div>
        </div>
    </transition>
</template>

<script>
export default {
    name: "alert-card",
    props: ["type", "title", "message", "items"],
    data: () => ({
        errorItems: [],
        showAlert: false,
        alertIcon: "mdi-alert-outline",
        showItem: false
    }),
    model: {
        prop: "modelValue",
        event: "change"
    },
    created() {
        this.showAlert = this.$attrs.modelValue;
        if (this.items) {
            this.errorItems = this.items;
        }
        this.loadFunc(this.errorItems, this.type);
    },
    methods: {
        closeModel() {
            this.$emit("change", false);
            this.showAlert = false;
        },
        loadFunc(errorItems, type){
            if (type == "success") {
                this.alertIcon = "fas fa-fw fa-check";
            } else if (type == "info") {
                this.alertIcon = "fas fa-fw fa-info-circle";
            } else if (type == "error" || type == "danger") {
                this.alertIcon = "fas fa-fw fa-exclamation-triangle";
            } else if (type == "alert") {
                this.alertIcon = "fas fa-fw fa-exclamation-triangle";
            }
            if (errorItems.length) {
                if (errorItems.length == 0) {
                    this.showItem = false;
                } else {
                    this.showItem = true;
                }
            } else {
                if (Object.values(errorItems).length > 0) {
                    this.showItem = true;
                } else {
                    this.showItem = false;
                }
            }
        },
        ucFirst(string, spl = null) {
            let first = string.charAt(0).toUpperCase();
            let finalReturn = first + string.slice(1);
            if (spl) {
                let splt = finalReturn.split(spl);
                let splstr = "";
                splt.map(ele => {
                    splstr += `${ele} `;
                });
                let finalStr = splstr.slice(0, -1);
                return finalStr;
            } else {
                return finalReturn;
            }
        },
    },
    watch: {
        $props: {
            handler(val){
                this.type = val.type;
                if (val.items) {
                    this.errorItems = val.items;
                }
                this.loadFunc(this.errorItems, this.type);
            },
            deep: true,
        },
        $attrs: {
            handler(val){
                this.showAlert = val.modelValue;
            },
            deep: true,
        }
    }
};
</script>
<style lang="css">

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

.alert-card {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    background: rgba(0, 0, 0, 0.30);
    z-index: 100;
    height: 100%;
    backdrop-filter: blur(3px);
}

.alert-card-box {
    position: absolute;
    overflow: hidden;
    left: 50%;
    top: 20%;
    width: 500px;
    background: #fff;
    color: var(--dark);
    padding: 20px;
    border-radius: 0.7rem;
    transform: translate(-50%, 0);
    /* box-shadow: 0 10px 30px 0px rgba(0, 0, 0, 0.4); */
}

.alert-card-box .alert-icon i {
    font-size: 60px;
    color: var(--danger);
}

.alert-card-box .alert-title {
    font-size: 18px;
    text-align: center;
    font-weight: bold;
}

.alert-card-box .alert-message {
    font-size: 14px;
    margin-bottom: 10px;
    margin-top: 1px;
    text-align: center;
}

.alert-card-box .alert-item {
    background: #e26f6f29;
    border-radius: 0.10rem;
    padding: 5px 10px;
    margin-bottom: 5px;
    color: #d22d2d;
    border: 1px solid #d22d2d15;
    font-size: 14px;
}

.alert-card-action {
    text-align: center;
    /* display: flex; */
    justify-content: center;
    align-items: center;
    margin-top: 20px;
}

.alert-card-box[type="alert"] {
    background: var(--whiteColor);
    color: var(--dark);
}

.alert-card-box[type="alert"] .alert-icon i {
    color: var(--warning);
}

.alert-card-box[type="alert"] .alert-title {
    color: var(--warning);
}

.alert-card-box[type="error"] {
    background: var(--whiteColor);
    color: var(--dark);
}

.alert-card-box[type="error"] .alert-icon i {
    color: var(--danger);
}

.alert-card-box[type="error"] .alert-title {
    color: var(--danger);
}

.alert-card-box[type="success"] {
    background: var(--whiteColor);
    color: var(--dark);
}

.alert-card-box[type="success"] .alert-icon i {
    color: var(--success);
}

.alert-card-box[type="success"] .alert-title {
    color: var(--success);
}

.alert-card-box[type="info"] {
    background: var(--whiteColor);
    color: var(--info);
}

.alert-card-box[type="info"] .alert-icon i {
    color: var(--info);
}

.alert-card-box[type="info"] .alert-title {
    color: var(--info);
}


.slide-y-enter-active,
.slide-y-leave-active {
    transform: translateY(0);
    transition: all 300ms;
    opacity: 1;
}

.slide-y-enter,
.slide-y-leave-to {
    transition: all 300ms;
    transform: translateY(-50px);
    opacity: 0;
}

.slide-x-enter-active,
.slide-x-leave-active {
    transform: translateX(0);
    transition: all 300ms;
    opacity: 1;
}

.slide-x-enter,
.slide-x-leave-to {
    transition: all 300ms;
    transform: translateX(-100px);
    opacity: 0;
}

button{
    border: none;
    padding: 5px 20px;
    border-radius: 0.15rem;
    outline: 0;
}

button[color="success"]{
    background: var(--success);
    color: var(--whiteColor);
}
button[color="primary"]{
    background: var(--primary);
    color: var(--whiteColor);
}
button[color="danger"]{
    background: var(--danger);
    color: var(--whiteColor);
}

</style>
