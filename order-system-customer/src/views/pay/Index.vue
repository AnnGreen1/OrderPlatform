<template>
    <div>
        <h1>pay</h1>
    </div>
</template>

<script>
import { initBanner } from "@/api/home";
export default {
  data() {
    return {
     
    };
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