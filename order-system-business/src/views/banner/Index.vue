<template>
  <div class="banner">
    <nav-bar class="banner-navbar"></nav-bar>

    <div class="banner-container">banner.vue</div>
  </div>
</template>

<script>
import NavBar from "@/components/NavBar.vue";
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
  }
}
</style>