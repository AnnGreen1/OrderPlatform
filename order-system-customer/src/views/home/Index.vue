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
      <div class="product-row" @click="$router.push({ path: '/home/ForHere' })">
        <div class="product-item">
          <div class="product-item-img">
            <img src="@/assets/imgs/home/ForHere-removebg-preview.png" alt="">
          </div>
          <div class="product-item-text">
            店内用餐
          </div>
        </div>
      </div>
      <div class="product-row" @click="$router.push({ path: '/home/TakeAway' })">
        <div class="product-item">
          <div class="product-item-img">
            <img src="@/assets/imgs/home/TakeAway-removebg-preview.png" alt="">
          </div>
          <div class="product-item-text">
            打包自取
          </div>
        </div>
      </div>
      <div class="product-row">
        <div class="product-item">
          <div class="product-item-img">
            <img src="@/assets/imgs/home/Wait-removebg-preview.png" alt="">
          </div>
          <div class="product-item-text">
            敬请期待
          </div>
        </div>
      </div>
    </div>
    <div class="footer">
      <center class="footer-text">我是有底线的</center>
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
          "http://localhost/allPHPcode/OrderPlatform/system/resource/user/anngreen.jpeg",
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
  methods: {
    initBanner() {
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
    }
  },
  created() {
    console.log(this.$route.query.shopid);
    localStorage.setItem('shopid', this.$route.query.shopid)
    console.log(localStorage.getItem('shopid'));
    this.initBanner()
  },
};
</script>

<style lang="scss" scoped>
.home {
  margin-bottom: 70px;

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
    transform: translateY(-1em);
    // border: solid pink;
    padding: 10px;

    .product-row {
      display: flex;
      justify-content: space-between;

      .product-item {
        background-color: rgb(248, 248, 248);
        box-shadow: 1px 1px gray;
        border-radius: 5px;
        margin: 10px;
        display: flex;
        align-items: center;
        width: 150vh;
        height: 18vh;
        // border: solid pink;
        padding: 0 20px;

        &-img {
          margin-right: 15px;

          img {
            width: 120px;
          }
        }

        &-text {
          font-size: 40px;
        }
      }
    }
  }

  .footer {
    margin: 10px;

    &-text {
      color: #ccc;
    }

    &-text::before {
      content: '';
      height: 1px;
      top: 50%;
      width: 30%;
      height: 1px;
      border-bottom: 1px solid #ccc;
      display: inline-block;
      margin-right: 24px;
      margin-bottom: 4px;
    }

    &-text::after {
      content: '';
      top: 50%;
      width: 30%;
      height: 1px;
      border-bottom: 1px solid #ccc;
      display: inline-block;
      margin-left: 24px;
      margin-bottom: 4px;
    }
  }
}
</style>