import request from "@/utils/request";

let base = '/localhost/allPHPcode/OrderPlatform/system/api/customer';

// 初始化tabbarConfig
export const goods = data => {
    data = data || {};
    return request({
        url: `${base}/order/goods.php?shopid=${data.shopid}`,
        method: "post",
        data
    })
};

export const neworder = data => {
    data = data || {};
    return request({
        url: `${base}/order/neworder.php`,
        method: "post",
        data
    })
};
