
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

$imgurl = $_GET['imgurl'];
$height = $_GET['height'];
$width = $_GET['width'];
$locationurl = $_GET['locationurl'];

$res = array(
    "code" => 0,
    "data" => array(
       
    ) ,
    "msg" => ""
);

$sql_addimg = "insert into `banner` values (null, '$imgurl', $height, $width, '$locationurl')";
// echo $sql_addimg;

$count = DB::getInstance()->connect()->exec($sql_addimg);

if ($count > 0) {
    // echo "<script>alert('注册成功！');location.href='../view/login.php'</script>";

    $res['code'] = 8;
    $res['msg'] = "添加成功！";
} else {
    // echo "<script>alert('注册失败！');location.href='../view/register.php'</script>";
    $res['code'] = -2;
    $res['msg'] = "添加失败！";
}


exit(json_encode($res));