
<?php
require_once '../../../utils/DB.php';

// 跨域问题处理
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS, PUT, DELETE");
header('Access-Control-Allow-Headers:x-requested-with,content-type');
$username = '';
$shopid = 0;
$username = $_REQUEST['username'];
$shopid = $_REQUEST['shopid'];


    $sql_banner = "SELECT DISTINCT f_id  FROM `form` where f_u_username = '$username' and f_s_id = $shopid";




$stmt_banner  = DB::getInstance()->connect()->query($sql_banner);
$banner = $stmt_banner->fetchAll();




$res = array(
    "code" => 15,
    "data" => array(
        "formids" => $banner
    ) ,
    "message" => ""
);

exit(json_encode($res));