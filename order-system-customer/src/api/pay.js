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
