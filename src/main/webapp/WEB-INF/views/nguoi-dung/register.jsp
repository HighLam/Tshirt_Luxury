<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng ký</title>
    <link rel="stylesheet" href="../css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
    <link rel="shortcut icon" href="../images/favicon.png" type="image/x-icon">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="../js/script.js"></script>
</head>

<body style="background-image: url(../images/banner/bg-login.jpg);min-height: 746px;">

<div class="wrapper-register">
    <div class="register">
        <div class="logo-register">
            <a href="/t-shirt-luxury/trang-chu">
                <img src="../images/logo.png" alt="">
            </a>
        </div>
        <div class="text-welcome">
            <p>Welcome back!</p>
            <p>Thương hiệu thời trang của người Việt</p>
        </div>
        <form action="#">
            <input type="text" class="ho mb-3" placeholder="Họ">
            <input type="text" class="ten-dem mb-3" placeholder="Tên đệm">
            <input type="text" class="ten mb-3" placeholder="Tên">
            <input type="text" class="tai-khoan mb-3" placeholder="Email hoặc số điện thoại">
            <input type="password" class="mat-khau" placeholder="Mật khẩu">
            <button class="button-dang-ky mt-3">Đăng ký</button>
        </form>
        <div class="text-or">
            <div class="line-left"></div>
            <p>hoặc</p>
            <div class="line-right"></div>
        </div>
        <div class="register-by-facebook-google">
            <a class="button-register-by-facebook" href="#">
                <img src="../images/facebook-2-logo-svgrepo-com.svg" alt="">
                <p class="mb-0 ms-3">Tiếp tục với Facebook</p>
            </a>
            <a class="button-register-by-google" href="#">
                <img src="../images/google-logo-search-new-svgrepo-com.svg" alt="">
                <p class="mb-0 ms-3">Tiếp tục với Google</p>
            </a>

        </div>
        <div class="change-page-login">
            <a href="/t-shirt-luxury/login" class="link-page-login">Đăng nhập nếu bạn đã có tài khoản.</a>
        </div>
    </div>
</div>

<script src="/docs/5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>

</body>

</html>