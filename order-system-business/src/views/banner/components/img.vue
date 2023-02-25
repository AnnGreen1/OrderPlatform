<template>
  <div class="img">
    <el-form :label-position="labelPosition" :model="form">
      <el-form-item label="图片">
        <el-upload action="/localhost/allphpcode/OrderPlatform/system/api/upload.php" :on-success="success" :data="{ type: 1 }">
          <el-button type="primary" size="mini">上传 </el-button>
        </el-upload>
      </el-form-item>
      <div style="padding-left: 40px" v-if="form.imgurl">
        <img :src="form.imgurl" alt="" style="witdh: 10vw; height: 10vh" />
      </div>
      <el-form-item label="高度">
        <el-input v-model="form.height"></el-input>
      </el-form-item>
      <el-form-item label="宽度">
        <el-input v-model="form.width" placeholder="审批人"></el-input>
      </el-form-item>
      <el-form-item label="位置">
        <el-radio-group v-model="form.location">
          <el-radio :label="1">备选项</el-radio>
          <el-radio :label="0">备选项</el-radio>
        </el-radio-group>
      </el-form-item>

      <el-form-item>
        <el-button type="primary" size="mini">取消</el-button>
        <el-button type="primary" size="mini">确认 </el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
import { randqinghua } from "@/api/api";
export default {
  data() {
    return {
      labelPosition: "right",
      form: {
        imgurl: "",
        height: 0,
        width: 0,
        location: 0,
      },
    };
  },
  methods: {
    success(response, file, fileList) {
      console.log(response);
      console.log(file);
      console.log(fileList);
      if (response.code == 3) {
        this.form.imgurl = response.data.url;
        this.$message({
          message: "恭喜你，这是一条成功消息",
          type: "success",
        });
      } else {
        this.$message.error("错了哦，这是一条错误消息");
      }
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
.img {
  margin-left: 30px;
}
</style>
