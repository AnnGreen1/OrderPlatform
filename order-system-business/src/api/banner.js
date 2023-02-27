import request from "@/utils/request";

let base = '/localhost/allPHPcode/OrderPlatform/system/api/business';

// 随机土味情话
export const imgs = data => {
    data = data || {};
    return request({
        url: `${base}/banner/imgs.php?pageIndex=${data.pageIndex}&pageSize=${data.pageSize}&groupid=${data.groupid}`,
        method: "post",
        data
    })
};

export const addimg = data => {
    data = data || {};
    return request({
        url: `${base}/banner/addimg.php?imgurl=${data.imgurl}&height=${data.height}&width=${data.width}&locationurl=${data.locationurl}`,
        method: "post",
        data
    })
};

export const banner = data => {
    data = data || {};
    return request({
        url: `${base}/banner/banner.php?pageIndex=${data.pageIndex}&pageSize=${data.pageSize}&shopid=${data.shopid}&groupstatus=${data.groupstatus}`,
        method: "post",
        data
    })
};