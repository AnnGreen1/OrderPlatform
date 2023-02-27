
<?php

use function PHPSTORM_META\type;

require_once '../../../utils/DB.php';

// 跨域问题处理
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS, PUT, DELETE");
header('Access-Control-Allow-Headers:x-requested-with,content-type');
$bannergroupname = "";
$bannerids = [];
$shopid = 0;

$bannergroupname = $_POST['bannergroupname'];
$bannerids = $_POST['bannerids'];
$shopid = $_POST['shopid'];

// echo $height;
// echo ($bannerids);
// echo ($bannerids[2]);
$res = array(
    "code" => 0,
    "data" => array(),
    "msg" => ""
);

$sql_max_group_id = "select max(group_id) max_group_id from bannergroup";
// echo $sql_max_group_id;

$stmt_max_group_id  = DB::getInstance()->connect()->query($sql_max_group_id);

$max_group_id_arr = $stmt_max_group_id->fetch();
// var_dump($max_group_id );
// echo $max_group_id['max_group_id'];
$max_group_id =  $max_group_id_arr['max_group_id'] + 1;

$sql_addbannergroup = "insert into `bannergroup` values ";
// echo $sql_addimg;
for ($time = 0; $time < count($bannerids); $time++) {
    $sql_addbannergroup = $sql_addbannergroup . "(null,$max_group_id,$bannerids[$time], '$bannergroupname', 0, $shopid)";
    if($time !=count($bannerids)-1){
        $sql_addbannergroup = $sql_addbannergroup.',';
    }
}
// echo $sql_addbannergroup;
$count = DB::getInstance()->connect()->exec($sql_addbannergroup);

if ($count > 0) {
    // echo "<script>alert('注册成功！');location.href='../view/login.php'</script>";

    $res['code'] = 10;
    $res['msg'] = "添加成功！";
} else {
    // echo "<script>alert('注册失败！');location.href='../view/register.php'</script>";
    $res['code'] = -2;
    $res['msg'] = "添加失败！";
}


exit(json_encode($res));
