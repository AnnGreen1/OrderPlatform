<template>
  <div class="banner-imgs">
    <div class="banner-imgs-button">
      <el-button @click="dialogVisible = true" v-if="!group_id">添加图片</el-button>
      <el-badge :value="bannering.length == 0 ? '' : bannering.length" class="item" v-if="!group_id">
        <el-button :disabled="bannering.length == 0" @click="addbannergroupFun">新建banner组</el-button>
      </el-badge>
    </div>
    <div class="banner-imgs-table">
      <el-table :data="tableData" border style="width: 100%">
        <el-table-column prop="banner_id" label="编号" width="180"> </el-table-column>
        <el-table-column prop="banner_url" label="图片">
          <template slot-scope="scope">
            <img :src="scope.row.banner_url" alt="" srcset="" style="witdh: 10vw; height: 10vh" />
          </template>
        </el-table-column>
        <el-table-column prop="banner_height" label="高度"> </el-table-column>
        <el-table-column prop="banner_width" label="宽度"> </el-table-column>
        <el-table-column prop="banner_location" label="位置"> </el-table-column>
        <el-table-column fixed="right" label="操作" width="150" v-if="!group_id">
          <template slot-scope="scope">
            <el-button @click="handleClick(scope.row)" type="text" size="small">删除</el-button>
            <el-button type="text" size="small" v-if="!group_id" @click="addbanner(scope.row)">添加banner</el-button>
          </template>
        </el-table-column>
      </el-table>
      <el-pagination background layout="total, prev, pager, next" :total="total" :page-size="pageSize" :current-page="pageIndex" @prev-click="prev" @next-click="next"> </el-pagination>
      <el-dialog title="添加图片" :visible.sync="dialogVisible" width="30%">
        <cimg @changeVisible="changeVsibleFun"></cimg>
      </el-dialog>
    </div>
  </div>
</template>

<script>
import { imgs, addbannergroup } from "@/api/banner";
import img from "@/views/banner/components/img.vue";
export default {
  props: ["group_id"],
  data() {
    return {
      tableData: [
        
      ],
      total: 0,
      pageIndex: 1,
      pageSize: 5,
      dialogVisible: false,
      group_id_temp: "",
      bannering: [],
    };
  },
  components: {
    cimg: img,
  },
  methods: {
    pagedata(pageindex, pagesize) {
      imgs({ pageIndex: pageindex, pageSize: pagesize, groupid: this.group_id_temp })
        .then((res) => {
          if (res.code == 1) {
            this.total = res.data.total;
            this.tableData = res.data.banner;
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
    changeVsibleFun() {
      this.dialogVisible = !this.dialogVisible;
      this.pageIndex = 1;
      this.pagedata(this.pageIndex, this.pageSize);
    },
    addbanner(row) {
      if (!this.bannering.includes(row.banner_id)) this.bannering.push(row.banner_id);
    },
    addbannergroupFun() {
      this.$prompt("请输入组名", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
      })
        .then(({ value }) => {
          let data = {
            bannergroupname: value,
            bannerids: this.bannering,
            shopid: localStorage.getItem("shopid"),
          };
          addbannergroup(data)
            .then((res) => {
              console.log(res);
              if (res.code == 10) {
                this.$message({
                  type: "success",
                  message: res.msg,
                });
              }
              this.bannering = [];
            })
            .catch((error) => {
              console.log(error);
            });
        })
        .catch(() => {
          this.$message({
            type: "info",
            message: "取消输入",
          });
        });
    },
  },
  created() {
    this.tableData = [];
    console.log(this.group_id);
    this.group_id_temp = this.group_id;
    if (!this.group_id) this.group_id_temp = "";
    this.pagedata(this.pageIndex, this.pageSize);
  },
};
</script>

<style lang="scss" scoped>
.banner-imgs {
  &-button {
    padding-top: 20px;
    padding-right: 20px;
    .item {
      float: right;
    }
  }
}
</style>
