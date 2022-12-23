<template>
  <div class="navbar">
    <el-menu
      default-active="2"
      :background-color="menu.bgColor"
      :text-color="menu.textColor"
      :active-text-color="menu.activeTextColor"
    >
      <el-menu-item v-for="(item,index) in menuItems" :key="index" :disabled="item.disable" @click="routeee(item.route)">
        <i :class="item.icon"></i>
        <span slot="title">{{ item.title }}</span>
      </el-menu-item>
    </el-menu>
  </div>
</template>

<script>
export default {
  data() {
    return {
        menu:{
            bgColor:"#2B3246",
            textColor:"#fff",
            activeTextColor:"pink",
        },
        menuItems:[
            {
                index:2,
                disable:false,
                icon:"el-icon-document",
                title:"首页",
                route:{path:"/login"}
            },
            {
                index:2,
                disable:false,
                icon:"el-icon-document",
                title:"Banner"
            },
            {
                index:2,
                disable:false,
                icon:"el-icon-document",
                title:"导航三"
            },
            {
                index:2,
                disable:false,
                icon:"el-icon-document",
                title:"导航三"
            },  {
                index:2,
                disable:false,
                icon:"el-icon-document",
                title:"导航三"
            },
            {
                index:2,
                disable:false,
                icon:"el-icon-document",
                title:"导航三"
            },
            {
                index:2,
                disable:false,
                icon:"el-icon-document",
                title:"导航三"
            },
            {
                index:2,
                disable:false,
                icon:"el-icon-document",
                title:"导航三"
            },  {
                index:2,
                disable:false,
                icon:"el-icon-document",
                title:"导航三"
            },
            {
                index:2,
                disable:false,
                icon:"el-icon-document",
                title:"导航三"
            },
            {
                index:2,
                disable:false,
                icon:"el-icon-document",
                title:"导航三"
            },
            {
                index:2,
                disable:false,
                icon:"el-icon-document",
                title:"导航三"
            },
              {
                index:2,
                disable:false,
                icon:"el-icon-document",
                title:"导航三"
            },
            {
                index:2,
                disable:false,
                icon:"el-icon-document",
                title:"导航三"
            },
            {
                index:2,
                disable:false,
                icon:"el-icon-document",
                title:"导航三"
            },
            {
                index:2,
                disable:false,
                icon:"el-icon-document",
                title:"导航三"
            }
        ]
    };
  },
  methods: {
    routeee(route){
      this.$router.push({path:route})
    }
  },
  created() {},
};
</script>

<style lang="scss" scoped>
.navbar{
 width:200px;
 height:100vh;
 background-color: gray;
//  overflow-y:scroll;
 overflow-x: hidden;
  /*滚动条整体样式*/
  &::-webkit-scrollbar {
    width: 10px; /*宽高分别对应横竖滚动条的尺寸*/
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