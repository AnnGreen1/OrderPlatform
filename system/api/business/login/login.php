<?php
require_once '../../../utils/DB.php';





//  获取前端提交的用户名和密码
$username = $_REQUEST['username'];
$password = $_REQUEST['password'];
// echo $username . "   " . $password;

$sqlStuLogin = "select * from user where u_email = '$username'";
// echo $sqlStuLogin;

$stmtStu = DB::getInstance()->connect()->query($sqlStuLogin);

$stu = $stmtStu->fetch();

$msg = array(
    "code" => "",
    "username" => "",
    
);

if (empty($stu)) {

    // echo "<script>alert('用户不存在！');history.go(-1);</script>";
    $msg['code'] = 404;
    $msg['username'] = "";
} else {
    //echo "进入了else";
    //echo $admin['password'];
    //是管理员用户，之后判断密码是否正确
    if ($stu['u_password'] == $password) {
        // 启用session
        // session_start();
        // 将用户名保存到session中
        // $_SESSION['username'] = $username;
        // echo "欢迎管理员用户" . $username;
        // echo "<script>location.href='../view/homepage.php';</script>";

        $msg['code'] = 1001;
        $msg['username'] = $username;
    } else {
        // echo "<script>alert('密码错误！');history.go(-1);</script>";
        $msg['code'] = -1000;
        $msg['username'] = "";
    }
}

// exit("sf");

exit(json_encode($msg));




// $username = $_POST['username'];
// $password = $_POST['password'];

// $data = array("status" => false, "msg" => "账号或密码错误");


// // $sqlStuLogin = "select * from user where u_email = '$username'";
// // // echo $sqlStuLogin;

// // $stmtStu = DB::getInstance()->connect()->query($sqlStuLogin);

// // $stu = $stmtStu->fetch();

// if ($username == 'xiaohua@qq.com' && $password == '123') {
//     $data = array(
//         "status" => true,
//         "msg" => "登录成功",
//         "result" => array(
//             "userInfo" => array(
//                 "name" => "青风",
//                 "star" => 7,
//                 "phone" => '18555555555',
//                 "common_address" => [],
//                 "avatar" => 'http://img.keaitupian.cn/uploads/2021/06/03/db212bbc23c14118b35c23b0db7cd8bd.jpg'
//             )
//         )
//     );

// }

// echo json_encode($data, JSON_UNESCAPED_UNICODE);