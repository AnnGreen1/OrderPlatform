import request from "@/utils/request";

let base = '/localhost/allPHPcode/OrderPlatform/system/api/business';

// 随机土味情话
export const login = data => {
    data = data || {};
    return request({
        url: `${base}/home/login/login.php`,
        method: "post",
        data
    })
};