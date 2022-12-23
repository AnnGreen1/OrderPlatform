import request from "@/utils/request";

let base = '/localhost/allPHPcode/system/api/customer';

// 初始化tabbarConfig
export const initTabbarConfig = data => {
    data = data || {};
    return request({
        url: `${base}/tabbar/initTabbarConfig.php`,
        method: "post",
        data
    })
};

// 初始化tabbarIconSrc
export const initTabbarIconSrc = data => {
    data = data || {};
    return request({
        url: `${base}/initTabbar`,
        method: "post",
        data
    })
};
