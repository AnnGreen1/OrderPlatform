
<?php
require_once '../../../utils/DB.php';

// 跨域问题处理
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS, PUT, DELETE");
header('Access-Control-Allow-Headers:x-requested-with,content-type');

$sql_initTabbarConfig = "select * from tabbar where tab_tabbar_id = 1  and tab_tabbar_status = 1";

$stmt_initTabbarConfig = DB::getInstance()->connect()->query($sql_initTabbarConfig);

$tabbarConfig = $stmt_initTabbarConfig ->fetchALL();
// var_dump($tabbarConfig);
for($time = 0;$time<count($tabbarConfig);$time++){
    // echo $tabbarconfigitem['tab_icon'];
    $tabbarConfig[$time]['tab_icon'] = 'http://localhost/allPHPcode/system/resource/tabbar/'. $tabbarConfig[$time]['tab_icon'];
    $tabbarConfig[$time]['tab_icon_active'] = 'http://localhost/allPHPcode/system/resource/tabbar/'. $tabbarConfig[$time]['tab_icon_active'];
    // echo $tabbarconfigitem['tab_icon'];
}
// var_dump($tabbarConfig);
$res = array(
    "code" => "",
    "data" => $tabbarConfig,
    "message" => ""
);

if (empty($tabbarConfig)) {
    $res['code'] = 404;
    $res['message'] = "查找失败";
} else {
    $res['code'] = 1001;
    $res['message'] = "查找成功";
}


exit(json_encode($res));