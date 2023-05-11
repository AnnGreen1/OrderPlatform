
<?php
require_once '../../../utils/DB.php';

// 跨域问题处理
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS, PUT, DELETE");
header('Access-Control-Allow-Headers:x-requested-with,content-type');

$groupid = 0;


$groupid = $_GET['groupid'];
$shopid = $_GET['shopid'];

$update = "update `bannergroup` set group_status = 0";

$count  = DB::getInstance()->connect()->exec($update);

$res = array(
    "code" => 1,
    "msg" => ""
);

if ($count > 0) {
    $update2 = "update `bannergroup` set group_status = 1 where group_id = $groupid";
    // echo $update2;
    $count2  = DB::getInstance()->connect()->exec($update2);
    if ($count2 > 0) {
        // echo "<script>alert('注册成功！');location.href='../view/login.php'</script>";
        $update3 = "update `shop` set s_bannergroup_id = $groupid where s_id = $shopid";
        $count3  = DB::getInstance()->connect()->exec($update3);
        if ($count3 > 0) {
            $res['code'] = 1;
            $res['msg'] = "成功！";
        }
    }
}


exit(json_encode($res));
