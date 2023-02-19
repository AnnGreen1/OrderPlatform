<template>
  <div class="shop">
    <!-- 1、用户数量
                    2、店铺名
                    3、店铺地址
                    4、店铺余额
                    5、店铺tabber
                    6、店铺bannner -->

    <el-descriptions :title="shop.s_name" :column="3" class="shop-description">
      <el-descriptions-item label="用户名">{{
        shop.s_username
      }}</el-descriptions-item>
      <el-descriptions-item label="用户数量">{{
        othershopinfo.usernum
      }}</el-descriptions-item>
      <el-descriptions-item label="总营业额">{{
        shop.s_balance
      }}</el-descriptions-item>
      <el-descriptions-item label="tabbar">{{
        othershopinfo.tabbarname
      }}</el-descriptions-item>
      <el-descriptions-item label="banner">{{
        othershopinfo.bannername
      }}</el-descriptions-item>
      <el-descriptions-item label="店铺地址">{{
        shop.s_address
      }}</el-descriptions-item>
    </el-descriptions>
  </div>
</template>

<script>
// import emitter from '@/utils/bus'
import { othershopinfo } from "@/api/home";
export default {
  props: ["shop"],
  data() {
    return {
      othershopinfo: {},
    };
  },
  created() {
    othershopinfo({ shopid: this.shop.s_id })
      .then((res) => {
        console.log(res);
        this.othershopinfo = res.data;
        console.log(this.othershopinfo);
      })
      .catch((error) => {
        console.log(error);
      });
    console.log(this.shop);
  },
};
</script>

<style lang="scss" scoped>
.shop {
  // border: solid;
  width: calc(100vw - 225px);
  height: 150px;

  &-description {
    padding: 15px;
  }
}
</style>
