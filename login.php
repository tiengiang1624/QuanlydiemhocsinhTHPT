<?php
session_start();
if (isset($_SESSION["username"]) ){
    header('location: admin.php');
}

    if(isset($_POST['dangnhap'])  ){
        $username = $_POST['username'];
        $password = $_POST['password'];
    

    include('connect.php');
    // Xác minh thông tin đăng nhập
    $sql = "SELECT * FROM taikhoan WHERE username = '$username' AND password = '$password'";
    $result = $db->query($sql);
    
    if ($result->num_rows > 0) {
        // Đăng nhập thành công
        session_start();
        $_SESSION['username'] = $username;
        header('Location: home.php');
    } else {
        // Đăng nhập thất bại
        echo '<p>Tên đăng nhập hoặc mật khẩu không chính xác.</p>';
    }

    $db->close();
/*
    if($username =='admin' && $password == 'admin'){
        $_SESSION['username'] = '$username';
        header('location: home.php');
    }
*/
}

?>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="login.css">
    <title>Đăng nhập</title>
</head>
<body>
 <div class="login-container">
    <h1 class="title">Đăng nhập</h1>
    <form action="login.php" method="post">
        <div class="textbox">
         <div class="border-group" style="margin-bottom:15px;">
         <div class="control-label">Tên tài khoản</div>
            <div class="input">
                <input type="text" id="username" name="username" placeholder="Tên đăng nhập"required autofocus>
            </div> 
          <br>
        <div class="control-label">Mật khẩu</div>
            <div class="input">
                <input type="password" id="password" name="password" placeholder="Mật khẩu" required>
            </div>
         </div>
        </div>
        <div class="btlogin">
        <button type="submit" name="dangnhap">Đăng nhập</button>
        </div>
    </form>
</div>
<div class="box">           </div>
</body>
</html>
