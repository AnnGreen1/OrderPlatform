
<?php
require_once '../../../utils/DB.php';

// 跨域问题处理
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS, PUT, DELETE");
header('Access-Control-Allow-Headers:x-requested-with,content-type');
$username = '';
$shopid = 0;
$formid = $_REQUEST['formid'];
$shopid = $_REQUEST['shopid'];
$username = $_REQUEST['username'];


$form_info = "SELECT DISTINCT f_id, f_tableid, f_status, f_time  FROM `form` where f_u_username = '$username' and f_s_id = $shopid and f_id = $formid";

$form_goods = "SELECT f_g_id, f_num, f_price, g_dishName from form, goods where form.f_g_id = goods.g_id and f_id = $formid";



$stmt_form_info  = DB::getInstance()->connect()->query($form_info);
$info = $stmt_form_info->fetch();

$stmt_form_goods  = DB::getInstance()->connect()->query($form_goods);
$goods = $stmt_form_goods->fetchAll();


$res = array(
    "code" => 16,
    "data" => array(
        "info" => $info,
        "goods" => $goods
    ),
    "message" => ""
);

exit(json_encode($res));
