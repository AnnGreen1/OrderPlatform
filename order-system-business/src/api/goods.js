import request from "@/utils/request";

let base = '/localhost/allPHPcode/OrderPlatform/system/api/business';
// 随机土味情话
export const goods = data => {
    data = data || {};
    return request({
        url: `${base}/goods/goods.php`,
        method: "post",
        data
    })
};