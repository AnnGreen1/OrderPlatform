<template>
  <div class="banner">
    <div class="banner-form">
      <el-form>
        <el-select v-model="groupstatus" placeholder="请选择" size="mini" clearable>
          <el-option key="1" label="使用中" value="1"> </el-option>
          <el-option key="0" label="未使用" value="0"> </el-option>
          <el-option key="2" label="全部" value="2"> </el-option>
        </el-select>
        <el-button type="primary" size="mini" @click="query">查询 </el-button>
      </el-form>
    </div>
    <div class="banner-table">
      <el-table :data="tableData" border style="width: 100%">
        <el-table-column prop="group_id" label="id" width="180"> </el-table-column>
        <el-table-column prop="group_name" label="banner名" width="180"> </el-table-column>
        <el-table-column prop="group_status" label="状态" :formatter="formatterGroupStatus"></el-table-column>
        <el-table-column fixed="right" label="操作" width="100">
          <template slot-scope="scope">
            <el-button @click="bannerDetialFun(scope.row)" type="text" size="small">查看</el-button>
            <el-button @click="userbannerFun(scope.row)" type="text" size="small" v-if="scope.row.group_status == 0">使用</el-button>
            <!-- <el-button type="text" size="small" v-else>禁用</el-button> -->
          </template>
        </el-table-column>
      </el-table>
    </div>
    <el-dialog :visible.sync="dialogVisible"  >
      <cimgs :group_id="bannerDetialing" v-if="dialogVisible"></cimgs>
    </el-dialog>
  </div>
</template>

<script>
import { banner, usebanner } from "@/api/banner";
import imgs from "@/views/banner/components/imgs.vue";
export default {
  data() {
    return {
      groupstatus: "2",
      tableData: [
        // {
        //   id: 1,
        //   groupname: "banner组测试",
        //   groupstatus: "使用中",
        // },
        // {
        //   id: 1,
        //   groupname: "banner组测试",
        //   groupstatus: "使用中",
        // },
        // {
        //   id: 1,
        //   groupname: "banner组测试",
        //   groupstatus: "使用中",
        // },
        // {
        //   id: 1,
        //   groupname: "banner组测试",
        //   groupstatus: "使用中",
        // },
        // {
        //   id: 1,
        //   groupname: "banner组测试",
        //   groupstatus: "使用中",
        // },
      ],
      dialogVisible: false,
      bannerDetialing:{}
    };
  },
  components: {
    cimgs: imgs,
  },
  methods: {
    formatterGroupStatus(groupstatus) {
      console.log(groupstatus);
      return groupstatus.group_status == 1 ? "使用中" : "未使用";
    },
    query() {
      let data = {
        groupstatus: this.groupstatus,
        pageIndex: 0,
        pageSize: 0,
        shopid: localStorage.getItem("shopid"),
      };
      banner(data)
        .then((res) => {
          console.log(res);
          if (res.code == 9) {
            this.tableData = res.data.banner;
          }
        })
        .catch((error) => {
          console.log(error);
        });
    },
    bannerDetialFun(row) {
      console.log(row);
      this.bannerDetialing = row.group_id
;
      // this.$set(this.bannerDetialingid, row)
      console.log(this.bannerDetialing);
      this.dialogVisible = true;
    },
    userbannerFun(row){
      usebanner({groupid:row.group_id,shopid:localStorage.getItem('shopid')}).then((res) => {
          console.log(res);
          if (res.code == 1) {
            this.query()
          }
        })
        .catch((error) => {
          console.log(error);
        });
    }
  },
  created() {
    this.query();
  },
};
</script>

<style lang="scss" scoped>
.banner {
  &-form {
    margin-bottom: 10px;
  }
  &-table {
    // position: absolute;
    // left: 210px;
    // top: 10px;
    // height: 98vh;
    // width: calc(100vw - 210px);
    // overflow: auto;
  }
}
</style>
