<template>
  <div class="login">
    <center>
      <div class="login-form">
        <el-form ref="form" :model="form" label-width="80px" style="padding-top: 300px">
          <el-form-item>
            <h1 style="color: white">自主点单平台商家端</h1>
          </el-form-item>
          <el-form-item label="用户名">
            <el-input v-model="form.username"></el-input>
          </el-form-item>
          <el-form-item label="密码">
            <el-input type="password" v-model="form.password"></el-input>
          </el-form-item>
          <el-form-item label="角色">
            <el-radio-group v-model="form.type" style="text-align: left">
              <el-radio :label="1">店铺</el-radio>
              <el-radio :label="2">管理员</el-radio>
            </el-radio-group>
          </el-form-item>
          <el-form-item>
            <el-button type="primary" @click="onSubmit">登录</el-button>
          </el-form-item>
        </el-form>
      </div>
    </center>
  </div>
</template>

<script>
import { login } from "@/api/login";
export default {
  data() {
    return {
      form: {
        username: "",
        password: "",
        type: 2,
      },
    };
  },
  methods: {
    onSubmit() {
      login(this.form)
        .then((res) => {
          console.log(res);
          if (res.code == 1001) {
            localStorage.setItem("s_username", res.userinfo.s_username);
          } else {
            localStorage.setItem("a_username", res.userinfo.a_username);
          }
          this.$message({
            message: "欢迎进入商家端",
          });
          this.$router.push({ path: "/home", query: { code: res.code } });
        })
        .catch((error) => {
          console.log(error);
        });
    },
  },
};
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
    font-style: pink;

    ::v-deep .el-form-item__label {
      color: white;
    }

    ::v-deep .el-radio__label {
      color: white;
    }

    ::v-deep .el-button {
      width: 420px;
    }
  }
}
</style>
