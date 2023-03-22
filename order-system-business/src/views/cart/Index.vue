<template>
  <div class="cart">
    <nav-bar class="cart-navbar" activeIndex="5"></nav-bar>
    <div class="cart-container">
      <el-select v-model="value" placeholder="请选择">
        <el-option v-for="item in options" :key="item.value" :label="item.label" :value="item.value"> </el-option>
      </el-select>
      <el-button @click="query">查询</el-button>
      <el-table :data="tableData" border style="width: 100%">
        <el-table-column prop="id" label="id" width="60"> </el-table-column>
        <el-table-column prop="f_id" label="订单号" width="110"> </el-table-column>
        <el-table-column prop="f_u_username" label="用户名" width="100"> </el-table-column>
        <el-table-column prop="f_price" label="价格" width="50"> </el-table-column>
        <!-- <el-table-column prop="f_status" label="状态" width="180" > </el-table-column> -->
        <el-table-column prop="g_dishName" label="商品名" width="150"> </el-table-column>
        <el-table-column prop="f_status" label="状态" width="100" :formatter="formatterstatus"></el-table-column>
        <el-table-column prop="f_num" label="数量"> </el-table-column>
        <el-table-column prop="f_time" label="时间" :formatter="formatterTime"></el-table-column>
        <el-table-column fixed="right" label="操作" width="150">
          <template slot-scope="scope">
            <el-button @click="done(scope.row.f_id, 2)" type="text" size="small" v-if="scope.row.f_status == 1">接单</el-button>
            <el-button type="text" size="small" @click="done(scope.row.f_id, 3)" v-if="scope.row.f_status == 2">完成</el-button>
          </template>
        </el-table-column>
      </el-table>
      <el-pagination background layout="total, prev, pager, next" :total="total" :page-size="pageSize" :current-page="pageIndex" @prev-click="prev" @next-click="next"> </el-pagination>
    </div>
  </div>
</template>

<script>
import { cart, formstatus } from "@/api/cart";
import NavBar from "@/components/NavBar.vue";
export default {
  data() {
    return {
      tableData: [],
      total: 0,
      pageIndex: 1,
      pageSize: 5,
      options: [
        {
          value: 0,
          label: "未支付",
        },
        {
          value: 1,
          label: "已支付",
        },
        {
          value: 2,
          label: "已接单",
        },
        {
          value: 3,
          label: "已完成",
        },
      ],
      value: 0,
    };
  },
  components: {
    "nav-bar": NavBar,
  },
  methods: {
    pagedata(pageindex, pagesize) {
      cart({ pageIndex: pageindex, pageSize: pagesize, shopid: localStorage.getItem("shopid"), f_status: this.value })
        .then((res) => {
          console.log(res);
          if (res.code == 11) {
            this.total = res.data.total;
            this.tableData = res.data.goods;
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
    formatterTime(row) {
      console.log(row);
      var date = new Date(row.f_time*1000);
      console.log(date);
      console.log(date.getFullYear());
      return date.toLocaleString();
    },
    formatterstatus(row) {
      if (row.f_status == 0) return "未付款";
      else if (row.f_status == 1) return "已支付";
      else if (row.f_status == 2) return "已接单";
      else return "已完成";
    },
    query() {
      this.pagedata(this.pageIndex, this.pageSize);
    },
    done(formidp, statusp) {
      formstatus({ formid: formidp, status: statusp })
        .then((res) => {
          console.log(res);
          if (res.code == 18 && statusp == 2) {
            this.$message("接单成功");
          } else {
            this.$message("订单完成");
          }
          this.pagedata(this.pageIndex, this.pageSize);
        })
        .catch((error) => {
          console.log(error);
        });
    },
  },
  created() {
    this.pagedata(this.pageIndex, this.pageSize);
  },
};
</script>

<style lang="scss" scoped>
.cart {
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
    width: calc(100vw - 210px);
    overflow: auto;
  }
}
</style>
