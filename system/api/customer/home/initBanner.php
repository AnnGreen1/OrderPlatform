
<?php
require_once '../../../utils/DB.php';

// 跨域问题处理
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS, PUT, DELETE");
header('Access-Control-Allow-Headers:x-requested-with,content-type');
$shopid = 0;
$shopid = $_GET['shopid'];
$shopsql = "select s_bannergroup_id from shop where s_id = $shopid";
// echo $shopsql;
$stmt_shop = DB::getInstance()->connect()->query($shopsql);
// var_dump($stmt_shop);
$shop = $stmt_shop->fetchALL();
// var_dump($shop);
// var_dump($shop[0]["s_bannergroup_id"]);

$bannerssql = "SELECT * FROM `banner` where banner_id in ( select banner_id from `bannergroup` where group_id =".$shop[0]['s_bannergroup_id']." )";
// echo $bannerssql;
$stmt_banners = DB::getInstance()->connect()->query($bannerssql);
// var_dump($stmt_banners);
$banners =$stmt_banners->fetchALL();
// var_dump($banners);
for($time = 0;$time<count($banners);$time++){
    // echo $tabbarconfigitem['tab_icon'];
    $banners[$time]['banner_url'] = 'http://localhost/allPHPcode/OrderPlatform/system/resource/banner/'. $banners[$time]['banner_url'];
    // echo $tabbarconfigitem['tab_icon'];

}
// var_dump($tabbarConfig);
$res = array(
    "code" => "",
    "data" => $banners,
    "message" => ""
);

if (empty($banners)) {
    $res['code'] = 404;
    $res['message'] = "查找失败";
} else {
    $res['code'] = 1001;
    $res['message'] = "查找成功";
}


exit(json_encode($res));