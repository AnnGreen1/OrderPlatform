
<?php
require_once '../../../utils/DB.php';

// 跨域问题处理
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS, PUT, DELETE");
header('Access-Control-Allow-Headers:x-requested-with,content-type');
$shopid = 0;

$shopid = $_REQUEST['shopid'];


// $total = "select count(*) total from goods where g_shopid = $shopid and g_dishName like '%$g_dishName%' ";
$sql_goods = "select * from goods where g_shopid = $shopid order by g_type asc";


// echo $sql_shop;
// $temp = ($pageIndex-1)*$pageSize;

// $sql_goods = $sql_goods."limit $temp, $pageSize"; 
// echo $sql_goods;
$stmt_goods = DB::getInstance()->connect()->query($sql_goods);
// $stmt_total = DB::getInstance()->connect()->query($total);

$goods = $stmt_goods ->fetchALL();
// $total = $stmt_total ->fetch();

$res = array(
    "code" => 12,
    "data" => Array(
        // "total" => $total['total'],
        "goods" => $goods 
    ),
    "message" => ""
);

exit(json_encode($res));