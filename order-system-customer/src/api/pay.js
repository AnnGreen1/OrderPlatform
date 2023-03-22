import request from "@/utils/request";

let base = '/localhost/allPHPcode/OrderPlatform/system/api/customer';

// 初始化tabbarConfig
export const formids = data => {
    data = data || {};
    return request({
        url: `${base}/pay/formids.php?username=${data.username}&shopid=${data.shopid}`,
        method: "post",
        data
    })
};

export const form = data => {
    data = data || {};
    return request({
        url: `${base}/pay/form.php?username=${data.username}&shopid=${data.shopid}&formid=${data.formid}`,
        method: "post",
        data
    })
};

export const pay = data => {
    data = data || {};
    return request({
        url: `${base}/pay/pay.php?formid=${data.formid}`,
        method: "post",
        data
    })
};