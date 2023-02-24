<template>
    <div>
        <div class="banner">

        </div>
        <div class="main">
            点单，我的。买单，优惠券
        </div>
    </div>
</template>

<script>
import { randqinghua } from '@/api/api'
export default {
    data(){
        return{

        }
    },
    methods:{

    },
    created(){
        let randqinghua_data = {'format':'json'}
        randqinghua(randqinghua_data).then((res)=>{
            console.log(res)
        }).catch((error)=>{
            console.log(error);
        })
    }
}
</script>