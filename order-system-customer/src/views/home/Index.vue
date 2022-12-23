<template>
  <div class="home">
    <div class="swipe">
      <van-swipe class="my-swipe" :autoplay="3000" indicator-color="white">
        <van-swipe-item v-for="(item, index) in banner" :key="index">
          <img :src="item.banner_url" :width="screenwidth" />
        </van-swipe-item>
      </van-swipe>
    </div>
    <div class="userinfo">
      <img :src="userinfo.avatar" class="userinfo-avatar" />
      <span class="userinfo-nickname">{{ userinfo.nickname }}</span>
      <span class="userinfo-data">
        <div>{{ userinfo.score }}</div>
        <div>积分</div>
      </span>
      <span class="userinfo-data">
        <div>{{ userinfo.ticket }}</div>
        <div>优惠券</div>
      </span>
    </div>
    <div class="product">
      <div class="product-row">
        <div class="product-item"></div>
        <div class="product-item"></div>
      </div>
      <div class="product-row">
        <div class="product-item"></div>
        <div class="product-item"></div>
      </div>
      <div class="product-row">
        <div class="product-item"></div>
      </div>
    </div>
    <tab-bar></tab-bar>
  </div>
</template>

<script>
import TabBar from "@/components/TabBar.vue";
import { initBanner } from "@/api/home";
export default {
  data() {
    return {
      screenwidth: screen.width,
      banner: [],
      userinfo: {
        avatar:
          "http://localhost/allPHPcode/system/resource/user/anngreen.jpeg",
        nickname: "阿凡达",
        score: 13,
        ticket: 34,
      },
      products: [
        {
          icon: "http://localhost/allPHPcode/system/resource/home/activity-pindan.png",
          text: "文字",
          to: "/order",
        },
        {
          icon: "http://localhost/allPHPcode/system/resource/home/activity-pindan.png",
          text: "文字",
          to: "/merge",
        },
        {
          icon: "http://localhost/allPHPcode/system/resource/home/activity-pindan.png",
          text: "文字",
          to: "/delivery",
        },
        {
          icon: "http://localhost/allPHPcode/system/resource/home/activity-pindan.png",
          text: "更多",
          to: "/more",
        },
      ],
    };
  },
  components: {
    "tab-bar": TabBar,
  },
  methods: {},
  created() {
    initBanner()
      .then((res) => {
        console.log(res);
        if (res && res.code == 1001 && res.data) {
          this.banner = res.data;
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
  margin-bottom:50px;
  .userinfo {
    width: 95%;
    height: 65px;
    // border: solid pink;
    margin: 2.5%;
    transform: translateY(-2em);
    border-radius: 7px;
    background-color: rgb(248, 248, 248);
    display: flex;
    align-items: center;
    flex-direction: row;
    box-shadow: 1px 1px gray;
    &-avatar {
      border-radius: 50%;
      height: 50px;
      width: 50px;
      margin: 2px 10px;
    }
    &-nickname {
      margin-right: 20px;
    }
    &-data {
      margin: 10px;
      width: auto;
      font-size: 5px;
      div {
        display: flex;
        justify-content: center;
      }
    }
  }
  .product {
    border: solid pink;
    padding: 10px;

    .product-row {
      display: flex;
      justify-content: space-between;
      .product-item {
        margin: 10px;
        display: inline-block;
        width: 150vh;
        height: 18vh;
        border: solid pink;
      }
    }
  }
}
</style>