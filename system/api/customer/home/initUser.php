
<?php
require_once '../../../utils/DB.php';

// 跨域问题处理
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS, PUT, DELETE");
header('Access-Control-Allow-Headers:x-requested-with,content-type');
$shopid = 0;
$username = '';
$shopid = $_REQUEST['shopid'];
$username = $_REQUEST['username'];
$time = time();
// $total = "select count(*) total from goods where g_shopid = $shopid and g_dishName like '%$g_dishName%' ";
$sql_goods = "insert into user values ('', '$username', 0, 111111, 0, $time , 'anngreen.jpeg', $shopid)";


// echo $sql_goods;
// $temp = ($pageIndex-1)*$pageSize;

// $sql_goods = $sql_goods."limit $temp, $pageSize"; 
// echo $sql_goods;
$count = DB::getInstance()->connect()->exec($sql_goods);

// $total = $stmt_total ->fetch();

$res = array(
    "code" => 12,
    "msg" => "sucsessful"
);

if ($count > 0) {
    $res['code'] = 12;
    $res['msg'] = "sucsessful";
}

exit(json_encode($res));