<template>
  <div class="goods">
    <nav-bar class="goods-navbar" activeIndex="4"></nav-bar>
    <div class="goods-container">
      <div class="goods-container-form">
        <el-form :inline="true" :model="form">
          <el-form-item label="上架与否">
            <el-select v-model="form.g_status" size="mini">
              <el-option label="全部" :value="2"></el-option>
              <el-option label="已下架" :value="0"></el-option>
              <el-option label="已上架" :value="1"></el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="商品类型">
            <el-select v-model="form.g_type" size="mini">
              <el-option v-for="(item, index) in goodtype.options" :key="index" :label="item.label" :value="item.value"></el-option>
              <!-- <el-option label="区域二" value="beijing"></el-option> -->
            </el-select>
          </el-form-item>
          <el-form-item label="商品名称">
            <el-input v-model="form.g_dishName" size="mini"></el-input>
          </el-form-item>
          <el-form-item>
            <el-button type="primary" size="mini" @click="pagedata">查询 </el-button>
          </el-form-item>
        </el-form>
      </div>
      <div class="goods-container-table">
        <el-table :data="tableData" border style="width: 100%">
          <el-table-column prop="g_id" label="商品编号" width="50"> </el-table-column>
          <el-table-column prop="g_dishName" label="商品名" width="180"> </el-table-column>
          <el-table-column prop="g_dishDesc" label="商品描述" width="180"> </el-table-column>
          <el-table-column prop="g_imgUrl" label="商品图片" width="100">
            <template slot-scope="scope">
              <img :src="scope.row.g_imgUrl" alt="" srcset="" style="width: 5vw; height: 10vh" />
            </template>
          </el-table-column>
          <el-table-column prop="g_createdTime" label="创建时间" width="180" :formatter="formatterCreateTime"> </el-table-column>
          <el-table-column prop="g_publishTime" label="最新发布时间" width="180" :formatter="formatterPublishTime"> </el-table-column>
          <el-table-column prop="g_type" label="商品类型" width="100" :formatter="formatterType"> </el-table-column>
          <el-table-column prop="g_status" label="商品状态" width="100" :formatter="formatterStatus"></el-table-column>
          <el-table-column prop="g_price" label="价格">
            <template slot-scope="scope"> ￥{{ (scope.row.g_price / 100).toFixed(2) }} </template>
          </el-table-column>
          <el-table-column fixed="right" label="操作" width="150">
            <template>
              <el-button type="text" size="small">删除</el-button>
              <el-button type="text" size="small">添加banner</el-button>
            </template>
          </el-table-column>
        </el-table>
        <el-pagination background layout="total, prev, pager, next" :total="total" :page-size="pageSize" :current-page="pageIndex" @prev-click="prev" @next-click="next"> </el-pagination>
      </div>
    </div>
  </div>
</template>

<script>
import NavBar from "@/components/NavBar.vue";
import goodtype from "@/utils/enum";
import { goods } from "@/api/goods";
export default {
  data() {
    return {
      goodtype: {},
      form: {
        g_status: 2,
        g_type: "",
        g_dishName: "",
      },
      tableData: [],
      total: 0,
      pageIndex: 1,
      pageSize: 5,
    };
  },
  components: {
    "nav-bar": NavBar,
  },
  methods: {
    query() {
      console.log("");
    },
    pagedata() {
      let data = Object.assign({ pageIndex: this.pageIndex, pageSize: this.pageSize, shopid: localStorage.getItem("shopid") }, this.form);
      goods(data)
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
      this.pageIndex = pageIndex;
      this.pagedata(pageIndex, this.pageSize);
    },
    next(pageIndex) {
      this.pageIndex = pageIndex;
      this.pagedata(pageIndex, this.pageSize);
    },
    formatterCreateTime(row) {
      console.log(row);
      var date = new Date(row.g_createdTime);
      console.log(date);
      console.log(date.getFullYear());
      return date.toLocaleString();
    },
    formatterPublishTime(row) {
      console.log(row);
      var date = new Date(row.g_publishTime);
      console.log(date);
      return date.toLocaleString();
    },
    formatterStatus(row) {
      return row.g_status == 1 ? "已上架" : "已下架";
    },
    formatterType(row) {
      console.log(row);
      let label = "";
      goodtype.find((item) => {
        if (item.shopid == localStorage.getItem("shopid")) {
          item.options.find((o) => {
            console.log("o", o);
            console.log(o.value == row.g_type);
            if (o.value == row.g_type) {
              label = o.label;
            }
          });
        }
      });
      console.log(label);
      return label;
    },
  },
  created() {
    this.goodtype = goodtype.find((item) => {
      if (item.shopid == localStorage.getItem("shopid")) {
        return item;
      }
    });
    // this.goodtype = goodtype[localStorage.getItem("shopid")];
    console.log(this.goodtype);
    this.pagedata();
  },
};
</script>

<style lang="scss" scoped>
.goods {
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
