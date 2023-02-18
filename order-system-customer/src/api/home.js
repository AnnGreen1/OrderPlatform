import request from "@/utils/request";

let base = '/localhost/allPHPcode/OrderPlatform/system/api/customer';

// 初始化tabbarConfig
export const initBanner = data => {
    data = data || {};
    return request({
        url: `${base}/home/initBanner.php?shopid=${data.shopid}`,
        method: "post",
        data
    })
};

