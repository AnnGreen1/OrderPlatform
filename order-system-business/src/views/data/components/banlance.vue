<template>
<div>
    <button @click="fun">渲染</button>
    
  <div class="echart" id="mycharts" :style="myChartStyle"></div>
</div>
</template>

<script>
import * as echarts from "echarts";
import { balance } from "@/api/data";
export default {
  data() {
    return {
        data:[],
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
      //   let days = [];
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
    fun(){
        this.data.forEach((item) => {
          console.log(item);
          this.yData.push(item);
        });
        this.$nextTick(() => {
      this.initEcharts();
    });
    }
  },
  created() {
    this.getday2();
    let time = 0;
    let data = [];
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
      balance(randqinghua_data)
        .then((res) => {
          console.log(res.data.goods.price);
          data.push(parseInt(res.data.goods.price));
        })
        .catch((error) => {
          console.log(error);
        });
      time++;
    }
    // this.yData = data;
    console.log(this.yData);
    console.log(data);
    this.data =data;

    
  },
};
</script>
