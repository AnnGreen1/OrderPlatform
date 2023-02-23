import request from "@/utils/request";

let base = '/localhost/allPHPcode/OrderPlatform/system/api/business';

// 随机土味情话
export const imgs = data => {
    data = data || {};
    return request({
        url: `${base}/banner/imgs.php?pageIndex=${data.pageIndex}&pageSize=${data.pageSize}`,
        method: "post",
        data
    })
};