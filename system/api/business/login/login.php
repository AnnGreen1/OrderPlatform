<?php
require_once '../../../utils/DB.php';

// 跨域问题处理
// header("Access-Control-Allow-Origin: *");
// header("Access-Control-Allow-Methods: POST, GET, OPTIONS, PUT, DELETE");
// header('Access-Control-Allow-Headers:x-requested-with,content-type');


$username = '';
$password = '';
$type = 1;
//  获取前端提交的用户名和密码
$username = $_REQUEST['username'];
$password = $_REQUEST['password'];
$type = $_REQUEST['type'];
// echo $username . "   " . $password;
$sqlLogin = '';
if ($type == 1) {
    //店铺
    $sqlLogin = "select * from shop where s_username = '$username' and s_password = '$password'";
    // echo $sqlLogin;
    $stmtLogin = DB::getInstance()->connect()->query($sqlLogin);
    $shop = $stmtLogin->fetch();
    $msg = array(
        "code" => "",
        "userinfo" => "",
    );

    if (empty($shop)) {
        $msg['code'] = 404;
        $msg['userinfo'] = "";
    } else {
        $msg['code'] = 1001;
        $msg['userinfo'] = $shop;
    }
    exit(json_encode($msg));
} else {
    //管理员
    $sqlLogin = "select * from admin where a_username = '$username' and a_password = '$password'";
    // echo $sqlLogin;
    $stmtLogin = DB::getInstance()->connect()->query($sqlLogin);
    $admin = $stmtLogin->fetch();
    $msg = array(
        "code" => "",
        "userinfo" => "",
    );

    if (empty($admin)) {
        $msg['code'] = 404;
        $msg['userinfo'] = $admin;
    } else {

        $msg['code'] = 1002;
        $msg['userinfo'] = $admin;
    }
    exit(json_encode($msg));
}
