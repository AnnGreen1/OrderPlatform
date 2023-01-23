<template>
  <div class="banner">
    <nav-bar class="banner-navbar" activeIndex=2></nav-bar>

    <div class="banner-container">

      <el-form :inline="true">
        <el-form-item label="店铺名称">
          <el-select v-model="form.region" placeholder="请选择活动区域">
            <el-option label="区域一" value="shanghai"></el-option>
            <el-option label="区域二" value="beijing"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="使用状态">
          <el-radio-group v-model="form.resource">
            <el-radio label="线上品牌商赞助"></el-radio>
            <el-radio label="线下场地免费"></el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" size="medium">查询</el-button>
          <el-button type="primary" size="medium">新增</el-button>
        </el-form-item>
      </el-form>

      <el-tabs v-model="activeName" @tab-click="handleClick">
        <el-tab-pane label="用户管理" name="first">用户管理</el-tab-pane>
        <el-tab-pane label="配置管理" name="second">配置管理</el-tab-pane>
      </el-tabs>
    </div>
  </div>
</template>

<script>
import NavBar from "@/components/NavBar.vue";
export default {
  data() {
    return {
      form: {
        name: '',
        region: '',
        date1: '',
        date2: '',
        delivery: false,
        type: [],
        resource: '',
        desc: '',
      },
      activeName: 'second'
    };
  },
  components: {
    "nav-bar": NavBar,
    // "state-bar": StateBar,
  },
  methods: {
    handleClick(tab, event) {
      console.log(tab, event);
    }
  },
  created() { },
};
</script>

<style lang="scss" scoped>
.banner {
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
    margin: 10px;
  }
}
</style>