<template>
  <div></div>
</template>

<script>
import { randqinghua, wenjianliu } from "@/api/api";
export default {
  data() {
    return {};
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

    wenjianliu()
      .then((res) => {
        console.log(res);
        const url = window.URL.createObjectURL(res);
        const link = document.createElement("a");
        link.style.display = "none";
        link.href = url;
        link.setAttribute("download", "fileName.xlsx");
        document.body.appendChild(link);
        link.click();
        document.body.removeChild(link);
      })
      .catch((error) => {
        console.log(error);
        const url = window.URL.createObjectURL(error);
        console.log(url);
        const link = document.createElement("a");
        link.style.display = "none";
        link.href = url;
        link.setAttribute("download", "fileName.xlsx");
        document.body.appendChild(link);
        link.click();
        document.body.removeChild(link);
      });
  },
};
</script>
