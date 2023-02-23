<template>
  <div>
    <el-form :inline=true>
      <el-form-item label="审批人">
        <el-input v-model="form.imgname" placeholder="审批人"></el-input>
      </el-form-item>
      <el-form-item label="高度">
        <el-input v-model="form.height" type="number" placeholder="审批人"></el-input>
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
    </el-form>
  </div>
</template>

<script>
import { randqinghua } from "@/api/api";
export default {
  data() {
    return {
      form: {
        imgname: "",
        height: 0,
        width: 0,
        location: 0,
      },
    };
  },
  methods: {},
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
