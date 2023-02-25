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
        <van-grid clickable :column-num="2" style="height: 200px; margin-bottom: 10px" icon-size="100px">
          <van-grid-item :icon="meating" text="开始点单" to="/" id="first" />
          <van-grid-item :icon="user" text="会员中心" url="/vant/mobile.html" id="second" />
        </van-grid>
        <van-grid clickable :column-num="2" style="height: 100px; width: 103%; padding-left: 0px; margin: 0 auto" :gutter="10">
          <van-grid-item :icon="order" text="买单" to="/" id="first" />
          <van-grid-item :icon="certificate" text="优惠券" url="/vant/mobile.html" id="second" />
        </van-grid>
      </div>
    </div>
    <div class="home-banner">
      <van-swipe class="my-swipe" :autoplay="3000" indicator-color="white">
        <van-swipe-item>
          <img :src="images[0]" style="width:100%;height:200px;" />
        </van-swipe-item>
        <van-swipe-item>
          <img :src="images[1]" style="width:100%;height:200px;" />
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
      meating: require("@/assets/imgs/home/meating.svg"),
      user: require("@/assets/imgs/home/user.svg"),
      certificate: require("@/assets/imgs/home/certificate.svg"),
      order: require("@/assets/imgs/home/order.svg"),
      screenwidth: screen.width,
      banner: [],
      images: ["https://img01.yzcdn.cn/vant/apple-1.jpg", "https://img01.yzcdn.cn/vant/apple-2.jpg"],
    };
  },
  methods: {},
  created() {
    this.$nextTick(() => {
      let funtext = document.getElementsByClassName("van-grid-item__content")[0];
      var para = document.createElement("span");
      para.setAttribute("class", "van-grid-item__text");
      para.innerHTML = "快速点单，不用排队";
      funtext.appendChild(para);

      let funtextII = document.getElementsByClassName("van-grid-item__content")[1];
      var paraII = document.createElement("span");
      paraII.setAttribute("class", "van-grid-item__text");
      paraII.innerHTML = "查看订单，会员卡等";
      funtextII.appendChild(paraII);

      let funtextIII = document.getElementsByClassName("van-grid-item__text")[0];
      funtextIII.setAttribute("style", "font-size:16px;color:rgb(41,41,41);");

      let funtextIV = document.getElementsByClassName("van-grid-item__text")[2];
      funtextIV.setAttribute("style", "font-size:16px;color:rgb(41,41,41);");
    });

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
          ::v-deep .van-grid-item__text {
            font-size: 10px;
          }
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
    }
  }
  &-banner {
    transform: translateY(-11em);
  }
}
</style>
