<template>
  <div class="banner-img">
    <el-form :label-position="labelPosition" :model="form">
      <el-form-item label="图片">
        <el-upload action="/localhost/allphpcode/OrderPlatform/system/api/upload.php" :on-success="success" :data="{ type: 1 }">
          <el-button type="primary" size="mini">上传 </el-button>
        </el-upload>
      </el-form-item>
      <div style="padding-left: 40px" v-if="form.imgurl">
        <img :src="form.url" alt="" style="witdh: 10vw; height: 10vh" />
      </div>
      <el-form-item label="高度">
        <el-input v-model="form.height"></el-input>
      </el-form-item>
      <el-form-item label="宽度">
        <el-input v-model="form.width"></el-input>
      </el-form-item>
      <el-form-item label="链接">
        <el-input v-model="form.locationurl" placeholder="url"></el-input>
      </el-form-item>

      <el-form-item>
        <el-button type="primary" size="mini" @click="addimgfun">确认 </el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
import { addimg } from "@/api/banner";
export default {
  data() {
    return {
      labelPosition: "right",
      form: {
        imgurl: "",
        url: "",
        height: 0,
        width: 0,
        locationurl: "",
      },
    };
  },
  methods: {
    success(response, file, fileList) {
      console.log(response);
      console.log(file);
      console.log(fileList);
      if (response.code == 3) {
        this.form.url = response.data.url;
        this.form.imgurl = response.data.name;
        this.$message({
          message: "上传成功！",
          type: "success",
        });
      } else {
        this.$message.error("上传失败！");
      }
    },
    addimgfun() {
      addimg(this.form)
        .then((res) => {
          console.log(res);
          if (res.code == 8) {
            this.$message({
              message: "添加成功",
            });
            this.$emit("changeVisible");
          }
        })
        .catch((error) => {
          console.log(error);
        });
    },
  },
};
</script>

<style lang="scss" scoped>
.banner-img {
  margin-left: 30px;
}
</style>
