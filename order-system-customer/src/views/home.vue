<template>
  <div class="home">
    <div class="home-face">
      <img :src="'http://localhost/allPHPcode/OrderPlatform/system/resource/shop/bg/' + shop.s_bg" alt="" style="width: 100%" />
    </div>
    <div class="home-main">
      <div class="home-main-info">
        <div class="home-main-info-img">
          <img :src="'http://localhost/allPHPcode/OrderPlatform/system/resource/shop/logo/' + shop.s_logo" alt="" style="width: 100px; height: 100px" />
        </div>
      </div>
      <div class="home-main-info-text-top">{{ shop.s_name }}</div>
      <div class="home-main-info-text-bottom">当前桌台 {{ params.tableid }}桌</div>
      <div class="home-main-function">
        <van-grid clickable :column-num="2" style="height: 200px; margin-bottom: 10px" icon-size="100px">
          <van-grid-item :icon="meating" text="开始点单" @click="router(1)" id="first" />
          <van-grid-item :icon="user" text="会员中心" id="second" to="mine" />
        </van-grid>
        <van-grid clickable :column-num="2" style="height: 100px; width: 103%; padding-left: 0px; margin: 0 auto" :gutter="10">
          <van-grid-item :icon="order" text="买单" to="/pay" id="first" />
          <van-grid-item :icon="certificate" text="优惠券" url="tickets" id="second" />
        </van-grid>
      </div>
    </div>
    <div class="home-banner">
      <van-swipe class="my-swipe" :autoplay="3000" indicator-color="white">
        <van-swipe-item v-for="(banner, index) in banners" :key="index">
          <img :src="'http://localhost/allPHPcode/OrderPlatform/system/resource/shop/banner/' + banner.banner_url" style="width: 100%; height: 200px" />
        </van-swipe-item>
      </van-swipe>
    </div>
  </div>
</template>

<script>
import { initshop, initBanner, inituser } from "@/api/home";
import randID from "@/utils/randID";
export default {
  data() {
    return {
      meating: require("@/assets/imgs/home/meating.svg"),
      user: require("@/assets/imgs/home/user.svg"),
      certificate: require("@/assets/imgs/home/certificate.svg"),
      order: require("@/assets/imgs/home/order.svg"),
      params: {
        shopid: 0,
        tableid: 0,
      },
      shop: {},
      banners: [],
    };
  },
  methods: {
    style() {
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
    },
    setparams() {
      this.params.shopid = this.$route.query.shopid;
      this.params.tableid = this.$route.query.tableid;
      localStorage.setItem("shopid", this.params.shopid);
      localStorage.setItem("tableid", this.params.tableid);
    },
    initBannerFun() {
      let data = { shopid: this.params.shopid };
      initBanner(data)
        .then((res) => {
          console.log(res);
          if (res.code == 2) {
            this.banners = res.data;
          }
        })
        .catch((error) => {
          console.log(error);
        });
    },
    initShopFun() {
      let data = { shopid: this.params.shopid };
      initshop(data)
        .then((res) => {
          console.log(res);
          if (res.code == 1) {
            this.shop = res.data[0];
          }
        })
        .catch((error) => {
          console.log(error);
        });
    },
    router(type) {
      if (type == 1) {
        // order
        this.$router.push({ name: "order", query: { shopname: this.shop.s_name, tableid: this.params.tableid } });
      }
    },
    inituser() {
      console.log(localStorage.getItem("u_username"));
      if (!localStorage.getItem("u_username")) {
        localStorage.setItem("u_username", randID());
        this.u_username = localStorage.getItem("u_username");
        let data = { shopid: this.params.shopid, username: this.u_username };
        inituser(data)
          .then((res) => {
            console.log(res);
            if (res.code == 12) {
              // this.shop = res.data[0];
              console.log("用户初始化成功");
            }
          })
          .catch((error) => {
            console.log(error);
          });
      }
    },
  },
  created() {
    this.style();
    this.setparams();
    this.initShopFun();
    this.initBannerFun();
    this.inituser();
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
