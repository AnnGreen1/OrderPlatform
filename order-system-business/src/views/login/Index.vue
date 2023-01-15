<template>
  <div class="login">
    <center>
      <div class="login-form">
        <el-form ref="form" :model="form" label-width="80px" style="padding-top:300px;">
          <el-form-item><h1>自主点单平台商家端</h1></el-form-item>
          <el-form-item label="用户名">
            <el-input v-model="form.name"></el-input>
          </el-form-item>
          <el-form-item label="密码">
            <el-input type="password" v-model="form.name"></el-input>
          </el-form-item>
          <el-form-item label="角色">
            <el-radio-group v-model="form.resource" style="text-align:left;">
              <el-radio label="店铺"></el-radio>
              <el-radio label="管理员"></el-radio>
            </el-radio-group>
          </el-form-item>
          <el-form-item>
            <el-button type="primary" @click="onSubmit">立即创建</el-button>
            <el-button>取消</el-button>
          </el-form-item>
        </el-form>
      </div>
    </center>
  </div>
</template>

<script>
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
        desc: ''
      }
    }
  },
  methods: {
    onSubmit() {
      console.log('submit!');
    }
  }
}
</script>

<style lang="scss" scoped>
.login {
  background-image: url(@/assets/login/780.png);
  background-repeat: no-repeat;
  background-size: cover;
  width: 100%;
  height: 800px;

  &-form {
    width: 500px;
  }


}
</style>