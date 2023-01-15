<template>
    <div>
        <h1>mine</h1>
        <tab-bar></tab-bar>
    </div>
</template>

<script>
import TabBar from "@/components/TabBar.vue";
import { initBanner } from "@/api/home";
export default {
  data() {
    return {
     
    };
  },
  components: {
    "tab-bar": TabBar,
  },
  methods: {},
  created() {
    initBanner()
      .then((res) => {
        console.log(res);
        if (res && res.code == 1001 && res.data) {
          this.banner = res.data;
        }
      })
      .catch((error) => {
        console.log(error);
      });
  },
};
</script>