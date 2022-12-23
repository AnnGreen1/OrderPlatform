<template>
  <van-tabbar v-model="active" active-color="#00682f" route>
    <van-tabbar-item
      v-for="(item, index) in tabConfig"
      :key="index"
      :to="item.tab_path"
    >
      <!-- 标签页文本内容 -->
      <span>{{ item.tab_title }}</span>
      <!-- 定义标签页图标 -->
      <template #icon="props">
        <img :src="props.active ? item.tab_icon_active : item.tab_icon" />
      </template>
    </van-tabbar-item>
  </van-tabbar>
</template>

<script>
import { initTabbarConfig } from "@/api/tabbar";
export default {
  name: "TabBar",
  data() {
    return {
      active: 0,
      // 每个标签的配置
      tabConfig: [],
    };
  },
  created() {
    let shopdata = { shopid: 1 };
    initTabbarConfig(shopdata)
      .then((res) => {
        console.log(res);
        this.tabConfig = res.data;
        console.log(this.tabConfig);
      })
      .catch((error) => {
        console.log(error);
      });
  },
};
</script>

<style lang="scss" scoped></style>