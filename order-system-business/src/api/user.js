import request from "@/utils/request";

let base = '/localhost/allPHPcode/OrderPlatform/system/api/business';
// 随机土味情话
export const users = data => {
    data = data || {};
    return request({
        url: `${base}/user/users.php`,
        method: "post",
        data
    })
};
