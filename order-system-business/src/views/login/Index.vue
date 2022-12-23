<template>
  <div class="login">
    <!-- #707070 -->
    <vue-particles
      class="login-background"
      color="#97D0F2"
      :particleOpacity="0.7"
      :particlesNumber="50"
      shapeType="circle"
      :particleSize="4"
      linesColor="#97D0F2"
      :linesWidth="1"
      :lineLinked="true"
      :lineOpacity="0.4"
      :linesDistance="150"
      :moveSpeed="3"
      :hoverEffect="true"
      hoverMode="grab"
      :clickEffect="true"
      clickMode="push"
    >
    </vue-particles>
    <div class="login-other">
      <el-form
        :rules="rules"
        ref="loginForm"
        :model="loginForm"
        class="loginContainer"
      >
        <H3 class="loginTitle">自主点单系统后台</H3>
        <el-form-item prop="username">
          <el-input
            prefix-icon="el-icon-user-solid"
            size="normal"
            type="text"
            v-model="loginForm.username"
            auto-complete="off"
            placeholder="请输入用户名"
          ></el-input>
        </el-form-item>
        <el-form-item prop="password">
          <el-input
            prefix-icon="el-icon-lock"
            size="normal"
            type="password"
            v-model="loginForm.password"
            auto-complete="off"
            placeholder="请输入密码"
          ></el-input>
        </el-form-item>

        <el-radio v-model="loginForm.type" label="1">我是店铺</el-radio>
        <el-radio v-model="loginForm.type" label="2">我是店主</el-radio>
        <el-button
          size="normal"
          type="primary"
          style="width: 100%"
          @click="submitLogin"
          >登录</el-button
        >
      </el-form>
    </div>
  </div>
</template>

<script>
export default {
  name: "Login",
  data() {
    return {
      loginForm: {
        username: "admin",
        password: "123",
        type: "1",
      },
      
      checked: true,
      rules: {
        username: [
          { required: true, message: "请输入用户名", trigger: "blur" },
        ],
        password: [{ required: true, message: "请输入密码", trigger: "blur" }],
      },
    };
  },
  methods: {
    submitLogin(){
      
    }
  },
};
</script>

<style lang="scss" scoped>
.login {
  &-background {
    background: linear-gradient(-180deg, #dcf2e6 0%, #ffffff 100%);
    width: 100%;
    height: 100%; /**宽高100%是为了图片铺满屏幕 */
    z-index: -1;
    position: absolute;
  }
  &-other {
    z-index: 1;
    margin: 180px 0 0 calc(calc(100vw - 410px) / 2);
    position: absolute;
    .loginContainer {
      border-radius: 15px;
      background-clip: padding-box;
      width: 350px;
      padding: 15px 35px 15px 35px;
      background: #fefefe;
      border: 1px solid #eaeaea;
      box-shadow: 0 0 25px #cac6c6;
      .loginTitle {
        margin: 15px auto 20px auto;
        text-align: center;
        color: #707070;
      }
      .el-button{
        margin-top:10px;
      }
    }
  }
}
</style>