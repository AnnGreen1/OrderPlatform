<template>
  <div class="order">
    <van-nav-bar class="nav-bar" :title="shopname + ' ' + tableid + ' ' + '号桌'" left-arrow @click-left="router"></van-nav-bar>
    <div class="order-container">
      <van-sidebar v-model="activeKey">
        <van-sidebar-item title="标签名称" />
        <van-sidebar-item title="标签名称" />
        <van-sidebar-item title="标签名称" />
      </van-sidebar>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      shopname: "",
      tableid: 0,
    };
  },
  methods: {
    router() {
      this.$router.push({ name: "home", query: { shopid: localStorage.getItem("shopid"), tableid: localStorage.getItem("tableid") } });
    },
    setparams() {
      this.shopname = this.$route.query.shopname;
      this.tableid = this.$route.query.tableid;
    },
  },
  created() {
    this.setparams();
  },
};
</script>
