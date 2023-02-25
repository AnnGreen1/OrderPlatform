
<?php
require_once '../../../utils/DB.php';

// 跨域问题处理
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS, PUT, DELETE");
header('Access-Control-Allow-Headers:x-requested-with,content-type');
$shopid = 0;
$shopid = $_GET['shopid'];
$sql_shop = "select * from shop where s_id = $shopid";

$stmt_shop = DB::getInstance()->connect()->query($sql_shop);

$shop = $stmt_shop ->fetchALL();

$res = array(
    "code" => 1,
    "data" => $shop,
    "message" => ""
);

exit(json_encode($res));