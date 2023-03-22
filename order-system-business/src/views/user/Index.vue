<template>
  <div class="user">
    <nav-bar class="banner-navbar" activeIndex="3"></nav-bar>
    <div class="user-container">
      <div class="user-container-table">
        <el-table :data="tableData" border style="width: 100%">
          <el-table-column prop="u_id" label="编号" width="180"> </el-table-column>
          <el-table-column prop="u_username" label="用户名" width="180"> </el-table-column>
          <el-table-column prop="u_avatar" label="头像">
            <template slot-scope="scope">
              <img :src="'http://localhost/allPHPCode/OrderPlatform/system/resource/user/' + scope.row.u_avatar" alt="" srcset="" style="witdh: 10vw; height: 10vh" />
            </template>
          </el-table-column>
          <el-table-column prop="u_balance" label="消费金额"> </el-table-column>
          <el-table-column prop="u_expirestime" label="注册时间"> </el-table-column>
          <el-table-column prop="u_payword" label="支付密码"> </el-table-column>
          <el-table-column prop="u_score" label="积分"> </el-table-column>
        </el-table>
        <el-pagination background layout="total, prev, pager, next" :total="total" :page-size="pageSize" :current-page="pageIndex" @prev-click="prev" @next-click="next"> </el-pagination>
      </div>
    </div>
  </div>
</template>

<script>
import NavBar from "@/components/NavBar.vue";
import { users } from "@/api/user";
export default {
  data() {
    return {
      total: 0,
      pageIndex: 1,
      pageSize: 5,
      tableData: [],
    };
  },
  components: {
    "nav-bar": NavBar,
  },
  methods: {
    pagedata(pageindex, pagesize) {
      users({ pageIndex: pageindex, pageSize: pagesize, shopid: localStorage.getItem("shopid") })
        .then((res) => {
          console.log(res);
          if (res.code == 19) {
            this.total = res.data.total;
            this.tableData = res.data.users;
          }
        })
        .catch((error) => {
          console.log(error);
        });
    },
    prev(pageIndex) {
      this.pagedata(pageIndex, this.pageSize);
    },
    next(pageIndex) {
      this.pagedata(pageIndex, this.pageSize);
    },
  },
  created() {
    this.pagedata(this.pageIndex, this.pageSize);
  },
};
</script>

<style lang="scss" scoped>
.user {
  &-nvabar {
    display: inline;
    position: relative;
    left: 0px;
    top: 0px;
  }

  &-container {
    position: absolute;
    left: 210px;
    top: 10px;
    height: 98vh;
    width: calc(100vw - 250px);
    overflow: auto;
    margin: 10px;
  }
}
</style>
