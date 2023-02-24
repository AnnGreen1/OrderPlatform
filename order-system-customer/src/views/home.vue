<template>
  <div class="home">
    <div class="home-face">
      <img src="http://localhost/allPHPcode/OrderPlatform/system/resource/home/2(1).png" alt="" style="width: 100%" />
    </div>
    <div class="home-main">
      <div class="home-main-info">
        <div class="home-main-info-img">
          <img src="http://localhost/allPHPcode/OrderPlatform/system/resource/home/anngreen.jpeg" alt="" style="width: 100px; height: 100px" />
        </div>
      </div>
      <div class="home-main-info-text-top">属小d是dsdsddsd的是的众火锅</div>
      <div class="home-main-info-text-bottom">档期是的是的那朱 23桌</div>
      <div class="home-main-function">
        <van-grid clickable :column-num="2" style="height: 200px; margin-bottom: 10px">
          <van-grid-item icon="home-o" text="路由跳转" to="/" id="first" />
          <van-grid-item icon="search" text="URL 跳转" url="/vant/mobile.html" id="second" />
        </van-grid>
        <van-grid clickable :column-num="2" style="height: 100px; width: 360px; padding-left: 0px" :gutter="10">
          <van-grid-item icon="home-o" text="路由跳转" to="/" id="first" />
          <van-grid-item icon="search" text="URL 跳转" url="/vant/mobile.html" id="second" />
        </van-grid>
      </div>
    </div>
    <div class="home-banner">
      <van-swipe class="my-swipe" :autoplay="3000" indicator-color="white">
        <van-swipe-item v-for="(item, index) in banner" :key="index">
          <img :src="item.banner_url" :width="screenwidth" />
        </van-swipe-item>
      </van-swipe>
    </div>
  </div>
</template>

<script>
import { initBanner } from "@/api/home";
export default {
  data() {
    return {
      screenwidth: screen.width,
      banner: [],
    };
  },
  methods: {},
  created() {
    let initBanner_data = { format: "json" };
    initBanner(initBanner_data)
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
.home {
  // background-color: rgb(242, 244, 243);
  &-face {
  }
  &-main {
    transform: translateY(-19em);
    &-info {
      width: 100px;
      height: 100px;
      margin: 0 auto;
      img {
        border-radius: 50%;
      }
    }
    &-info-text-top {
      text-align: center;
      font-size: 1.2rem;
      margin: 0.2rem 0;
      color: white;
      margin-bottom: 20px;
      margin-top: 20px;
    }
    &-info-text-bottom {
      color: white;
      margin: 0.2rem 0;
      text-align: center;
      margin-bottom: 20px;
    }
    &-function {
      width: 90%;
      height: 200px;
      background: rgb(248, 248, 248);
      // border:solid;
      margin: 0 auto;
      border-radius: 20px;
      #first {
        ::v-deep .van-grid-item__content {
          background: rgb(242, 244, 243);
          // border-radius-ri: 17px;
          border-top-left-radius: 17px;
          border-bottom-left-radius: 17px;
        }
      }
      #second {
        ::v-deep .van-grid-item__content {
          background: rgb(242, 244, 243);
          // border-radius-ri: 17px;
          border-top-right-radius: 17px;
          border-bottom-right-radius: 17px;
        }
      }
      // ::v-deep .van-grid-item__content:nth-child(2) {
      //   background: pink;
      //   // border-radius-ri: 17px;
      //   border-top-right-radius: 17px;
      //   border-bottom-left-radius: 17px;
      // }
    }
  }
  &-banner {
  }
}
</style>
