<template>
    <div>
        1、用户数量
        2、店铺名
        3、店铺地址
        4、店铺余额
        5、店铺tabber
        6、店铺bannner
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