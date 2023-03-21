import request from "@/utils/request";

let base = '/localhost/allPHPcode/OrderPlatform/system/api/business';

// 登录
export const cart = data => {
    data = data || {};
    return request({
        url: `${base}/cart/cart.php`,
        method: "post",
        data
    })
};

export const good = data => {
    data = data || {};
    return request({
        url: `/localhost/allPHPcode/OrderPlatform/system/api/good.php`,
        method: "post",
        data
    })
};