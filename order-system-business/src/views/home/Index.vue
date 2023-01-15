<template>
  <div class="home">
    <nav-bar class="home-navbar" activeIndex=1></nav-bar>
    <!-- <state-bar class="home-statebar"></state-bar> -->
    <div class="home-container">home.vue</div>
  </div>
</template>

<script>
import NavBar from "@/components/NavBar.vue";
// import StateBar from "@/components/StateBar.vue";
export default {
  data() {
    return {};
  },
  components: {
    "nav-bar": NavBar,
    // "state-bar": StateBar,
  },
  methods: {},
  created() {},
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
  }
}
</style>