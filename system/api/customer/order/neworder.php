
<?php
use function PHPSTORM_META\type;

require_once '../../../utils/DB.php';

// 跨域问题处理
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS, PUT, DELETE");
header('Access-Control-Allow-Headers:x-POSTed-with,content-type');
$username = "";
$price = [];
$gids = [];
$nums = [];
$shopid = 0;

// $content = file_get_contents('php://input');   
// print_r($content); //name=xxx&.....

$username = $_POST['username'];
$pricep = $_POST['price'];
$gidsp = $_POST['gids'];
$numsp = $_POST['nums'];
$shopid = $_POST['shopid'];
// echo $gidsp ;
$price = json_decode($pricep,true);
$gids = json_decode($gidsp, true);
$nums = json_decode($numsp,true);
// var_dump($gids);
$res = array(
    "code" => 0,
    "data" => array(
        // "total" => $total['total'],
        // "gids" => json_decode($gids) 
    ),
    "msg" => ""
);
$f_id = time();
for ($time = 0; $time < count($gids); $time++) {
    $sql_addimg = "insert into `form` values (null, '$f_id', '$username', $price[$time], 0,  $gids[$time],   $nums[$time], $f_id, $shopid)";

    $count = DB::getInstance()->connect()->exec($sql_addimg);

    if ($count > 0) {
        continue;
    } 
}
// $sql_addimg = "insert into `form` values (null, '$imgurl', $height, $width, '$locationurl')";
// echo $sql_addimg;
$res = array(
    "code" => 14,
    "msg" => ""
);



exit(json_encode($res));