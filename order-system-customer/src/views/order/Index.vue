<template>
  <div class="order">
    <van-nav-bar class="nav-bar" :title="shopname + ' ' + tableid + ' ' + '号桌'" left-arrow @click-left="router"></van-nav-bar>
    <div class="order-container">
      <van-sidebar v-model="activeKey">
        <van-sidebar-item v-for="item in goodtype" :key="item.value" :title="item.label" />
      </van-sidebar>
      <div class="order-container-right" @scroll="scroll" ref="goods">
        <!-- <van-card num="2" price="2.00" desc="描述信息" title="商品标题" thumb="https://img01.yzcdn.cn/vant/ipad.jpeg" /> -->
        <van-card v-for="(item, index) in goods" :key="index" :price="(item.g_price / 100).toFixed(2)" :desc="item.g_dishDesc" :title="item.g_dishName" :thumb="item.g_imgUrl">
          <template #footer>
            <van-button size="mini" @click="minus(index)" :disabled="num[index] === 0">
              <van-icon name="minus" />
            </van-button>
            <span>{{ num[index] }}</span>
            <van-button size="mini" @click="plus(index)">
              <van-icon name="plus" />
            </van-button>
          </template>
        </van-card>
      </div>
    </div>
    <van-submit-bar :price="price" button-text="提交订单" @submit="onSubmit" :disabled="price == 0" />
  </div>
</template>

<script>
import goodtype from "@/utils/enum";
import { goods, neworder } from "@/api/order";
import { Dialog } from "vant";
export default {
  data() {
    return {
      shopname: "",
      tableid: 0,
      goodtype: [],
      goods: [],
      activeKey: 4,
      num: [],
      price: 0,
    };
  },
  computed: {
    // 计算属性的 getter
  },
  methods: {
    router() {
      this.$router.push({ name: "home", query: { shopid: localStorage.getItem("shopid"), tableid: localStorage.getItem("tableid") } });
    },
    setparams() {
      this.shopname = this.$route.query.shopname;
      this.tableid = this.$route.query.tableid;
    },
    scroll(event) {
      console.log("scroll");
      let top = event.target.scrollTop;
      console.log(top);
      this.$refs.goods.scrollHeight;
      this.$refs.goods.scrollTop;
      console.log(this.$refs.goods.scrollHeight + " " + this.$refs.goods.scrollTop);
    },
    minus(index) {
      console.log(index);
      let newv = this.num[index] - 1;
      this.num.splice(index, 1, newv);
      console.log(this.num);
      this.pricefun();
    },
    plus(index) {
      console.log(index);
      let newv = this.num[index] + 1;
      this.num.splice(index, 1, newv);
      console.log(this.num);
      this.pricefun();
    },
    pricefun() {
      console.log("prices");
      let i = 0;
      this.price = 0;
      this.num.forEach((item) => {
        this.price += this.goods[i].g_price * parseInt(item);
        i++;
      });
    },
    onSubmit() {
      Dialog.confirm({
        title: "确认提交",
        message: "弹窗内容",
      })
        .then(() => {
          let nums = [];
          let gids = [];
          // this.num.forEach(item => {

          // })
          let i = 0;
          for (i = 0; i < this.num.length; i++) {
            if (this.num[i] != 0) {
              nums.push(this.num[i]);
              gids.push(this.goods[i].g_id);
            }
          }
          console.log(nums);
          console.log(gids);
          // let data = {
          //   username:localStorage.getItem('username'),
          //   price:
          // }
          let price = [];
          for (i = 0; i < nums.length; i++) {
            price.push(nums[i] * this.goods[i].g_price);
          }
          console.log(nums);
          console.log(gids);
          console.log(price);
          // let data = ;
          neworder({
            username:localStorage.getItem('u_username'),
            price:price,
            gids:gids,
            shopid: parseInt(localStorage.getItem("shopid")),
            nums:nums,
            tableid:parseInt(localStorage.getItem("tableid"))
            }).then((res) => {
              console.log(res);
              if (res.code == 14) {
                console.log('成功给你');
              }
            })
            .catch((error) => {
              console.log(error);
            });
        })
        .catch(() => {
          // on cancel
        });
    },
  },
  created() {
    this.setparams();
    let temp = goodtype.find((item) => item.shopid == localStorage.getItem("shopid"));
    temp.options.shift();
    this.goodtype = temp.options;
    console.log(this.goodtype);

    goods({ shopid: localStorage.getItem("shopid") })
      .then((res) => {
        console.log(res);
        if (res.code == 12) {
          this.goods = res.data.goods;
          this.num = new Array(this.goods.length).fill(0);
        }
      })
      .catch((error) => {
        console.log(error);
      });
  },
};
</script>

<style lang="scss" scoped>
.order {
  &-container {
    &-right {
      position: absolute;
      top: 50px;
      left: 85px;
      width: 300px;
      height: 700px;

      overflow: scroll;
    }
  }
}
</style>
