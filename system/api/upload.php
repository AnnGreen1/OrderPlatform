<?php

$res = array(
    "code" => 3,
    "data" => array(
        "url" => "",
        "name" => ""
    ),
    "message" => ""
);

# 获取文件
$file = $_FILES['file'];
# 获取文件的原名字
$name = $file['name'];
# 获取文件的类型
$type = $file['type'];
# 获取文件的大小
$size = $file['size'];
# 获取文件在服务端的临时文件名
$tmpName = $file['tmp_name'];
# 判断如果有错误出现
if ($file["error"] > 0) {
    # 提示出现错误
    // echo "文件上传失败！Error:" . $file['error'];
} else {
    # 未出现错误，说明上传成功，那么需要通过临时名，将图片（以图片为例）存储到某个目录中
    if((int)$_POST['type'] === 1){
        # banner
        if (move_uploaded_file($tmpName, "../resource/shop/banner/$name")) {
            # 图片存储成功则返回一个 img 标签，并展示此图片
            // echo "<img src='http://localhost:8080/allPHPCode/ElementPaginationDemo/$name'>";
            $res['data']['name'] = $name;
            $res['data']['url'] = "http://localhost/allPHPCode/OrderPlatform/system/resource/shop/banner/$name";
        } else {
            # 提示出现错误
            // echo "文件上传失败！";
            $res['code'] = -3;
            $res['msg'] = "fail";
        }
    }
    if((int)$_POST['type'] === 2){
        # banner
        if (move_uploaded_file($tmpName, "../resource/shop/goods/$name")) {
            # 图片存储成功则返回一个 img 标签，并展示此图片
            // echo "<img src='http://localhost:8080/allPHPCode/ElementPaginationDemo/$name'>";
            $res['data']['name'] = $name;
            $res['data']['url'] = "http://localhost/allPHPCode/OrderPlatform/system/resource/shop/goods/$name";
        } else {
            # 提示出现错误
            // echo "文件上传失败！";
            $res['code'] = -3;
            $res['msg'] = "fail";
        }
    }
    
}

exit(json_encode($res));
