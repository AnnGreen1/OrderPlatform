
<?php
require_once '../../../utils/DB.php';

// 跨域问题处理
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS, PUT, DELETE");
header('Access-Control-Allow-Headers:x-requested-with,content-type');
$shopid = 0;
$pageindex = 0;
$pagesize = 0;

$shopid = $_REQUEST['shopid'];
$pageIndex = $_REQUEST['pageIndex'];
$pageSize = $_REQUEST['pageSize'];
$temp = ($pageIndex-1)*$pageSize;
$total = "select count(*) total from user where u_shopid = $shopid";
$sql_goods = "select * from user where u_shopid = $shopid limit $temp, $pageSize"; 
// echo $sql_goods;
$stmt_goods = DB::getInstance()->connect()->query($sql_goods);
$stmt_total = DB::getInstance()->connect()->query($total);

$goods = $stmt_goods ->fetchALL();
$total = $stmt_total ->fetch();

$res = array(
    "code" => 19,
    "data" => Array(
        "total" => $total['total'],
        "users" => $goods 
    ),
    "message" => ""
);

exit(json_encode($res));