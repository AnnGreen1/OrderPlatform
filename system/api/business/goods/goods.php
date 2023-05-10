
<?php
require_once '../../../utils/DB.php';

// 跨域问题处理
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS, PUT, DELETE");
header('Access-Control-Allow-Headers:x-requested-with,content-type');
$shopid = 0;
$pageindex = 0;
$pagesize = 0;
$g_type = 0;
$g_name = '';
$g_status = 0;
$g_dishName = '';

$shopid = $_REQUEST['shopid'];
$pageIndex = $_REQUEST['pageIndex'];
$pageSize = $_REQUEST['pageSize'];
$g_status = $_REQUEST['g_status'];
$g_dishName = $_REQUEST['g_dishName'];
$g_type = $_REQUEST['g_type'];

$total = "select count(*) total from goods where g_shopid = $shopid and g_dishName like '%$g_dishName%' ";
$sql_goods = "select * from goods where g_shopid = $shopid and g_dishName like '%$g_dishName%' ";
if ($g_status != 2) {
    $sql_goods =$sql_goods. "and g_status = $g_status ";
    $total =$total. "and g_status = $g_status ";
}

if ($g_type != 0) {
    $sql_goods =$sql_goods. "and g_type = $g_type ";
    $total =$total. "and g_type = $g_type ";
}

// echo $sql_shop;
$temp = ($pageIndex-1)*$pageSize;

$sql_goods = $sql_goods."limit $temp, $pageSize"; 
// echo $sql_goods;
$stmt_goods = DB::getInstance()->connect()->query($sql_goods);
$stmt_total = DB::getInstance()->connect()->query($total);

$goods = $stmt_goods ->fetchALL();
$total = $stmt_total ->fetch();

$res = array(
    "code" => 11,
    "data" => Array(
        "total" => $total['total'],
        "goods" => $goods 
    ),
    "message" => ""
);

exit(json_encode($res));