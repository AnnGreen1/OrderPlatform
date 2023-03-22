
<?php
require_once '../../../utils/DB.php';

// 跨域问题处理
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS, PUT, DELETE");
header('Access-Control-Allow-Headers:x-requested-with,content-type');
$shopid = 0;


$shopid = $_REQUEST['shopid'];

$sql_goods = "SELECT form.f_g_id, goods.g_dishName, sum(f_num) count FROM goods, form where f_s_id = 1 and form.f_g_id = goods.g_id and f_s_id = $shopid group by f_g_id asc";

// echo $sql_goods;
$stmt_goods = DB::getInstance()->connect()->query($sql_goods);
// $stmt_total = DB::getInstance()->connect()->query($total);
// var_dump($stmt_goods);
$goods = $stmt_goods->fetchALL();
// $total = $stmt_total ->fetch();

$res = array(
    "code" => 20,
    "data" => Array(
        "goods" => $goods 
    ),
    "message" => ""
);

exit(json_encode($res));