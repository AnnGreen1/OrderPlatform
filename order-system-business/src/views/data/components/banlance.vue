<template>
  <div>
    <div class="echart" id="mycharts" :style="myChartStyle"></div>
  </div>
</template>

<script>
import * as echarts from "echarts";
import { balance } from "@/api/data";
export default {
  data() {
    return {
      xData: [], //横坐标
      yData: [], //数据
      myChartStyle: { float: "left", width: "100%", height: "400px" }, //图表样式
    };
  },
  methods: {
    initEcharts() {
      // 基本柱状图
      let option = {
        xAxis: {
          data: this.xData,
        },
        yAxis: {},
        series: [
          {
            type: "bar", //形状为柱状图
            data: this.yData,
          },
        ],
        title: {
          text: "最近一周销售额",
          op: "0%",
          left: "center",
        },
      };
      const myChart = echarts.init(document.getElementById("mycharts"));
      myChart.setOption(option);
      //随着屏幕大小调节图表
      window.addEventListener("resize", () => {
        myChart.resize();
      });
    },
    getday2() {
      for (let i = 0; i < 7; i++) {
        //今天加上前6天
        const date = new Date();
        const y = date.getFullYear();
        const m = date.getMonth();
        const d = date.getDate();
        const today = new Date(y, m, d - i);
        this.xData.unshift(today.toLocaleDateString());
      }
      console.log("最近七天日期：", this.xData);
    },
  },
  async created() {
    this.getday2();
    let time = 0;
    while (time < 7) {
      const date = new Date();
      const y = date.getFullYear();
      const m = date.getMonth();
      const d = date.getDate();
      const today = new Date(y, m, d, 23, 59, 59);
      let randqinghua_data = {
        shopid: localStorage.getItem("shopid"),
        begin: (today.getTime() - time * 24 * 60 * 60 * 1000 + 1 - ((today.getTime() - (time + 1) * 24 * 60 * 60 * 1000 + 1) % 1000)) / 1000 - 24 * 60 * 60 + 1,
        end: (today.getTime() - time * 24 * 60 * 60 * 1000 + 1 - ((today.getTime() - (time + 1) * 24 * 60 * 60 * 1000 + 1) % 1000)) / 1000,
      };
      await balance(randqinghua_data)
        .then((res) => {
          console.log(res.data.goods.price);
          this.yData.unshift(parseInt(res.data.goods.price)/100);
        })
        .catch((error) => {
          console.log(error);
        });
      time++;
    }
    console.log(this.yData);
    this.$nextTick(() => {
      this.initEcharts();
    });
  },
};
</script>
