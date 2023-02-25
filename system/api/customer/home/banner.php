
<?php
require_once '../../../utils/DB.php';

// 跨域问题处理
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS, PUT, DELETE");
header('Access-Control-Allow-Headers:x-requested-with,content-type');
$shopid = 0;
$shopid = $_GET['shopid'];
/**
 * 1、根据shopid查找banner_group_id
 * 2、根据banner_group_id查找banner_id集合
 * 3、查找banner集合
 */
$sql_banner_group_id = "select s_bannergroup_id from shop where s_id = $shopid";

$stmt_banner_group_id = DB::getInstance()->connect()->query($sql_banner_group_id);

$banner_group_id = $stmt_banner_group_id ->fetchALL();
// var_dump($banner_group_id);
// var_dump($banner_group_id[0]['s_bannergroup_id']);
$sql_banner = "SELECT * FROM banner where banner_id in (select banner_id from bannergroup where group_id = ".$banner_group_id[0]['s_bannergroup_id']." )";
$stmt_banner = DB::getInstance()->connect()->query($sql_banner);
$banner = $stmt_banner->fetchALL();

$res = array(
    "code" => 2,
    "data" => $banner,
    "message" => ""
);

exit(json_encode($res));