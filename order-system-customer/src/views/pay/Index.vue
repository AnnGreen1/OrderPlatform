<template>
    <div class="pay">
        <van-nav-bar class="nav-bar" title="订单列表" left-arrow @click-left="router"></van-nav-bar>
        <div class="pay-container">
          <item v-for="(item,index) in formids" :key="index" :formid="item" />
        </div>
    </div>
</template>

<script>
import { formids } from "@/api/pay";
import item from "./components/item.vue";
export default {
  data() {
    return {
     formids:[]
    };
  },
  components: {
    item
  },
  methods: {
    router() {
      this.$router.push({ name: "home", query: { shopid: localStorage.getItem("shopid"), tableid: localStorage.getItem("tableid") } });
    },
  },
  created() {
    formids({username:localStorage.getItem('u_username'),shopid:parseInt(localStorage.getItem('shopid'))})
      .then((res) => {
        console.log(res);
        if (res.code == 15) {
          this.formids = res.data.formids;
        }
      })
      .catch((error) => {
        console.log(error);
      });
  },
};
</script>

<style lang="scss" scoped>
.pay{
  height:auto;
  .pay-container{
    // height:500px;
        //  overflow:
  }
}
</style>