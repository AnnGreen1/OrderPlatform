<template>
    <div class="shop">
        <!-- 1、用户数量
        2、店铺名
        3、店铺地址
        4、店铺余额
        5、店铺tabber
        6、店铺bannner -->

        <el-descriptions :title="shop.name" :column=3 class="shop-description">
            <el-descriptions-item label="用户名">{{ shop.username }}</el-descriptions-item>
            <el-descriptions-item label="用户数量">{{ shop.usernum }}</el-descriptions-item>
            <el-descriptions-item label="总营业额">{{ shop.balance }}</el-descriptions-item>
            <el-descriptions-item label="tabbar">{{ shop.tabTabbarName }}</el-descriptions-item>
            <el-descriptions-item label="banner">{{ shop.bannerGroupName }}</el-descriptions-item>
            <el-descriptions-item label="店铺地址">{{ shop.address }}</el-descriptions-item>
        </el-descriptions>
    </div>
</template>

<script>
import { randqinghua } from '@/api/api'
export default {
    props: ["shopid"],
    data() {
        return {
            shop:
            {
                name: "店铺名",
                username: "shop1",
                usernum: 0,
                address: "安徽省芜湖市弋江区澛港街道文津西路8号",
                balance: 0,
                tabTabbarName: "tabbar名字",
                bannerGroupName: "banner组名"
            }
        }
    },
    methods: {

    },
    created() {
        let randqinghua_data = { 'format': 'json' }
        randqinghua(randqinghua_data).then((res) => {
            console.log(res)
        }).catch((error) => {
            console.log(error);
        })
        console.log(this.shopid);
    }
}
</script>

<style lang="scss" scoped>
.shop {
    // border: solid;
    width: calc(100vw - 225px);
    height: 150px;
    margin: 20px 0;
    &-description {
        padding: 15px;
    }
}
</style>