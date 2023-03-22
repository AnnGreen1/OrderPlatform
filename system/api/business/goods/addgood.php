
<?php
require_once '../../../utils/DB.php';

// 跨域问题处理
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS, PUT, DELETE");
header('Access-Control-Allow-Headers:x-requested-with,content-type');
$imgurl = "";
$height = 0;
$width = 0;
$locationurl = "";

$dishName = $_GET['dishName'];
$dishDesc = $_GET['dishDesc'];
$imgurl = $_GET['imgurl'];
$type = $_GET['type'];
$price = $_GET['price'];
$status = $_GET['status'];
// $price = $_GET['price'];
$shopid = $_GET['shopid'];

$res = array(
    "code" => 0,
    "data" => array(),
    "msg" => ""
);
$time = time();
if ($status == 1) {
    // 上架
    $sql_addimg = "insert into `goods` values (null, '$dishName', $status, '$dishDesc', '$imgurl',$time,$time,$type,$shopid,$price)";
} else {
    // 不上架
    $sql_addimg = "insert into goods(g_id, g_dishName, g_status, g_dishDesc, g_imgUrl, g_createdTime, g_type, g_shopid, g_price) values (null, '$dishName', $status, '$dishDesc', '$imgurl',$time,$type,$shopid,$price)";
}

// echo $sql_addimg;

$count = DB::getInstance()->connect()->exec($sql_addimg);

if ($count > 0) {
    // echo "<script>alert('注册成功！');location.href='../view/login.php'</script>";

    $res['code'] = 18;
    $res['msg'] = "添加成功！";
} 


exit(json_encode($res));
