
<?php
require_once '../../../utils/DB.php';

// 跨域问题处理
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS, PUT, DELETE");
header('Access-Control-Allow-Headers:x-requested-with,content-type');
$username = '';
$shopid = 0;
$formid = $_REQUEST['formid'];
$status = $_REQUEST['status'];

$update = "update `form` set f_status = $status where f_id = $formid";



$count  = DB::getInstance()->connect()->exec($update);



if ($count > 0) {
    // echo "<script>alert('注册成功！');location.href='../view/login.php'</script>";

    $res['code'] = 18;
    $res['msg'] = "成功！";
}

exit(json_encode($res));
