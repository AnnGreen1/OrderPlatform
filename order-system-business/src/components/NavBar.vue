<template>
  <div class="navbar">
    <el-menu default-active="2" :background-color="menu.bgColor" :text-color="menu.textColor"
      :active-text-color="menu.activeTextColor">
      <el-menu-item v-for="(item, index) in menuItems" :key="index"
        :style="activeIndex == item.index ? activeStyle : ''" :disabled="item.disable" @click="router(item.route)">
        <i :class="item.icon"></i>
        <span slot="title">{{ item.title }}</span>
      </el-menu-item>
    </el-menu>

  </div>
</template>

<script>

export default {
  props: ['activeIndex'],
  data() {
    return {
      menu: {
        bgColor: "#2B3246",
        textColor: "#fff",
        activeTextColor: "blue",
      },
      activeStyle: {
        // color: localStorage.getItem('shopcolor')
      },
      menuItems: [
        {
          index: 1,
          disable: false,
          icon: "el-icon-document",
          title: "我的店铺",
          route: { path: "/home" }
        },
        {
          index: 2,
          disable: false,
          icon: "el-icon-document",
          title: "首页Banner",
          route: { path: "/banner" }
        },
        {
          index: 3,
          disable: false,
          icon: "el-icon-document",
          title: "用户",
          route: { path: "/user" }
        },
        {
          index: 4,
          disable: false,
          icon: "el-icon-document",
          title: "商品管理",
          route: { path: "/goods" }
        },
        {
          index: 5,
          disable: false,
          icon: "el-icon-document",
          title: "订单管理",
          route: { path: "/cart" }
        },
        // {
        //   index: 6,
        //   disable: false,
        //   icon: "el-icon-document",
        //   title: "原料管理",
        //   route: { path: "/banner" }
        // },
        // {
        //   index: 7,
        //   disable: false,
        //   icon: "el-icon-document",
        //   title: "tabbar",
        //   route: { path: "/banner" }
        // },
        {
          index: 8,
          disable: false,
          icon: "el-icon-document",
          title: "数据分析",
          route: { path: "/data" }
        },
        {
          index: 9,
          disable: false,
          icon: "el-icon-document",
          title: "退出",
          route: { path: "/login" }
        },
      ]
    };
  },
  // computed: {
	// 	color(){
	// 		return this.activeStyle.color
	// 	}	
	// },
  // watch: {
  //   // 如果 `question` 发生改变，这个函数就会运行
  //   color (newQuestion, oldQuestion) {
  //     console.log(newQuestion,oldQuestion);
  //    console.log('change');
  //   }
  // },
  methods: {
    router(route) {
      console.log(route);
      if (route.path == '/login') {
        localStorage.setItem('s_username', '');
        localStorage.setItem('a_username', '');
      }
      this.$router.push(route)
    }
  },
  // created() { 
  //   console.log(this.activeStyle);
  // },
};
</script>

<style lang="scss" scoped>
.navbar {
  width: 200px;
  height: 100vh;
  background-color: gray;
  //  overflow-y:scroll;
  overflow-x: hidden;

  /*滚动条整体样式*/
  &::-webkit-scrollbar {
    width: 10px;
    /*宽高分别对应横竖滚动条的尺寸*/
    height: 1px;
    cursor: pointer;
  }

  /*滚动条里面小方块*/
  &::-webkit-scrollbar-thumb {
    border-radius: 10px;
    background-color: #ccc;
    // background-color: #0b7fe8;
    // background-image: -webkit-linear-gradient(
    //   45deg,
    //   rgba(255, 255, 255, 0.2) 25%,
    //   transparent 25%,
    //   transparent 50%,
    //   rgba(255, 255, 255, 0.2) 50%,
    //   rgba(255, 255, 255, 0.2) 75%,
    //   transparent 75%,
    //   transparent
    // );
  }

  /*滚动条里面轨道*/
  &::-webkit-scrollbar-track {
    box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.2);
    background: #eee;
    border-radius: 10px;
  }
}
</style>