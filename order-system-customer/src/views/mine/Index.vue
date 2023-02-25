<template>
  <div class="container">
    <van-nav-bar class="nav-bar" :title="title" left-arrow @click-left="router"></van-nav-bar>
    <div class="user-info">
      <img width="100" height="100" :src="'/static/imgs/mine/' + icon" />
      <div v-if="username">{{ username }}</div>
    </div>
    <van-cell-group>
      <van-cell icon="shield-o" title="登录密码" is-link @click="$router.push({ path: '/mine/password' })" />
      <van-cell icon="location-o" title="修改地址" is-link @click="$router.push({ path: '/mine/address' })" />
      <van-cell icon="smile-o" title="修改头像" is-link @click="$router.push({ path: '/mine/icon' })" />
      <van-cell icon="closed-eye" title="支付密码" is-link @click="$router.push({ path: '/mine/payword' })" />
      <van-cell icon="gold-coin-o" title="我的财富" is-link @click="$router.push({ path: '/mine/balance' })" />
      <van-cell icon="revoke" title="退出登录" is-link to="/login" />
    </van-cell-group>
  </div>
</template>

<script>
export default {
  data() {
    return {
      title:"",
      username: "",
      icon: "",
      src: "",
    };
  },
  methods: {
    router() {
      this.$router.push({ name: "home", query: { shopid: localStorage.getItem("shopid"), tableid: localStorage.getItem("tableid") } });
    },
  },
  created() {
    // this.title = 
  },
};
</script>

<style lang="scss" scoped>
.container {
  // border: solid;
  // border-color: pink;
  // padding: 20px;

  .user-info {
    padding-top: 30px;
    img {
      border-radius: 50%;
    }
    background-image: url(../../assets/imgs/mine/user-info-background-image.png);
    height: 150px;
    span {
      line-height: 20px;
      font-size: 20px;
    }
  }

  .menu {
    border-style: solid;
    width: 100%;
    height: 400px;
  }
}
</style>
