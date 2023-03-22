import request from "@/utils/request";

let base = '/localhost/allPHPcode/OrderPlatform/system/api/business';

// 登录
export const goods = data => {
    data = data || {};
    return request({
        url: `${base}/data/goods.php`,
        method: "post",
        data
    })
};

export const balance = data => {
    data = data || {};
    return request({
        url: `${base}/data/balance.php`,
        method: "post",
        data
    })
};
