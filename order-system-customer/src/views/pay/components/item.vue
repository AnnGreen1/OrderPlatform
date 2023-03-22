<template>
  <div class="item">
    <div class="item-top">
      <div class="item-top-e">订单号：{{ info.f_id }}</div>
      <div class="item-top-e">桌台：{{ info.f_tableid }}</div>
    </div>
    <van-divider />
    <div class="item-body">
      <div class="item-body-good" v-for="(item, index) in goods" :key="index">
        <div class="item-body-good-name">{{ item.g_dishName }}</div>
        <div class="item-body-good-price">{{ item.f_num }} ￥{{ item.f_price }}</div>
      </div>
      <!-- <div class="item-body-good">
        <div class="item-body-good-name">三鲜火锅</div>
        <div class="item-body-good-price">6 78.00</div>
      </div>
      <div class="item-body-good">
        <div class="item-body-good-name">三鲜火锅</div>
        <div class="item-body-good-price">6 ￥78.00</div>
      </div>
      <div class="item-body-good">
        <div class="item-body-good-name">三鲜火锅</div>
        <div class="item-body-good-price">6 78.00</div>
      </div>
      <div class="item-body-good">
        <div class="item-body-good-name">三鲜火锅</div>
        <div class="item-body-good-price">6 ￥78.00</div>
      </div>
      <div class="item-body-good">
        <div class="item-body-good-name">三鲜火锅</div>
        <div class="item-body-good-price">6 78.00</div>
      </div>
      <div class="item-body-good">
        <div class="item-body-good-name">三鲜火锅</div>
        <div class="item-body-good-price">6 ￥78.00</div>
      </div>
      <div class="item-body-good">
        <div class="item-body-good-name">三鲜火锅</div>
        <div class="item-body-good-price">6 78.00</div>
      </div> -->
    </div>

    <van-divider />
    <div class="item-footer">
      <div class="item-footer-time">{{ formatterTime(info.f_time) }}</div>
      <div class="item-footer-price">￥{{ totalprice() }}</div>
    </div>
    <div class="item-button">
      <van-button size="mini" color="#7232dd" round v-if="info.f_status == 0" @click="payfun">支付</van-button>
      <van-button size="mini" color="#7232dd" round v-if="info.f_status == 1">已支付</van-button>
      <van-button size="mini" color="#7232dd" round v-if="info.f_status == 2">已接单</van-button>
      <van-button size="mini" color="#7232dd" round v-if="info.f_status == 3">已完成</van-button>
    </div>
  </div>
</template>

<script>
import { form, pay } from "@/api/pay";
import { Dialog, Toast } from "vant";
export default {
  props: ["formid"],
  data() {
    return {
      info: {},
      goods: [],
    };
  },
  methods: {
    formatterTime(row) {
      console.log(row);
      var date = new Date(row);
      console.log(date);
      console.log(date.getFullYear());
      return date.toLocaleString();
    },
    totalprice() {
      let total = 0;
      this.goods.forEach((item) => {
        total += item.f_price;
      });
      return total;
    },
    payfun() {
      Dialog.confirm({
        title: "确认支付？",
        message: "",
      })
        .then(() => {
          pay({
            formid: this.info.f_id,
          })
            .then((res) => {
              console.log(res);
              if (res.code == 17) {
                console.log("支付成功");
                Toast("支付成功");
                this.formfun();
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
    formfun() {
      let data = { formid: this.formid.f_id, shopid: parseInt(localStorage.getItem("shopid")), username: localStorage.getItem("u_username") };
      form(data)
        .then((res) => {
          console.log(res);
          if (res.code == 16) {
            this.info = res.data.info;
            this.goods = res.data.goods;
          }
        })
        .catch((error) => {
          console.log(error);
        });
    },
  },
  created() {
    this.formfun();
  },
};
</script>

<style lang="scss" scoped>
.item {
  border: solid;
  height: auto;
  padding: 10px 20px;
  border-radius: 10px;
  margin: 2px 5px;
  &-top {
    &-e {
      margin: 6px 0;
    }
  }
  &-body {
    &-good {
      height: 30px;
      &-name {
        float: left;
      }
      &-price {
        float: right;
      }
    }
  }
  &-footer {
    height: 20px;
    &-time {
      float: left;
    }
    &-price {
      float: right;
    }
  }
  &-button {
    // float:right;
    height: 30px;
    // width:50px;
    button {
      float: right;
      margin-right: -50px;
      margin-top: 10px;
    }
  }
}
</style>
