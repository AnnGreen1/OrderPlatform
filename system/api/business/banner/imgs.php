
<?php
require_once '../../../utils/DB.php';

// 跨域问题处理
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS, PUT, DELETE");
header('Access-Control-Allow-Headers:x-requested-with,content-type');
$pageIndex = 0;
$pageSize = 0;
$groupid = 0;
$pageIndex = $_GET['pageIndex'];
$pageSize = $_GET['pageSize'];
$groupid = $_GET['groupid'];
$sql_banner = '';
$sql_total = '';
if($groupid){
    $temp = ($pageIndex-1)*$pageSize;
    $sql_banner = "SELECT * FROM `banner` where banner_id in (select banner_id from bannergroup where group_id = $groupid) limit $temp, $pageSize ";
    $sql_total = "select count(banner_id) total from `bannergroup` where group_id = $groupid";
}else{
    $temp = ($pageIndex-1)*$pageSize;
    $sql_banner = "SELECT * FROM `banner` WHERE banner_id > ($pageIndex-1)*$pageSize limit $pageSize";
    $sql_total = "select count(*) total from `banner`";
}


$stmt_banner  = DB::getInstance()->connect()->query($sql_banner);
$banner = $stmt_banner->fetchAll();

for($time = 0;$time<count($banner);$time++){
    // echo $tabbarconfigitem['tab_icon'];
    $banner[$time]['banner_url'] = 'http://localhost/allPHPcode/OrderPlatform/system/resource/shop/banner/'. $banner[$time]['banner_url'];
    // echo $tabbarconfigitem['tab_icon'];

}


$stmt_total  = DB::getInstance()->connect()->query($sql_total);
$total = $stmt_total->fetch();
// // var_dump($total);


// // $sql_bannername = "SELECT group_name FROM `bannergroup` where group_id in ( select s_bannergroup_id from shop where s_id = $shopid) limit 1";
// // $stmt_bannername = DB::getInstance()->connect()->query($sql_bannername);
// // $bannername = $stmt_bannername->fetch();
// // // var_dump($bannername);

// // $sql_usernum = "SELECT count(*) usernum FROM `user` where u_shopid = $shopid";
// // $stmt_usernum = DB::getInstance()->connect()->query($sql_usernum);
// // $usernum = $stmt_usernum->fetch();
// // // var_dump($usernum);


$res = array(
    "code" => 1,
    "data" => array(
        "total" => $total['total'],
        "banner" => $banner
    ) ,
    "message" => ""
);

exit(json_encode($res));