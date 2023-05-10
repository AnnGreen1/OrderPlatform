<template>
  <div class="data">
    <nav-bar class="goods-navbar" activeIndex="8"></nav-bar>
    <div class="data-container">
      <div class="data-container-item">
        <goods></goods>
      </div>
      <div class="data-container-item">
        <banlance></banlance>
      </div>
    </div>
  </div>
</template>

<script>
import NavBar from "@/components/NavBar.vue";
import goods from "./components/goods.vue";
import banlance from "./components/banlance.vue";
import { randqinghua } from "@/api/api";
export default {
  data() {
    return {};
  },
  components: {
    "nav-bar": NavBar,
    goods: goods,
    banlance: banlance,
  },
  methods: {},
  created() {
    let randqinghua_data = { format: "json" };
    randqinghua(randqinghua_data)
      .then((res) => {
        console.log(res);
      })
      .catch((error) => {
        console.log(error);
      });
  },
};
</script>

<style lang="scss" scoped>
.data {
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
    &-item{
        width:1100px;
        height:400px;
    }
  }
}
</style>
