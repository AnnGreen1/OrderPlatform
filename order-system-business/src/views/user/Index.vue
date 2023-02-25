<template>
  <div class="user">
    <nav-bar class="banner-navbar" activeIndex="3"></nav-bar>
    <div class="user-container">
      <div class="user-container-form">
        <el-form :inline="true" :model="formInline" class="demo-form-inline">
          <el-form-item label="审批人">
            <el-input v-model="formInline.user" placeholder="审批人"></el-input>
          </el-form-item>
          <el-form-item label="活动区域">
            <el-select v-model="formInline.region" placeholder="活动区域">
              <el-option label="区域一" value="shanghai"></el-option>
              <el-option label="区域二" value="beijing"></el-option>
            </el-select>
          </el-form-item>
          <el-form-item>
            <el-button type="primary" @click="onSubmit">查询</el-button>
          </el-form-item>
        </el-form>
      </div>
      <div class="user-container-table"></div>
    </div>
  </div>
</template>

<script>
import NavBar from "@/components/NavBar.vue";
import { randqinghua } from "@/api/api";
export default {
  data() {
    return {
      formInline: {
        user: "",
        region: "",
      },
    };
  },
  components: {
    "nav-bar": NavBar,
  },
  methods: {
    success(response, file, fileList) {
      console.log(response);
      console.log(file);
      console.log(fileList);
    },
    onSubmit() {
      console.log("submit!");
    },
  },
  created() {
    let randqinghua_data = { format: "json" };
    randqinghua(randqinghua_data)
      .then((res) => {
        console.log(res);
      })
      .catch((error) => {
        console.log(error);
      });
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
