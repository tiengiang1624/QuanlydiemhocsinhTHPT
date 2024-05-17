<?php
    session_start();
    if (!isset($_SESSION["username"]) ) {
        header('location:login.php');
    }


?>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="home.css">
    <title>Trang chủ</title>
</head>
<body>
    <div class="header-container">
        <h1>Tiêu đề trang web</h1>
        <nav>
            <ul>
                <li class="menu"><a href="#">Trang chủ</a></li>
                <li class="menu"><a href="#">Giới thiệu</a></li>
                <li class="menu"><a href="#">Dịch vụ</a></li>
                <li class="menu"><a href="#">Liên hệ</a></li>
                <li class="menu"><a href="#">Tin tức</a></li>
            </ul>
        </nav>
    </div>
    
</body>