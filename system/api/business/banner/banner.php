
<?php
require_once '../../../utils/DB.php';

// 跨域问题处理
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS, PUT, DELETE");
header('Access-Control-Allow-Headers:x-requested-with,content-type');
$pageIndex = 0;
$pageSize = 0;
$groupstaus = 0;
$pageIndex = $_GET['pageIndex'];
$pageSize = $_GET['pageSize'];

$shopid = $_GET['shopid'];
$groupstatus = $_GET['groupstatus'];

$sql_bannergroup = "";
if($groupstatus == 1){
    $sql_bannergroup = "SELECT group_id, group_name, group_status FROM `bannergroup` where shop_id= $shopid and group_status = 1 group by group_id ";
}else if($groupstatus == 0){
    $sql_bannergroup = "SELECT group_id, group_name, group_status FROM `bannergroup` where shop_id= $shopid and group_status = 0 group by group_id ";
}else{
    $sql_bannergroup = "SELECT group_id, group_name, group_status FROM `bannergroup` where shop_id= $shopid group by group_id ";
}

$stmt_banner  = DB::getInstance()->connect()->query($sql_bannergroup);
$banner = $stmt_banner->fetchAll();



$res = array(
    "code" => 9,
    "data" => array(
        "banner" => $banner
    ) ,
    "message" => ""
);

exit(json_encode($res));