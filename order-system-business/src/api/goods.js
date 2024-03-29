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

export const addgood = data => {
    data = data || {};
    return request({
        url: `${base}/goods/addgood.php?dishName=${data.dishName}&dishDesc=${data.dishDesc}&imgurl=${data.imgurl}&type=${data.type}&price=${data.price}&status=${data.status}&shopid=${data.shopid}`,
        method: "post",
        data
    })
};