<template>
  <div class="home">
    <nav-bar class="home-navbar" activeIndex=1></nav-bar>
    <!-- <state-bar class="home-statebar"></state-bar> -->
    <div class="home-container">
      
        <!-- <shop></shop>
        <shop></shop>
        <shop></shop> -->
        <shop v-for="(shop,index) in shops" :key="index" :shopid="shop.s_id"></shop>
   
    </div>
  </div>
</template>

<script>
import NavBar from "@/components/NavBar.vue";
import shop from "@/views/home/components/shop.vue"
import { shops } from '@/api/home'
export default {
  data() {
    return {
      shops:[]
    };
  },
  components: {
    "nav-bar": NavBar,
    "shop":shop
  },
  methods: {},
  created() {
    console.log(localStorage.getItem('s_username')=='');
    console.log(localStorage.getItem('a_username'));
    //get shopids
    let param = { }
    if(localStorage.getItem('s_username')==''){
      //admin
      param.type = 1;
      param.username = localStorage.getItem('a_username');
    }else{
      //shop
      param.type = 2;
      param.username = localStorage.getItem('s_username');
    }
    shops(param).then((res)=>{
      console.log(res);
      if(res.code==1001){
        this.shops = res.shops;
      }
    }).catch((error)=>{
      console.log(error);
    })
  },
};
</script>
<style lang="scss" scoped>
.home {
  &-nvabar {
    display: inline;
    position: relative;
    left: 0px;
    top: 0px;
  }
  &-container {
    position: absolute;
    left: 210px;
    top: 10px;
    height: 98vh;
    width:calc(100vw - 210px);
    overflow: auto;
    // &-body{
    //   width:1800px;
    //   height:100%;
    //   border: solid;
    // }
  }
}
</style>