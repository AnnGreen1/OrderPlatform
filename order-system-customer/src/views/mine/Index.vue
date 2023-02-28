<template>
  <div class="container">
    <van-nav-bar class="nav-bar" :title="title" left-arrow @click-left="router"></van-nav-bar>
    <div class="user-info">
      <img width="100" height="100" :src="icon" />
      <div v-if="u_username">会员 {{ u_username }}</div>
    </div>
    <van-cell-group>
      <van-cell icon="shield-o" title="我的订单" is-link @click="$router.push({ path: '/mine/password' })" />
      <van-cell icon="location-o" title="我的优惠券" is-link @click="$router.push({ path: '/mine/address' })" />
      <van-cell icon="smile-o" title="修改头像" is-link @click="$router.push({ path: '/mine/icon' })" />
      <van-cell icon="closed-eye" title="支付密码" is-link @click="$router.push({ path: '/mine/payword' })" />
      <van-cell icon="gold-coin-o" title="我的财富" is-link @click="$router.push({ path: '/mine/balance' })" />
      <van-cell icon="revoke" title="退出登录" is-link to="/login" />
    </van-cell-group>
  </div>
</template>

<script>
import randID from "@/utils/randID";
export default {
  data() {
    return {
      title: "会员中心",
      username: "",
      icon: require("@/assets/imgs/mine/anngreen.jpeg"),
      src: "",
      u_username: "",
    };
  },
  methods: {
    router() {
      this.$router.push({ name: "home", query: { shopid: localStorage.getItem("shopid"), tableid: localStorage.getItem("tableid") } });
    },
  },
  created() {
    console.log(localStorage.getItem("u_username"));
    if (!localStorage.getItem("u_username")) localStorage.setItem("u_username", randID());
    this.u_username = localStorage.getItem("u_username");
  },
};
</script>

<style lang="scss" scoped>
.container {
  // border: solid;
  // border-color: pink;
  // padding: 20px;

  .user-info {
    // filter: blur(10px);
    // background:rgb(183,186,205) ;
    background-image: linear-gradient(to bottom right, rgb(176, 183, 224), rgb(226, 227, 235));
    margin: 10px 20px;
    // padding-top: 30px;
    border-radius: 15px;
    padding-left:10px;
   display: flex;
            // justify-content: center;
            align-items: center;
    img {
      border-radius: 50%;
      border: 5px;
      display:inline-block;
    }

    height: 150px;
    div {
      margin-left:10px;
      width:300px;
      height:20px;
      font-size: 20px;
      color:white;
       font-family: Verdana, Arial, Helvetica, sans-serif;
    }
  }

  .menu {
    border-style: solid;
    width: 100%;
    height: 400px;
  }
}
</style>
