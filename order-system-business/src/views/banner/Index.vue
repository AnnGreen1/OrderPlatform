<template>
  <div class="banner">
    <nav-bar class="banner-navbar" activeIndex="2"></nav-bar>
    <div class="banner-container">
      <el-tabs v-model="activeName" @tab-click="handleClick">
        <el-tab-pane label="图片" name="first">
          <imgs></imgs>
        </el-tab-pane>
        <el-tab-pane label="banner" name="second">
          <banner></banner>
        </el-tab-pane>
      </el-tabs>
    </div>
  </div>
</template>

<script>
import NavBar from "@/components/NavBar.vue";
import banner from "./components/banner.vue";
import imgs from "./components/imgs.vue";
export default {
  data() {
    return {
      activeName: "second",
    };
  },
  components: {
    "nav-bar": NavBar,
    banner,
    imgs,
    // "state-bar": StateBar,
  },
  methods: {
    handleClick(tab, event) {
      console.log(tab, event);
    },
  },
  created() {},
};
</script>

<style lang="scss" scoped>
.banner {
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
    width: calc(100vw - 250px);
    overflow: auto;
    margin: 10px;
  }
}
</style>
