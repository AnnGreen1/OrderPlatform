
<?php
require_once '../utils/DB.php';

// 跨域问题处理
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS, PUT, DELETE");
header('Access-Control-Allow-Headers:x-requested-with,content-type');
$gid = 0;


$gid = $_REQUEST['gid'];


$sql_good = "select * from goods where g_id = $gid";

$stmt_good = DB::getInstance()->connect()->query($sql_good);
// $stmt_total = DB::getInstance()->connect()->query($total);

$good = $stmt_good->fetch();
// $total = $stmt_total ->fetch();

$res = array(
    "code" => 15,
    "data" => Array(
        "good" => $good
    ),
    "message" => ""
);

exit(json_encode($res));