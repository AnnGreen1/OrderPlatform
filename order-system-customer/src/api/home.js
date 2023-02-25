import request from "@/utils/request";

let base = '/localhost/allPHPcode/OrderPlatform/system/api/customer';

// 初始化tabbarConfig
export const initBanner = data => {
    data = data || {};
    return request({
        url: `${base}/home/banner.php?shopid=${data.shopid}`,
        method: "post",
        data
    })
};

export const initshop = data => {
    data = data || {};
    return request({
        url: `${base}/home/shop.php?shopid=${data.shopid}`,
        method: "post",
        data
    })
};

