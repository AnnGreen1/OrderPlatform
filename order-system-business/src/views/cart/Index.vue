<template>
  <div class="cart">
    <nav-bar class="cart-navbar" activeIndex="5"></nav-bar>
    <div class="cart-container">
        cart
    </div>
  </div>
</template>

<script>
import { randqinghua } from "@/api/api";
import NavBar from "@/components/NavBar.vue";
export default {
  data() {
    return {};
  },
  components: {
    "nav-bar": NavBar,
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
.cart {
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
