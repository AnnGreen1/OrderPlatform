<template>
  <div class="item">
    <div class="item-top">
      <div class="item-top-e">订单号：</div>
      <div class="item-top-e">桌台：</div>
    </div>
    <van-divider />
    <div class="item-body">
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
      </div>
      <div class="item-body-good">
        <div class="item-body-good-name">三鲜火锅</div>
        <div class="item-body-good-price">6 ￥78.00</div>
      </div>
      <div class="item-body-good">
        <div class="item-body-good-name">三鲜火锅</div>
        <div class="item-body-good-price">6 78.00</div>
      </div>
    </div>

    <van-divider />
    <div class="item-footer">
      <div class="item-footer-time">2023 02-23 12:12:12</div>
      <div class="item-footer-price">￥79.00</div>
    </div>
  </div>
</template>

<script>
// import { randqinghua, wenjianliu } from "@/api/api";
export default {
  props: ["formid"],
  data() {
    return {};
  },
  methods: {},
  created() {},
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
}
</style>
