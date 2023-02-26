<template>
  <div class="banner-imgs">
    <div class="banner-imgs-button">
      <el-button @click="dialogVisible = true">添加图片</el-button>
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
        <el-table-column fixed="right" label="操作" width="100">
          <template slot-scope="scope">
            <el-button @click="handleClick(scope.row)" type="text" size="small">查看</el-button>
            <el-button type="text" size="small">编辑</el-button>
          </template>
        </el-table-column>
      </el-table>
      <el-pagination background layout="total, prev, pager, next" :total="total" :page-size="pageSize" :current-page="pageIndex" @prev-click="prev" @next-click="next"> </el-pagination>
      <el-dialog title="提示" :visible.sync="dialogVisible" width="30%">
        <cimg @changeVisible="changeVsibleFun"></cimg>
      </el-dialog>
    </div>
  </div>
</template>

<script>
import { imgs } from "@/api/banner";
import img from "@/views/banner/components/img.vue";
export default {
  data() {
    return {
      tableData: [
        {
          date: "2016-05-02",
          name: "王小虎",
          address: "上海市普陀区金沙江路 1518 弄",
        },
        {
          date: "2016-05-04",
          name: "王小虎",
          address: "上海市普陀区金沙江路 1517 弄",
        },
        {
          date: "2016-05-01",
          name: "王小虎",
          address: "上海市普陀区金沙江路 1519 弄",
        },
        {
          date: "2016-05-03",
          name: "王小虎",
          address: "上海市普陀区金沙江路 1516 弄",
        },
      ],
      total: 0,
      pageIndex: 1,
      pageSize: 5,
      dialogVisible: false,
    };
  },
  components: {
    cimg: img,
  },
  methods: {
    pagedata(pageindex, pagesize) {
      imgs({ pageIndex: pageindex, pageSize: pagesize })
        .then((res) => {
          console.log(res);
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
      this.pageIndex=1;
    this.pagedata(this.pageIndex, this.pageSize);
    },
  },
  created() {
    this.pagedata(this.pageIndex, this.pageSize);
  },
};
</script>
