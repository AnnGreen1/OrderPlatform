
<?php
require_once '../../../utils/DB.php';

// 跨域问题处理
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS, PUT, DELETE");
header('Access-Control-Allow-Headers:x-requested-with,content-type');
$shopid = 0;
$end = 0;
$begin = 0;

$shopid = $_REQUEST['shopid'];
$end = $_REQUEST['end'];
$begin = $_REQUEST['begin'];

$sql_goods = "SELECT sum(f_price) price FROM form where f_s_id = 1 and f_time <= $end and f_time >= $begin";

// echo $sql_goods;
$stmt_goods = DB::getInstance()->connect()->query($sql_goods);
// $stmt_total = DB::getInstance()->connect()->query($total);
// var_dump($stmt_goods);
$goods = $stmt_goods->fetch();
// $total = $stmt_total ->fetch();

$res = array(
    "code" => 21,
    "data" => Array(
        "goods" => $goods 
    ),
    "message" => ""
);

exit(json_encode($res));