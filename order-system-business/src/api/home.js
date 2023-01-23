import request from "@/utils/request";

let base = '/localhost/allPHPcode/OrderPlatform/system/api/business';

// 随机土味情话
export const shops = data => {
    data = data || {};
    return request({
        url: `${base}/home/shops.php`,
        method: "post",
        data
    })
};