<?php
require_once '../../../utils/DB.php';

// 跨域问题处理
// header("Access-Control-Allow-Origin: *");
// header("Access-Control-Allow-Methods: POST, GET, OPTIONS, PUT, DELETE");
// header('Access-Control-Allow-Headers:x-requested-with,content-type');


$username = '';
$type = 1;
//  获取前端提交的用户名和密码
$username = $_REQUEST['username'];
$type = $_REQUEST['type'];
// echo $username . "   " . $password;
$sqlShop = '';
if ($type == 1) {
    //店铺
    $sqlShop = "select * from shop where s_admin = '$username'";
    // echo $sqlLogin
} else {
    //管理员
    $sqlShop = "select * from shop where s_username = '$username'";
    // echo $sqlLogin;
}

$stmtShop = DB::getInstance()->connect()->query($sqlShop);
    $Shop = $stmtShop->fetchAll();
    $msg = array(
        "code" => "",
        "shops" => "",
    );

    if (empty($Shop)) {
        $msg['code'] = -1;
        $msg['shops'] = $Shop;
    } else {
        $msg['code'] = 2;
        $msg['shops'] = $Shop;
    }
    exit(json_encode($msg));