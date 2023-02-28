/**
 * @description: 特色饮品
 * @param: g_Type-->3
 */
let teseyinpin ={
    "msg": "成功",
    "value": {
        "pageNum": 1,
        "pageSize": 100,
        "total": 3,
        "pages": 1,
        "list": [
            {
                "id": 40,
                "siteId": null,
                "country": null,
                "language": null,
                "parentMenuCode": null,
                "menuCode": null,
                "status": null,
                "flowStatus": null,
                "dishName": "海底捞大麦拉格啤酒",
                "menuName": null,
                "dishTag": "33",
                "dishDesc": "荣获2021年CBC中国国际啤酒挑战赛天禄奖一星。甄选进口大麦芽及啤酒花，烘焙麦芽带来琥珀色的朦胧酒体，低温发酵使味道更加纯净，凸显层次丰富的麦香，清冽爽口。",
                "imgUrl": "https://hdl-globalportal-oss-bucket.oss-cn-beijing.aliyuncs.com/website/image/6825b47a46624fa487f6e86fa27bebb4-396-543.jpg",
                "lastUpdatedTime": null,
                "orderNum": 1,
                "createdBy": null,
                "coverArea": null,
                "createdTime": null,
                "lastUpdatedBy": null,
                "childMenuCode": null,
                "optType": null,
                "publishTime": 1641291580706
            },
            {
                "id": 3618,
                "siteId": null,
                "country": null,
                "language": null,
                "parentMenuCode": null,
                "menuCode": null,
                "status": null,
                "flowStatus": null,
                "dishName": "海底捞德式小麦啤酒",
                "menuName": null,
                "dishTag": "",
                "dishDesc": "荣获2021年CCBA中国精酿啤酒大奖银奖。馥郁的果香结合酵母发酵带来的香气。洁白细腻的泡泡啤酒帽，酒体朦胧，口感柔滑饱满，入口清爽。",
                "imgUrl": "https://hdl-globalportal-oss-bucket.oss-cn-beijing.aliyuncs.com/website/image/7a40ca7d8f89412ba2f9e133107883cd-396-543.jpg",
                "lastUpdatedTime": null,
                "orderNum": 2,
                "createdBy": null,
                "coverArea": "",
                "createdTime": 1602835617653,
                "lastUpdatedBy": null,
                "childMenuCode": null,
                "optType": null,
                "publishTime": 1641291584146
            },
            {
                "id": 3762,
                "siteId": null,
                "country": null,
                "language": null,
                "parentMenuCode": null,
                "menuCode": null,
                "status": null,
                "flowStatus": null,
                "dishName": "海底捞淡爽拉格拉格啤酒",
                "menuName": null,
                "dishTag": "",
                "dishDesc": "荣获2020年CCBA中国精酿啤酒大奖拉格&混合啤酒经典组铜奖。\n本款酒体金黄的拉格啤酒，甄选大麦芽和啤酒花，呈现简单纯净的麦芽芬芳，伴随微微的酒花香气，酒精度低，口感清爽淡雅，冷饮更佳。",
                "imgUrl": "https://hdl-globalportal-oss-bucket.oss-cn-beijing.aliyuncs.com/website/image/b8bc628a5b6445a0b4e2232442bcac95-396-543.jpg",
                "lastUpdatedTime": null,
                "orderNum": 6,
                "createdBy": null,
                "coverArea": "",
                "createdTime": 1606293103146,
                "lastUpdatedBy": null,
                "childMenuCode": null,
                "optType": null,
                "publishTime": 1638416213383
            }
        ]
    },
    "rc": 100000,
    "success": true
}

let sql = "insert into goods (g_id, g_dishName, g_dishDesc, g_imgUrl, g_createdTime, g_publishTime, g_Type,g_shopid) values ";
// sql = sql + "(" + teseyinpin.value.list[0].id +",'"+teseyinpin.value.list[0].dishName+"','"+teseyinpin.value.list[0].dishDesc+"','"+teseyinpin.value.list[0].imgUrl+"',"+teseyinpin.value.list[0].createdTime+","+teseyinpin.value.list[0].publishTime+","+"1"+","+"1"+"),";
let i=0
for(;i<teseyinpin.value.list.length;i++){
    let j=18+i;
    sql = sql + "(" + j +",'"+teseyinpin.value.list[i].dishName+"','"+teseyinpin.value.list[i].dishDesc+"','"+teseyinpin.value.list[i].imgUrl+"',"+teseyinpin.value.list[i].createdTime+","+teseyinpin.value.list[i].publishTime+","+"3"+","+"1"+"),";
}
console.log(sql);