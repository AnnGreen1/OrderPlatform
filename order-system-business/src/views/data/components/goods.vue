<template>
  <div class="echart" id="mychart" :style="myChartStyle"></div>
</template>

<script>
import * as echarts from "echarts";
import { goods } from '@/api/data'
export default {
  data() {
    return {
      myChart: {},
      pieData: [
        
      ],
      pieName: [],
      myChartStyle: { float: "left", width: "100%", height: "400px" }, //图表样式
    };
  },
//   mounted() {
//     this.initDate(); //数据初始化
//     this.initEcharts();
//   },
  methods: {
    initDate() {
      for (let i = 0; i < this.pieData.length; i++) {
        // this.xData[i] = i;
        // this.yData =this.xData[i]*this.xData[i];
        this.pieName[i] = this.pieData[i].name;
      }
    },
    initEcharts() {
      // 饼图
      const option = {
        legend: {
          // 图例
          data: this.pieName,
          right: "10%",
          top: "30%",
          orient: "vertical",
        },
        title: {
          // 设置饼图标题，位置设为顶部居中
          text: "商品销量分布",
          top: "0%",
          left: "center",
        },
        series: [
          {
            type: "pie",
            label: {
              show: true,
              formatter: "{b} : {c} ({d}%)", // b代表名称，c代表对应值，d代表百分比
            },
            radius: "30%", //饼图半径
            data: this.pieData,
          },
        ],
      };
      console.log(this.seriesData);
      // const optionFree = {
      //   xAxis: {},
      //   yAxis: {},
      //   series: [
      //     {
      //       data: this.seriesData,
      //       type: "line",
      //       smooth: true
      //     }
      //   ]
      // };
      this.myChart = echarts.init(document.getElementById("mychart"));
      this.myChart.setOption(option);
      //随着屏幕大小调节图表
      window.addEventListener("resize", () => {
        this.myChart.resize();
      });
    },
  },
   created() {
    // let randqinghua_data = { format: "json" };
    goods({'shopid':localStorage.getItem('shopid')})
      .then((res) => {
        console.log(res);
        if(res.code==20){
            // let i=0;
            // let data = [{}]
            res.data.goods.forEach((item)=>{
                // item.value=parseInt(item.count);
                // item.name=item.g_dishName;
                this.pieData.push({name:item.g_dishName,value:parseInt(item.count)});
                // this.pieData[i].value = parseInt(item.count);
            })
            console.log(this.pieData);
            this.initDate(); //数据初始化
    this.initEcharts();
            // this.pieData = res.data.goods;
        }
      })
      .catch((error) => {
        console.log(error);
      });
  },
};
</script>
