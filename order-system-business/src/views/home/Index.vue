<template>
  <div class="home">
    <nav-bar class="home-navbar" activeIndex="1"></nav-bar>
    <div class="home-container">
      <el-select v-model="nowshop" placeholder="请选择" size="mini	" @change="changeshop">
        <el-option v-for="item in shops" :key="item.s_id" :label="item.s_name" :value="item.s_id"> </el-option>
      </el-select>
      <shop v-for="(shop, index) in shops" :key="index" :shop="shop"></shop>
    </div>
  </div>
</template>

<script>
import NavBar from "@/components/NavBar.vue";
import shop from "@/views/home/components/shop.vue";
import { shops } from "@/api/home";
export default {
  data() {
    return {
      shops: [],
      nowshop: 1,
    };
  },
  components: {
    "nav-bar": NavBar,
    shop: shop,
  },
  methods: {
    changeshop(value) {
      localStorage.setItem("shopid", value);
      let shop = this.shops.find((item) => item.s_id == value);
      localStorage.setItem("shopcolor", shop.s_color);
    },
  },
  created() {
    //get shopids
    let param = {};
    if (localStorage.getItem("s_username") == "") {
      //admin
      param.type = 1;
      param.username = localStorage.getItem("a_username");
    } else {
      //shop
      param.type = 2;
      param.username = localStorage.getItem("s_username");
    }
    shops(param)
      .then((res) => {
        if (res.code == 2) {
          this.shops = res.shops;
          this.shops.forEach((item) => {
            item.checked = false;
          });
          this.shops[0].checked = true;
          this.nowshop = res.shops[0].s_id;
          localStorage.setItem("shopid", this.shops[0].s_id);
        }
      })
      .catch((error) => {
        console.log(error);
      });
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
    width: calc(100vw - 210px);
    overflow: auto;
  }
}
</style>
