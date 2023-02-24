<template>
  <div class="user">
    <nav-bar class="banner-navbar" activeIndex="3"></nav-bar>
    <div class="user-container">
      <el-button type="primary" size="mini">
        <el-upload action="localhost/allphpcode/upload/upload.php" :on-success="success"> 上传 </el-upload>
      </el-button>
      <img src="" alt="" srcset="" />
    </div>
  </div>
</template>

<script>
import NavBar from "@/components/NavBar.vue";
import { randqinghua } from "@/api/api";
export default {
  data() {
    return {};
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
