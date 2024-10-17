<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Áo Nam</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>



    <style>
        * {
            margin: 0;
            box-sizing: border-box;
        }

        :root {
            --main-font: 'Poppins';
        }

        .wrapper {
            max-width: 100%;
            max-height: 753px;
            position: relative;
        }

        .display-hidden {
            visibility: hidden;
        }

        .banner-top {
            min-width: 100%;
            height: 753px;
        }

        .side-bar {
            width: 100%;
            position: absolute;
            top: 0;
            transition: all ease-in-out 1s;
            display: flex;
            flex-direction: row;
            justify-content: space-between;
        }

        .danh-muc {
            width: 40%;
            padding: 40px 0px 40px 10px;
            display: flex;
            flex-direction: column;
            height: 753px;

        }

        .danh-muc ul {
            display: flex;
            margin: 0;
            padding: 0;
        }

        .danh-muc ul li {
            list-style-type: none;
        }

        .danh-muc ul li a {
            text-decoration: none;
            color: #fff;
            font-size: 20px;
            top: 0;
            text-transform: uppercase;
            font-weight: 700;
            padding: 0 18px;

            line-height: 30px;
        }


        .border-right {
            border-right: 0.5px solid #ffff;
        }

        .bg-white {
            background-color: #ffff;
        }

        .text-black {
            color: #000;
        }

        .text-gray {
            color: gray;
        }

        .logo-header {
            width: 170px;
            height: 100px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .logo-header img {
            width: 140px;
            height: 140px;
            object-fit: contain;

        }

        .form-search {
            border-bottom: 1px solid #fff;
            height: 35px;
            width: 350px;
        }

        .input-search {

            border: none;
            background-color: transparent;

        }


        .input-search::placeholder {
            color: #fff;
            font-size: 24px;

        }

        .input-search:focus {
            outline: none;
        }

        .form-search i {
            color: #fff;
            font-size: 24px;
        }

        .search-favourite-cart {
            display: flex;
            flex-direction: row;
            padding-top: 40px;

        }

        .search-favourite-cart a i {
            color: #fff;
            font-size: 24px;
            padding-top: 10px;

        }

        #type-tshirt {
            display: flex;
            flex-direction: column;
            margin-top: 30px;
            align-content: space-between;

        }

        #type-tshirt > li {
            padding-bottom: 20px;

        }

        ul .login-and-signin {
            margin-top: 300px;
        }

        .login-and-signin i {
            padding-left: 18px;
            font-size: 24px;
        }

        .login-and-signin li {
            padding-bottom: 0px;
        }

        .header-popup {
            width: 100%;
            display: flex;
            flex-direction: row;
            position: relative;
            top: 0;
            background-color: #fff;
            z-index: 5;
        }

        .header-popup ul li {
            list-style-type: none;

        }

        .menu-popup {
            display: flex;
            padding-top: 30px;
            gap: 20px;
            padding-left: 0px;
        }

        .header-popup ul li a {
            color: #000;
            text-decoration: none;
            font-size: 18px;
            font-weight: 500;
        }

        .search-favourite-cart-popup {
            display: flex;
            flex-direction: row;
            padding-top: 20px;
            margin-left: 340px;

        }

        .search-favourite-cart-popup a i {
            color: #000;
            font-size: 18px;
            padding-top: 15px;

        }

        .logo-header-popup {
            width: 120px;
            height: 80px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .logo-header-popup img {
            width: 80px;
            height: 80px;
            object-fit: contain;
            filter: brightness(0);

        }

        .input-search-popup {
            border: none;
            background-color: transparent;

        }


        .input-search-popup::placeholder {
            color: #000;
            font-size: 18px;

        }

        .input-search-popup:focus {
            outline: none;
        }

        .form-search-popup i {
            color: #000;
            font-size: 24px;
        }

        .form-search-popup {
            border-bottom: 1px solid #000;
            height: 35px;
            width: 350px;
        }

        .type-tshirt-popup {
            background: #fff;
            width: 700px;
            height: 300px;
            display: flex;
            position: absolute;
            top: 90px;
            left: 120px;
        }

        .type-tshirt-popup ul {
            display: flex;
            flex-direction: column;
            gap: 30px;
            padding-left: 10px;
        }

        .type-tshirt-popup ul li {
            list-style-type: none;
        }

        .type-tshirt-popup ul li a {
            text-decoration: none;
            color: #666666;
            font-size: 16px;
            font-weight: 700;
        }

        .img-type-tshirt-popup {
            object-fit: contain;
        }

        .img-type-tshirt-popup img {
            width: 158px;
            object-fit: contain;
        }


        .type-tshirt-popup > .img-type-tshirt-popup {
            display: flex;
            flex-direction: row;
        }

        .border-bottom-menu-popup {
            border-bottom: 2px solid black;
        }

        .display-none {
            display: none;
        }

        .header-popup,
        .type-tshirt-popup {
            display: none;
        }


        /* Start Login */
        .wrapper-login {
            width: 100%;
            height: 746px;
            display: flex;
            justify-content: end;
            align-items: center;
            position: relative;
            /* Để điều chỉnh vị trí */
            left: -10%;
            /* Đặt vị trí bên ngoài khung nhìn (bên trái) */
            opacity: 0;
            /* Ẩn phần tử lúc đầu */
        }

        .login {
            width: 500px;
            height: 100%;
            background: #fff;
            border-radius: 8px;
            opacity: 0.8;
        }

        .logo-login img {
            filter: brightness(0);
            width: 80px;
            height: 80px;
            padding-left: 10px;
        }

        .text-welcome p {
            color: #333;
            text-align: center;
            font-family: Poppins;
            font-size: 32px;
            font-style: normal;
            font-weight: 800;
            line-height: normal;
            margin: 0;
            display: flex;
            padding-left: 10px;
        }

        .text-welcome p:nth-child(2) {
            color: #666;

            font-family: var(--main-font);
            font-size: 16px;
            font-style: normal;
            font-weight: 500;
            line-height: normal;
        }

        .login form {
            margin-top: 50px;
            display: flex;
            flex-direction: column;
            padding: 0 20px;
            align-items: center;
        }

        .login form input {
            border-radius: 15px;
            height: 40px;
            width: 100%;

        }

        .login form input:nth-child(1) {

            margin-bottom: 20px;
        }

        .login form input::placeholder {
            color: #000;
            font-family: Poppins;
            padding-left: 10px;
        }

        .login form .button-dang-nhap {
            border-radius: 8px;
            height: 50px;
            width: 150px;
            font-weight: 500;
        }

        .text-or {
            margin-top: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .text-or .line-left {
            width: 200px;
            margin: 0;
            background-color: #666;
            height: 1.5px;
            margin-left: 10px;
        }

        .text-or .line-right {
            width: 200px;
            margin: 0;
            background-color: #666;
            height: 1.5px;
            margin-right: 10px;
        }

        .text-or p {
            font-family: Poppins;
            margin: 0;
            font-size: 16px;
        }

        .login-by-facebook-google {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            margin-top: 20px;
            gap: 20px;
        }

        .button-login-by-facebook {
            border: 1.5px solid #000;
            border-radius: 8px;
            display: flex;
            justify-content: center;
            width: 60%;
        }

        .button-login-by-facebook {
            display: flex;
            flex-direction: row;
            align-items: center;
            text-decoration: none;
            color: #000;
            font-family: Poppins;
        }


        .button-login-by-facebook img {
            max-width: 40px;
            max-height: 40px;
            margin: 5px 0;

        }

        .button-login-by-google {
            border: 1.5px solid #000;
            border-radius: 8px;
            display: flex;
            justify-content: center;
            width: 60%;
        }

        .button-login-by-google {
            display: flex;
            flex-direction: row;
            align-items: center;
            text-decoration: none;
            color: #000;
            font-family: Poppins;
        }

        .button-login-by-google img {
            max-width: 40px;
            max-height: 40px;
            margin: 5px 0;

        }

        .forgot-password {
            text-decoration: none;
            color: #666;
            padding-left: 339px;
            font-weight: 400;
        }

        .change-page-register {
            padding-top: 20px;
            display: flex;
            justify-content: center;

        }

        .change-page-register a {
            text-decoration: none;
            color: #666;
        }

        /* End Login */

        /* Start Register */
        .wrapper-register {
            width: 100%;
            height: 746px;
            display: flex;
            justify-content: end;
            align-items: center;
            position: relative;
            /* Để điều chỉnh vị trí */
            left: -10%;
            /* Đặt vị trí bên ngoài khung nhìn (bên trái) */
            opacity: 0;
            /* Ẩn phần tử lúc đầu */
        }

        .register {
            width: 500px;
            height: 100%;
            background: #fff;
            border-radius: 8px;
            opacity: 0.8;
        }

        .logo-register img {
            filter: brightness(0);
            width: 80px;
            height: 80px;
            padding-left: 10px;
        }

        .register form {
            margin-top: 30px;
            display: flex;
            flex-direction: column;
            padding: 0 20px;
            align-items: center;
        }

        .register form input {
            border-radius: 15px;
            height: 40px;
            width: 100%;

        }

        .register form input:nth-child(1) {

            margin-bottom: 20px;
        }

        .register form input::placeholder {
            color: #000;
            font-family: Poppins;
            padding-left: 10px;
        }

        .register form .button-dang-ky {
            border-radius: 8px;
            height: 50px;
            width: 150px;
            font-weight: 500;
        }


        .register-by-facebook-google {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            margin-top: 20px;
            gap: 20px;
        }

        .button-register-by-facebook {
            border: 1.5px solid #000;
            border-radius: 8px;
            display: flex;
            justify-content: center;
            width: 60%;
        }

        .button-register-by-facebook {
            display: flex;
            flex-direction: row;
            align-items: center;
            text-decoration: none;
            color: #000;
            font-family: Poppins;
        }


        .button-register-by-facebook img {
            max-width: 40px;
            max-height: 40px;
            margin: 5px 0;

        }

        .button-register-by-google {
            border: 1.5px solid #000;
            border-radius: 8px;
            display: flex;
            justify-content: center;
            width: 60%;
        }

        .button-register-by-google {
            display: flex;
            flex-direction: row;
            align-items: center;
            text-decoration: none;
            color: #000;
            font-family: Poppins;
        }

        .button-register-by-google img {
            max-width: 40px;
            max-height: 40px;
            margin: 5px 0;

        }

        .change-page-login {
            padding-top: 20px;
            display: flex;
            justify-content: center;

        }

        .change-page-login a {
            text-decoration: none;
            color: #666;
        }


        /* End Register */
        body {
            font-family: Arial, sans-serif;
        }
        .breadcrumb {
            background-color: transparent;
            padding: 0;
        }
        .home{
            text-decoration: none;
            color: black;
        }
        .breadcrumb-item + .breadcrumb-item::before {
            content: '|';
        }
        .product-card {
            border: none;
        }
        .product-card img {
            width: 100%;
            height: auto;

        }
        .product-info {
            text-align: center;
            padding: 10px 0;
        }
        .product-info .price {
            font-weight: bold;
        }
        .product-info .colors img {
            width: 25px;
            height: 25px;
            margin: 0 2px;
            border: 1px solid #cec5c8;
            border-radius: 100px;
        }
        .product-actions {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
        }
        .product-actions button {
            width: 48%;
        }
        .color-box {
            width: 30px;
            height: 30px;
            margin: 5px;
            position: relative;
        }
        /* Ẩn checkbox */
        .color-checkbox {
            opacity: 0;
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            cursor: pointer;
        }
        /* Khi checkbox được chọn, thêm border cho color box */
        .color-checkbox:checked + .color-box {
            border: 3px solid #000;
        }

        .nav-item:hover .dropdown-menu {
            display: block;
            margin-top: 0; /* Giảm khoảng cách khi hover */
        }
        .filters {
            margin-top: 20px;
        }
        .filters .dropdown {
            margin-right: 20px;
        }
        .sort-by {
            text-align: right;
        }
        .sort-container {
            display: flex;
            align-items: center;
            margin: 20px;
            margin-left: auto;
        }
        .sort-label {
            font-size: 16px;
            font-weight: bold;

        }
        .dropdown-menu {
            min-width: 150px;
        }
        .dropdown-item.active {
            background-color: #007bff;
            color: white;
        }
        .btn{
            margin-right: 15px;
        }
        .mt-text{
            width: 100px;
            margin-right: 15px;
            margin-bottom: 0px;
        }
        .form-select{
            border: none;
            padding: 0;
            width: 120px;
        }

        .col-md-3 .product-actions {
            opacity: 0;
            visibility: hidden;
            transition: opacity 0.3s ease, visibility 0.3s ease;
        }

        .col-md-3:hover .product-actions {
            opacity: 1;
            visibility: visible;
        }

        .product-actions .btn {
            margin-top: 10px;
            display: block;
        }

    </style>
</head>
<body>
<header>
    <div class="wrapper">
        <div class="header d-flex"
             style="box-shadow: 0px 5px 10px rgba(0, 0, 0, 0.1);padding: 10px 0px;gap: 382px;justify-content: space-between;z-index: 5;">
            <div class="icon-bar" style="display: flex;
        flex-direction: column;
        justify-content: center;
        font-size: 35px;
        padding-left: 10px;">
                <i class="fa-solid fa-bars d-flex"></i>
            </div>

            <div class="logo-and-search d-flex" style="gap: 164px;">
                <div class="logo-header-popup">
                    <a href="/t-shirt-luxury/trang-chu">
                        <img src="../images/logo.png" alt="">
                    </a>
                </div>
                <div class="search-favourite-cart-popup" style="margin-left: 0;">
                    <form action="" class="form-search-popup">
                        <i class="fa-solid fa-magnifying-glass"></i>
                        <input class="input-search-popup" type="text" name="" id="" placeholder="Tìm kiếm">
                    </form>
                    <a href="#">
                        <i class="fa-regular fa-user ps-5"></i>
                    </a>
                    <a href="#">
                        <i class="fa-regular fa-heart ps-5"></i>
                    </a>
                    <a href="#">
                        <i class="fa-solid fa-cart-shopping ps-5 pe-3"></i>
                    </a>

                </div>
            </div>

            <div class="type-tshirt-popup">
                <ul>
                    <li>
                        <a href="#" class="name-type-tshirt-popup">Áo phông Boxy</a>
                    </li>
                    <li>
                        <a href="#" class="name-type-tshirt-popup">Áo phông cổ chữ V</a>
                    </li>

                    <li>
                        <a href="#" class="name-type-tshirt-popup ">Áo phông cổ tròn</a>
                    </li>

                    <li>
                        <a href="#" class="name-type-tshirt-popup ">Áo phông Oversize</a>
                    </li>
                    <li>

                        <a href="#" class="name-type-tshirt-popup ">Áo phông Polo</a>
                    </li>
                    <li>

                        <a href="#" class="name-type-tshirt-popup">Áo phông Unisex</a>
                    </li>
                </ul>
                <ul class="img-type-tshirt-popup">
                    <img src="./images/pink.webp" alt="">
                    <img src="./images/brow.webp" alt="">
                    <img src="./images/black.webp" alt="">

                </ul>
            </div>
        </div>
        <div class="header-popup" style="box-shadow: 0px 5px 10px rgba(0, 0, 0, 0.1);">
            <div class="logo-header-popup">
                <a href="/t-shirt-luxury/trang-chu">
                    <img src="../images/logo.png" alt="">
                </a>
            </div>
            <ul class="menu-popup">
                <li class="item-danh-muc"><a href="#" class="name-danh-muc-popup ">Áo Nam
                </a>
                </li>
                <li class="item-danh-muc"><a href="#" class="name-danh-muc-popup">Quần Nam</a></li>
                <li><a href="#" class="name-danh-muc-popup">Phụ kiện</a></li>
                <li><a href="#" class="name-danh-muc-popup">Album</a></li>
                <li><a href="#" class="name-danh-muc-popup">Tin tức</a></li>
            </ul>
            <div class="search-favourite-cart-popup">
                <form action="" class="form-search-popup">
                    <i class="fa-solid fa-magnifying-glass"></i>
                    <input class="input-search-popup" type="text" name="" id="3" placeholder="Tìm kiếm">
                </form>
                <a href="#">
                    <i class="fa-regular fa-user ps-5"></i>
                </a>
                <a href="#">
                    <i class="fa-regular fa-heart ps-5"></i>
                </a>
                <a href="#">
                    <i class="fa-solid fa-cart-shopping ps-5 pe-3"></i>
                </a>

            </div>
            <div class="type-tshirt-popup" style="display: none;">
                <ul>
                    <li>
                        <a href="#" class="name-type-tshirt-popup">Áo phông Boxy</a>
                    </li>
                    <li>
                        <a href="#" class="name-type-tshirt-popup">Áo phông cổ chữ V</a>
                    </li>

                    <li>
                        <a href="#" class="name-type-tshirt-popup ">Áo phông cổ tròn</a>
                    </li>

                    <li>
                        <a href="#" class="name-type-tshirt-popup ">Áo phông Oversize</a>
                    </li>
                    <li>

                        <a href="#" class="name-type-tshirt-popup ">Áo phông Polo</a>
                    </li>
                    <li>

                        <a href="#" class="name-type-tshirt-popup">Áo phông Unisex</a>
                    </li>
                </ul>
                <ul class="img-type-tshirt-popup">
                    <img src="./images/pink.webp" alt="">
                    <img src="./images/brow.webp" alt="">
                    <img src="./images/black.webp" alt="">

                </ul>
            </div>
        </div>
        <div class="danh-muc-page-ctsp"
             style="display: none;position: absolute;background-color: #ffff;top:0;z-index: 6;">
            <ul>
                <li class="item-danh-muc-ctsp" style="border-right: 1px solid #000; padding:0 10px;">
                    <a href="#" class="ten-danh-muc hover-change-color">Áo Nam
                    </a>
                </li>
                <li class="item-danh-muc-ctsp"><a href="#" class="ten-danh-muc hover-change-color"
                                                  style="border-right: 1px solid #000; padding:0 10px;">Quần Nam </a></li>
                <li><a href="#" class="ten-danh-muc hover-change-color"
                       style="border-right: 1px solid #000; padding:0 10px;">Phụ kiện </a></li>
            </ul>
            <ul id="type-tshirt">
                <li>
                    <a href="#" class="name-type hover-change-color">Áo phông Boxy</a>
                </li>
                <li>
                    <a href="#" class="name-type hover-change-color">Áo phông cổ chữ V</a>
                </li>

                <li>
                    <a href="#" class="name-type hover-change-color">Áo phông cổ tròn</a>
                </li>

                <li>
                    <a href="#" class="name-type hover-change-color">Áo phông Oversize</a>
                </li>
                <li>

                    <a href="#" class="name-type hover-change-color">Áo phông Polo</a>
                </li>
                <li>

                    <a href="#" class="name-type hover-change-color">Áo phông Unisex</a>
                </li>
                <ul class="login-and-signin">
                    <i class="fa-regular fa-user pe-3"></i>
                    <li class="button-login pe-3"><a href="#" class="ten-danh-muc hover-change-color">ĐĂNG NHẬP</a>
                    </li>
                    <li class="button-sign-in"><a href="#" class="ten-danh-muc hover-change-color">ĐĂNG KÝ</a>
                    </li>
                </ul>
            </ul>

        </div>
    </div>
</header>

<div class="container">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a class="home" href="#"><i class="fas fa-home"></i> Trang chủ</a></li>
            <li class="breadcrumb-item active" aria-current="page">Áo Nam</li>
        </ol>
    </nav>
    <h1 class="mt-3">Áo Nam</h1>

    <nav class="navbar navbar-expand-lg ">
        <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
            <h4 class="mt-text">Bộ Lọc</h4>
            <ul class="navbar-nav">
                <li class="nav-item dropdown">
                    <button class="btn btn-light dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" aria-expanded="false">
                        Màu Sắc
                    </button>
                    <ul class="dropdown-menu p-3" aria-labelledby="dropdownMenuButton1">
                        <div class="d-flex flex-wrap">
                            <label>
                                <input type="checkbox" class="color-checkbox" id="colorRed">
                                <div class="color-box" style="background-color: red;"></div>
                            </label>
                            <label>
                                <input type="checkbox" class="color-checkbox" id="colorBrown">
                                <div class="color-box" style="background-color: brown;"></div>
                            </label>
                            <label>
                                <input type="checkbox" class="color-checkbox" id="colorPink">
                                <div class="color-box" style="background-color: pink;"></div>
                            </label>
                            <label>
                                <input type="checkbox" class="color-checkbox" id="colorBlack">
                                <div class="color-box" style="background-color: black;"></div>
                            </label>
                            <label>
                                <input type="checkbox" class="color-checkbox" id="colorBlue">
                                <div class="color-box" style="background-color: blue;"></div>
                            </label>
                            <label>
                                <input type="checkbox" class="color-checkbox" id="colorYellow">
                                <div class="color-box" style="background-color: yellow;"></div>
                            </label>
                        </div>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <button class="btn btn-light dropdown-toggle" href="#" id="2" role="button" aria-expanded="false">
                        Kích Cỡ
                    </button>
                    <ul class="dropdown-menu p-3" aria-labelledby="dropdownMenuButton2">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="sizeS">
                            <label class="form-check-label" for="sizeS">S</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="sizeM">
                            <label class="form-check-label" for="sizeM">M</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="sizeL">
                            <label class="form-check-label" for="sizeL">L</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="sizeXL">
                            <label class="form-check-label" for="sizeXL">XL</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="size2XL">
                            <label class="form-check-label" for="size2XL">2XL</label>
                        </div>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <button class="btn btn-light dropdown-toggle" href="#" id="1" role="button" aria-expanded="false">
                        Khoảng Giá
                    </button>
                    <ul class="dropdown-menu p-3" aria-labelledby="dropdownMenuButton3">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="price1">
                            <label class="form-check-label" for="price1">Dưới 200,000</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="price2">
                            <label class="form-check-label" for="price2">Từ 200,000 - 500,000</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="price3">
                            <label class="form-check-label" for="price3">Từ 500,000 - 1,000,000</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="price4">
                            <label class="form-check-label" for="price4">Trên 1,000,000</label>
                        </div>
                    </ul>
                </li>
            </ul>

            <div class="sort-container">
                <span class="sort-label">Sắp xếp theo:</span>
                <select class="form-select dropdown" aria-label="Default select example">
                    <option class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false" selected >Mới nhất</option>
                    <option class="dropdown-item" href="#" value="1">Mới nhất</option>
                    <option class="dropdown-item" href="#" value="2">Giá giảm dần</option>
                    <option class="dropdown-item" href="#" value="3"> Giá tăng dần</option>
                </select>
            </div>
        </div>
    </nav>

    <div class="row">
        <div class="col-md-3">
            <div class="card product-card">
                <img alt="Anh1" height="300" src="https://down-vn.img.susercontent.com/file/edcabcd4c07ac15f33f4a4d17306f5ac" width="600"/>
                <div class="product-info">
                    <div class="colors"><img alt="option 1" height="20" src="https://down-vn.img.susercontent.com/file/edcabcd4c07ac15f33f4a4d17306f5ac" width="20"/></div>
                    <p>Áo Phông Regular 1307</p>
                    <p class="price">249,000₫</p>
                </div>
                <div class="product-actions">
                    <button class="btn btn-dark"><i class="fas fa-shopping-cart"></i> Mua nhanh</button>
                    <button class="btn btn-outline-dark"><i class="fas fa-eye"></i> Xem chi tiết</button>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card product-card">
                <img alt="Anh2" height="300" src="https://bizweb.dktcdn.net/100/479/837/products/3atsm3033-43sas-n-1680148652272.jpg?v=1680148657547" width="600"/>
                <div class="product-info">
                    <div class="colors">
                        <img alt="option 2" height="20" src="https://bizweb.dktcdn.net/100/479/837/products/3atsm3033-43sas-n-1680148652272.jpg?v=1680148657547" width="20"/>
                    </div>
                    <p>Áo Nỉ Classic 4114</p>
                    <p class="price">419,000₫</p>
                </div>
                <div class="product-actions">
                    <button class="btn btn-dark"><i class="fas fa-shopping-cart"></i> Mua nhanh</button>
                    <button class="btn btn-outline-dark"><i class="fas fa-eye"></i> Xem chi tiết</button>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card product-card">
                <img alt="Anh3" height="300" src="https://bizweb.dktcdn.net/100/455/570/products/4b8e3b138e68262ba62abfc95f9e6d49-1662977549330.jpg?v=1662978195360.jpg" width="600"/>
                <div class="product-info">
                    <div class="colors"><img alt=" option 3" height="20" src="https://bizweb.dktcdn.net/100/455/570/products/4b8e3b138e68262ba62abfc95f9e6d49-1662977549330.jpg?v=1662978195360.jpg" width="20"/></div>
                    <p>Áo Phông Fitted 1298</p>
                    <p class="price">249,000₫</p>
                </div>
                <div class="product-actions">
                    <button class="btn btn-dark"><i class="fas fa-shopping-cart"></i> Mua nhanh</button>
                    <button class="btn btn-outline-dark"><i class="fas fa-eye"></i> Xem chi tiết</button>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card product-card">
                <img alt="Anh4" height="300" src="https://product.hstatic.net/200000551971/product/am-nu-form-rong-tay-lo-co-tron-mau-den-trang-xanh-goi-thanh-bo-hoa__3__8ed9bb6eeb6d42e99725e3a9363ea91a_grande.jpg" width="600"/>
                <div class="product-info">
                    <div class="colors"><img alt=" option 4" height="20" src="https://product.hstatic.net/200000551971/product/am-nu-form-rong-tay-lo-co-tron-mau-den-trang-xanh-goi-thanh-bo-hoa__3__8ed9bb6eeb6d42e99725e3a9363ea91a_grande.jpg" width="20"/></div>
                    <p>Áo Khoác Kaki Regular 5106</p>
                    <p class="price">639,000₫</p>
                </div>
                <div class="product-actions">
                    <button class="btn btn-dark"><i class="fas fa-shopping-cart"></i> Mua nhanh</button>
                    <button class="btn btn-outline-dark"><i class="fas fa-eye"></i> Xem chi tiết</button>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card product-card">
                <img alt="Anh5" height="300" src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiDbn_Uhhmub0J_xgK9s9tAYSbs6u1YXSJeZhNk0pnquLHoLxlsydC7-V6fg3yDX2pSfIO6H4NUjk7Rw7iUQ8VOFWN-0e6xYC_NZoX9rbFSKHwRzjKvjgtWxImTjHvAzE18HDVeoHyoGsMsH1STCJxU99gLpPGzmE_Of-UKaEzZ2JEqFnkQ0k48ARXDL54/w640-h640/ao%20phong%20dong%20phuc%20dep.jpg" width="600"/>
                <div class="product-info">
                    <div class="colors"><img alt=" option 5" height="20" src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiDbn_Uhhmub0J_xgK9s9tAYSbs6u1YXSJeZhNk0pnquLHoLxlsydC7-V6fg3yDX2pSfIO6H4NUjk7Rw7iUQ8VOFWN-0e6xYC_NZoX9rbFSKHwRzjKvjgtWxImTjHvAzE18HDVeoHyoGsMsH1STCJxU99gLpPGzmE_Of-UKaEzZ2JEqFnkQ0k48ARXDL54/w640-h640/ao%20phong%20dong%20phuc%20dep.jpg" width="20"/></div>
                    <p>Áo Khoác Kaki Regular 5106</p>
                    <p class="price">639,000₫</p>
                </div>
                <div class="product-actions">
                    <button class="btn btn-dark"><i class="fas fa-shopping-cart"></i> Mua nhanh</button>
                    <button class="btn btn-outline-dark"><i class="fas fa-eye"></i> Xem chi tiết</button>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card product-card">
                <img alt="Anh6" height="300" src="https://bizweb.dktcdn.net/100/497/316/products/ao-thun-local-brand-mau-den.jpg?v=1704517038750" width="600"/>
                <div class="product-info">
                    <div class="colors"><img alt="option 6" height="20" src="https://bizweb.dktcdn.net/100/497/316/products/ao-thun-local-brand-mau-den.jpg?v=1704517038750" width="20"/> </div>
                    <p>Áo Khoác Kaki Regular 5106</p>
                    <p class="price">639,000₫</p>
                </div>
                <div class="product-actions">
                    <button class="btn btn-dark"><i class="fas fa-shopping-cart"></i> Mua nhanh</button>
                    <button class="btn btn-outline-dark"><i class="fas fa-eye"></i> Xem chi tiết</button>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card product-card">
                <img alt="Anh7" height="300" src="https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lu0de2xud5w117" width="600"/>
                <div class="product-info">
                    <div class="colors"><img alt="option 7" height="20" src="https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lu0de2xud5w117" width="20"/></div>
                    <p>Áo Khoác Kaki Regular 5106</p>
                    <p class="price">639,000₫</p>
                </div>
                <div class="product-actions">
                    <button class="btn btn-dark"><i class="fas fa-shopping-cart"></i> Mua nhanh</button>
                    <button class="btn btn-outline-dark"><i class="fas fa-eye"></i> Xem chi tiết</button>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card product-card">
                <img alt="Anh8" height="300" src="https://bizweb.dktcdn.net/100/315/239/products/z5616034506590-05018cf67af615f9156996af8fff713b-1720509041934.jpg?v=1721867893567" width="600"/>
                <div class="product-info">
                    <div class="colors"><img alt="option 8" height="20" src="https://bizweb.dktcdn.net/100/315/239/products/z5616034506590-05018cf67af615f9156996af8fff713b-1720509041934.jpg?v=1721867893567" width="20"/></div>
                    <p>Áo Khoác Kaki Regular 5106</p>
                    <p class="price"> 639,000₫</p>
                </div>
                <div class="product-actions">
                    <button class="btn btn-dark"><i class="fas fa-shopping-cart"></i> Mua nhanh</button>
                    <button class="btn btn-outline-dark"><i class="fas fa-eye"></i> Xem chi tiết</button>
                </div>
            </div>
        </div></div>

        <div class="row mt-5" style="padding-left:2rem">
            <img src="https://pos.nvncdn.com/be3159-662/bn/20240921_h3xCoY0r.gif" alt="">
        </div>


        <footer class="py-5">
            <div class="row">
                <div class="col-6 col-md-2 mb-3">
                    <h5 style="font-size: 14px;">VỀ CHÚNG TÔI</h5>
                    <ul class="nav flex-column mt-4">
                        <li class="nav-item mb-2">
                            <h6 class="" style="font-size: 14px;">Công ty TNHH T-Shirt LUXURY Việt
                                Nam</h6>
                        </li>
                        <li class="nav-item mb-2">
                            <h6 class="" style="font-size: 14px;">Địa chỉ: </h6>
                            Số 344 Cầu Giấy, Phường Dịch Vọng, Quận Cầu
                            Giấy, Thành phố Hà Nội
                        </li>

                        <li class="nav-item mb-2">
                            <h6 class="" style="font-size: 14px;">Mã số doanh nghiệp:</h6>
                            9999999999 do Sở kế hoạch và đầu
                            tư thành phố Hà Nội cấp ngày 17/09/2019
                        </li>

                        <li class="nav-item mb-2">
                            <h6 class="" style="font-size: 14px;">Điện thoại:</h6> 0982.022.969
                        </li>
                        <li class="nav-item mb-2">
                            <img src="https://krik.vn/img/bocongthuong.png" width="200px" alt="">
                        </li>
                    </ul>
                </div>

                <div class="col-6 col-md-2 mb-3">
                    <h5 style="font-size: 14px;">CHÍNH SÁCH VÀ QUY ĐỊNH</h5>
                    <ul class="nav flex-column mt-4 ">
                        <li class="nav-item mb-2">
                            <a href="#" class="text-dark" style="text-decoration: none; font-size: 15px;">Cách thức
                                đặt hàng</a>
                        </li>

                        <li class="nav-item mb-2 mt-2">
                            <a href="#" class="text-dark" style="text-decoration: none; font-size: 15px;">Chính sách
                                thành viên</a>
                        </li>

                        <li class="nav-item mb-2 mt-2">
                            <a href="#" class="text-dark" style="text-decoration: none; font-size: 15px;">Chính sách
                                giao hàng</a>
                        </li>

                        <li class="nav-item mb-2 mt-2">
                            <a href="#" class="text-dark" style="text-decoration: none; font-size: 15px;">Quy định đổi
                                trả</a>
                        </li>

                        <li class="nav-item mb-2 mt-2">
                            <a href="#" class="text-dark" style="text-decoration: none; font-size: 15px;">Hình thức
                                thanh toán</a>
                        </li>

                        <li class="nav-item mb-2 mt-2">
                            <a href="#" class="text-dark" style="text-decoration: none; font-size: 15px;">Chính sách bảo
                                mật</a>
                        </li>

                        <li class="nav-item mb-2 mt-2">
                            <a href="#" class="text-dark" style="text-decoration: none; font-size: 15px;">Chính sách xử
                                lý khiếu nại</a>
                        </li>

                        <li class="nav-item mb-2 mt-2">
                            <a href="#" class="text-dark" style="text-decoration: none; font-size: 15px;">Chính sách
                                kiểm hàng</a>
                        </li>
                    </ul>
                </div>

                <div class="col-6 col-md-3 mb-3">
                    <h5 style="font-size: 14px;">HỆ THỐNG CỬA HÀNG</h5>
                    <ul class="nav flex-column">
                        <li class="nav-item mb-2">
                            <h6 class="" style="font-size: 14px;"> <i class="fa-solid fa-caret-right"></i> CỬA HÀNG SỐ
                                99
                            </h6>
                            <p>168 Hoàng Văn Thụ, Phường Hoàng Văn Thụ, TP.Bắc Giang</p>
                            <p>Tel: 0348.600.168</p>
                        </li>

                        <li class="nav-item mb-2">
                            <h6 class="" style="font-size: 14px;"> <i class="fa-solid fa-caret-right"></i> CỬA HÀNG SỐ
                                88
                            </h6>
                            <p>1239 Giải Phóng, Phường Thịnh Liệt, Quận Hai Bà Trưng, TP Hà Nội</p>
                            <p>Tel: 0375.88.1239</p>
                        </li>
                        <li class="nav-item mb-2">
                            <h6 class="" style="font-size: 14px;"> <i class="fa-solid fa-caret-right"></i> XEM THÊM TOÀN
                                BỘ CỬA HÀNG
                            </h6>
                        </li>
                    </ul>
                </div>

                <div class="col-md-5 mb-3">
                    <form>
                        <h5>Subscribe to our newsletter</h5>
                        <p>Monthly digest of what's new and exciting from us.</p>
                        <div class="d-flex flex-column flex-sm-row w-100 gap-2">
                            <label for="newsletter1" class="visually-hidden">Email address</label>
                            <input id="newsletter1" type="text" class="form-control" placeholder="Email address">
                            <button class="btn btn-primary" type="button">Subscribe</button>
                        </div>
                    </form>
                </div>
            </div>

            <div class="d-flex flex-column flex-sm-row justify-content-between py-4 my-4 border-top">
                <p>© 2024 T-Shirt LUXURY, Inc. All rights reserved.</p>
                <ul class="list-unstyled d-flex">
                    <li class="ms-3"><a class="link-body-emphasis" href="#"><svg class="bi" width="24" height="24">
                        <use xlink:href="#twitter"></use>
                    </svg></a></li>
                    <li class="ms-3"><a class="link-body-emphasis" href="#"><svg class="bi" width="24" height="24">
                        <use xlink:href="#instagram"></use>
                    </svg></a></li>
                    <li class="ms-3"><a class="link-body-emphasis" href="#"><svg class="bi" width="24" height="24">
                        <use xlink:href="#facebook"></use>
                    </svg></a></li>
                </ul>
            </div>
        </footer>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous">
</script>
<script>
    $(document).ready(function () {
        // Event Onload Window
        $(window).on("load", function () {
            $(".wrapper-login").animate(
                {
                    left: "0", // Di chuyển về vị trí ban đầu
                    opacity: 1, // Hiển thị dần
                },
                1000
            );
            $(".wrapper-register").animate(
                {
                    left: "0", // Di chuyển về vị trí ban đầu
                    opacity: 1, // Hiển thị dần
                },
                1000
            );
        });
        $(".danh-muc").mouseenter(function () {
            $(".danh-muc").addClass("bg-white");
            $(".hover-change-color").css("color", "#000");
            $(".item-danh-muc").css("border-right", "0.5px solid #000");
            $(".button-login").css("border-right", "0.5px solid #000");
            $(".button-login").css("padding-bottom", "0px");

            $(".login-and-signin").show();
        });
        $(".danh-muc").mouseleave(function () {
            $(".danh-muc").removeClass("bg-white");
            $(".hover-change-color").css("color", "#fff");
            $(".item-danh-muc").css("border-right", "0.5px solid #fff");
            $(".button-login").css("border-right", "0.5px solid #fff");

            $(".login-and-signin").hide();
        });

        // Vô hiệu hoá scroll
        function disableScroll() {
            $("body").css("overflow", "hidden");
        }

        // Kích hoạt lại scroll
        function enableScroll() {
            $("body").css("overflow", "auto");
        }

        // Khi mouseenter vào div, vô hiệu hoá scroll
        $(".danh-muc").mouseenter(function () {
            disableScroll();
        });

        // Khi mouseleave khỏi div, kích hoạt lại scroll
        $(".danh-muc").mouseleave(function () {
            enableScroll();
        });

        $(window).scroll(function () {
            // Code thực thi khi có sự kiện scroll
            var scrollTop = $(this).scrollTop();

            if (scrollTop == 0) {
                $(".header-popup").hide();
                $(".danh-muc").show();
                $(".logo-header").show();
                $(".search-favourite-cart").show();
            } else if (scrollTop >= 100) {
                $(".header-popup").fadeIn(500);
                $(".header-popup").removeClass("display-hidden");
                $(".header-popup").css("position", "fixed");
                $(".header-popup").css("display", "flex");
                $(".danh-muc").hide();
                $(".logo-header").hide();
                $(".search-favourite-cart").hide();
            }
        });

        $(".name-type-tshirt-popup").mouseenter(function () {
            $(this).addClass("text-black");
        });
        $(".name-type-tshirt-popup").mouseleave(function () {
            $(this).removeClass("text-black");
        });
        //Mouseenter Type Tshirt Popup

        // Hiển thị popup khi di chuột vào danh mục
        $(".name-danh-muc-popup").mouseenter(function () {
            $(".type-tshirt-popup").fadeIn(500);
            $(this).addClass("border-bottom-menu-popup");
            $(".type-tshirt-popup").css("display", "flex");
        });

        // Ẩn popup khi chuột rời khỏi cả hai phần tử
        $(".name-danh-muc-popup, .type-tshirt-popup").mouseleave(function () {
            $(".type-tshirt-popup").fadeOut(100);
            $(this).removeClass("border-bottom-menu-popup");
        });

        // Ghi lại sự kiện mouseenter cho popup
        $(".type-tshirt-popup").mouseenter(function () {
            $(this).stop(true, true).show(); // Dừng hiệu ứng fadeOut nếu đang diễn ra
        });

        //Start Page Login
        $("input")
            .focus(function () {
                $(this).data("placeholder", $(this).attr("placeholder")); // Lưu placeholder ban đầu
                $(this).attr("placeholder", ""); // Xóa placeholder khi focus
                $(this).css("outline", "none");
            })
            .blur(function () {
                // Khôi phục placeholder khi blur
                $(this).attr("placeholder", $(this).data("placeholder"));
            });

        $(".button-dang-nhap").mouseenter(function () {
            $(this).css("background-color", "#000");
            $(this).css("color", "#ffff");
        });
        $(".button-dang-nhap").mouseleave(function () {
            $(this).css("background-color", "#fff");
            $(this).css("color", "#000");
        });

        $(".forgot-password").mouseenter(function () {
            $(this).css("color", "#000");
        });
        $(".forgot-password").mouseleave(function () {
            $(this).css("color", "#666");
        });

        $(".change-page-register").mouseenter(function () {
            $(".link-page-register").css("color", "#000");
        });
        $(".change-page-register").mouseleave(function () {
            $(".link-page-register").css("color", "#666");
        });
        //End Page Login

        //Start Page Register
        $(".button-dang-ky").mouseenter(function () {
            $(this).css("background-color", "#000");
            $(this).css("color", "#ffff");
        });
        $(".button-dang-ky").mouseleave(function () {
            $(this).css("background-color", "#fff");
            $(this).css("color", "#000");
        });
        $(".change-page-login").mouseenter(function () {
            $(".link-page-login").css("color", "#000");
        });
        $(".change-page-login").mouseleave(function () {
            $(".link-page-login").css("color", "#666");
        });
        //End Page Register
    });





</script>
</body>
</html>