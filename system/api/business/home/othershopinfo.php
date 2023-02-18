
<?php
require_once '../../../utils/DB.php';

// 跨域问题处理
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS, PUT, DELETE");
header('Access-Control-Allow-Headers:x-requested-with,content-type');
$shopid = 0;
$shopid = $_GET['shopid'];

$sql_tabbarname = "SELECT tab_tabbar_name FROM `tabbar` where tab_tabbar_id in ( select s_tabbar_id from shop where s_id = $shopid) limit 1";
$stmt_tabbarname = DB::getInstance()->connect()->query($sql_tabbarname);
$tabbarname = $stmt_tabbarname->fetch();
// var_dump($tabbarname);


$sql_bannername = "SELECT group_name FROM `bannergroup` where group_id in ( select s_bannergroup_id from shop where s_id = $shopid) limit 1";
$stmt_bannername = DB::getInstance()->connect()->query($sql_bannername);
$bannername = $stmt_bannername->fetch();
// var_dump($bannername);

$sql_usernum = "SELECT count(*) usernum FROM `user` where u_shopid = $shopid";
$stmt_usernum = DB::getInstance()->connect()->query($sql_usernum);
$usernum = $stmt_usernum->fetch();
// var_dump($usernum);


$res = array(
    "code" => 1001,
    "data" => array(
       "tabbarname" =>  $tabbarname['tab_tabbar_name'],
       "bannername" => $bannername['group_name'],
       "usernum" => $usernum['usernum'],
    ),
    "message" => ""
);

exit(json_encode($res));