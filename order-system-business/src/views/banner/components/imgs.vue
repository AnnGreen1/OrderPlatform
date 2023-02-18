<template>
    <div>
        <el-button>新建</el-button>
        
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