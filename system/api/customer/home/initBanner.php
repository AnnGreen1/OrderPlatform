
<?php
require_once '../../../utils/DB.php';

// 跨域问题处理
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS, PUT, DELETE");
header('Access-Control-Allow-Headers:x-requested-with,content-type');

$sql_initBanner = "select * from banner where banner_status = 1";

$stmt_initBanner = DB::getInstance()->connect()->query($sql_initBanner);

$banner = $stmt_initBanner ->fetchALL();
// var_dump($tabbarConfig);
for($time = 0;$time<count($banner);$time++){
    // echo $tabbarconfigitem['tab_icon'];
    $banner[$time]['banner_url'] = 'http://localhost/allPHPcode/OrderPlatform/system/resource/banner/'. $banner[$time]['banner_url'];
    // echo $tabbarconfigitem['tab_icon'];

}
// var_dump($tabbarConfig);
$res = array(
    "code" => "",
    "data" => $banner,
    "message" => ""
);

if (empty($banner)) {
    $res['code'] = 404;
    $res['message'] = "查找失败";
} else {
    $res['code'] = 1001;
    $res['message'] = "查找成功";
}


exit(json_encode($res));