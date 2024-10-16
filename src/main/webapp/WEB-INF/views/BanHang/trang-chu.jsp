<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>T-SHIRT LUXURY</title>
    <link rel="stylesheet" href="../css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          inegrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
    <link rel="shortcut icon" href="../images/favicon.png" type="image/x-icon">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="../js/script.js"></script>
</head>

<body>

<!-- Start Header -->
<header>
    <div class="wrapper">
        <img class="banner-top" src="../images/banner/banner1.jpg" alt="T-shirt Luxury">
        <div class="side-bar">
            <div class="header-popup ">
                <div class="logo-header-popup">
                    <a href="#">
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
                        <img src="../images/ao_phong_unisex/LABUBU/pink.webp" alt="">
                        <img src="../images/ao_phong_oversize/DREW/brow.webp" alt="">
                        <img src="../images/ao_phong_polo/LazyCityCycle/black.webp" alt="">

                    </ul>
                </div>
            </div>

            <div class="danh-muc">
                <ul>
                    <li class="item-danh-muc"><a href="#" class="ten-danh-muc hover-change-color">Áo Nam
                    </a>
                    </li>
                    <li class="item-danh-muc"><a href="#" class="ten-danh-muc hover-change-color">Quần Nam</a></li>
                    <li><a href="#" class="ten-danh-muc hover-change-color">Phụ kiện</a></li>
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
                        <i class="fa-regular fa-user"></i>
                        <li class="button-login"><a href="/t-shirt-luxury/login" class="ten-danh-muc hover-change-color">ĐĂNG NHẬP</a>
                        </li>
                        <li class="button-sign-in"><a href="/t-shirt-luxury/register" class="ten-danh-muc hover-change-color">ĐĂNG KÝ</a>
                        </li>
                    </ul>
                </ul>

            </div>
            <div class="logo-header">
                <a href="#">
                    <img src="../images/logo.png" alt="">
                </a>
            </div>
            <div class="search-favourite-cart">
                <form action="" class="form-search">
                    <i class="fa-solid fa-magnifying-glass"></i>
                    <input class="input-search" type="text" name="" id="" placeholder="Tìm kiếm">
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


    </div>
</header>
<!-- End Header -->
<div class="container">
    <div class="text-center mt-5" style="padding-left:2rem">
        <H1 class="text-center " style="font-size: 30px;">SẢN PHẨM MỚI</H1>
    </div>

    <div class="row mt-5" style="padding-left:2rem">
        <div class="col-3">
            <div class="card" style="width: 18rem; border-style:none">
                <img src="../images/ao_phong_boxy/DEVOTUS/black.webp" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title text-center" style="font-size:13px">Áo Phông DEVOTUS</h5>
                    <p class="card-text fw-bold text-center" style="font-size: 14px;">449,000₫</p>

                    <div class="text-center" style="font-size:5px">
                        <a href="#" class="btn btn-outline-light">
                            <i class="fa-solid fa-cart-shopping"></i>Mua Nhanh</a>
                        <a href="/t-shirt-luxury/san-pham-chi-tiet" class="btn btn-outline-light">
                            <i class="fa-solid fa-eye"></i>Xem chi tiết</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-3">
            <div class="card" style="width: 18rem; border-style:none">
                <img src="../images/ao_phong_boxy/HEAVEN/red.webp" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title text-center" style="font-size:13px">Áo Phông HEAVEN</h5>
                    <p class="card-text fw-bold text-center" style="font-size: 14px;">449,000₫</p>
                    <div class="text-center" style="font-size:5px">
                        <a href="#" class="btn btn-outline-light">
                            <i class="fa-solid fa-cart-shopping"></i>Mua Nhanh</a>
                        <a href="#" class="btn btn-outline-light">
                            <i class="fa-solid fa-eye"></i>Xem chi tiết</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-3">
            <div class="card" style="width: 18rem; border-style:none">
                <img src="../images/ao_phong_oversize/BUNNY/gray.webp" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title text-center" style="font-size:13px">Áo Phông BUNNY</h5>
                    <p class="card-text fw-bold text-center" style="font-size: 14px;">449,000₫</p>
                    <div class="text-center" style="font-size:5px">
                        <a href="#" class="btn btn-outline-light">
                            <i class="fa-solid fa-cart-shopping"></i>Mua Nhanh</a>
                        <a href="#" class="btn btn-outline-light">
                            <i class="fa-solid fa-eye"></i>Xem chi tiết</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-3">
            <div class="card" style="width: 18rem; border-style:none">
                <img src="../images/ao_phong_boxy/NO-END/black.webp" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title text-center" style="font-size:13px">Áo Phông NO-END</h5>
                    <p class="card-text fw-bold text-center" style="font-size: 14px;">489,000₫</p>
                    <div class="text-center" style="font-size:5px">
                        <a href="#" class="btn btn-outline-light">
                            <i class="fa-solid fa-cart-shopping"></i>Mua Nhanh</a>
                        <a href="#" class="btn btn-outline-light">
                            <i class="fa-solid fa-eye"></i>Xem chi tiết</a>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <div class="text-center mt-4" style="padding-left:2rem">
        <button class="btn btn-outline-dark" type="submit">Xem Thêm</button>
    </div>

    <div class="text-center mt-5" style="padding-left:2rem">
        <H1 class="text-center" style="font-size: 30px;">SẢN PHẨM BÁN CHẠY</H1>
    </div>

    <div class="row mt-5" style="padding-left:2rem">
        <div class="col-3">
            <div class="card" style="width: 18rem; border-style:none">
                <img src="../images/ao_phong_unisex/1969/black.webp" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title text-center" style="font-size:13px">Áo Phông 1969</h5>
                    <p class="card-text fw-bold text-center" style="font-size: 14px;">449,000₫</p>
                    <div class="text-center" style="font-size:5px">
                        <a href="#" class="btn btn-outline-light">
                            <i class="fa-solid fa-cart-shopping"></i>Mua Nhanh</a>
                        <a href="#" class="btn btn-outline-light">
                            <i class="fa-solid fa-eye"></i>Xem chi tiết</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-3">
            <div class="card" style="width: 18rem; border-style:none">
                <img src="../images/ao_phong_unisex/Airplane/while.webp" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title text-center" style="font-size:13px">Áo Phông Airplane</h5>
                    <p class="card-text fw-bold text-center" style="font-size: 14px;">449,000₫</p>
                    <div class="text-center" style="font-size:5px">
                        <a href="#" class="btn btn-outline-light">
                            <i class="fa-solid fa-cart-shopping"></i>Mua Nhanh</a>
                        <a href="#" class="btn btn-outline-light">
                            <i class="fa-solid fa-eye"></i>Xem chi tiết</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-3">
            <div class="card" style="width: 18rem; border-style:none">
                <img src="../images/ao_phong_unisex/BACISTEE/green.webp" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title text-center" style="font-size:13px">Áo Phông BACISTEE</h5>
                    <p class="card-text fw-bold text-center" style="font-size: 14px;">499,000₫</p>
                    <div class="text-center" style="font-size:5px">
                        <a href="#" class="btn btn-outline-light">
                            <i class="fa-solid fa-cart-shopping"></i>Mua Nhanh</a>
                        <a href="#" class="btn btn-outline-light">
                            <i class="fa-solid fa-eye"></i>Xem chi tiết</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-3">
            <div class="card" style="width: 18rem; border-style:none">
                <img src="../images/ao_phong_unisex/SMILE/black.webp" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title text-center" style="font-size:13px">Áo Phông SMILE</h5>
                    <p class="card-text fw-bold text-center" style="font-size: 14px;">449,000₫</p>
                    <div class="text-center" style="font-size:5px">
                        <a href="#" class="btn btn-outline-light">
                            <i class="fa-solid fa-cart-shopping"></i>Mua Nhanh</a>
                        <a href="#" class="btn btn-outline-light">
                            <i class="fa-solid fa-eye"></i>Xem chi tiết</a>
                    </div>
                </div>
            </div>
        </div>


    </div>

    <div class="text-center mt-4" style="padding-left:2rem">
        <button class="btn btn-outline-dark" type="submit">Xem Thêm</button>
    </div>

    <div class="text-center mt-5" style="padding-left:2rem">
        <H1 class="text-center" style="font-size: 30px;">LOOK BOOK</H1>
    </div>

    <div class="row mt-5">
        <div class="col-3">
            <div class="card" style="width: 20rem; border-style:none">
                <img src="https://pos.nvncdn.com/be3159-662/album/20240921_YkGVFzOx.png" class="card-img-top"
                     alt="...">
                <div class="card-body">
                    <h5 class="card-title">
                        <a href="https://krik.vn/fw24-break-the-rules-memories-a13911.html"
                           style="text-decoration: none; font-size:15px" class="text-dark">
                            FW'24 | BREAK THE RULES - MEMORIES</a>
                    </h5>
                </div>
            </div>
        </div>

        <div class="col-3">
            <div class="card" style="width: 20rem; border-style:none">
                <img src="https://pos.nvncdn.com/be3159-662/album/20240921_uzIDfhjg.png" class="card-img-top"
                     alt="...">
                <div class="card-body">
                    <h5 class="card-title">
                        <a href="https://krik.vn/back-to-soul-a13910.html"
                           style="text-decoration: none; font-size:15px" class="text-dark">
                            BACK TO SOUL</a>
                    </h5>
                </div>
            </div>
        </div>

        <div class="col-3">
            <div class="card" style="width: 20rem; border-style:none">
                <img src="https://pos.nvncdn.com/be3159-662/album/20240921_HxgFOK74.png" class="card-img-top"
                     alt="...">
                <div class="card-body">
                    <h5 class="card-title">
                        <a href="https://krik.vn/summer-flavoer-a13909.html"
                           style="text-decoration: none; font-size:15px" class="text-dark">
                            SUMMER FLAVOER</a>
                    </h5>
                </div>
            </div>
        </div>

        <div class="col-3">
            <div class="card" style="width: 20rem; border-style:none">
                <img src="https://pos.nvncdn.com/be3159-662/album/20240716_pKFzptWA.jpeg" class="card-img-top"
                     alt="...">
                <div class="card-body">
                    <h5 class="card-title">
                        <a href="https://krik.vn/ss24-campaign-back-to-nature-a13730.html"
                           style="text-decoration: none; font-size:15px" class="text-dark">
                            SS'24 CAMPAIGN | BACK TO NATURE</a>
                    </h5>
                </div>
            </div>
        </div>



    </div>

    <div class="text-center mt-5" style="padding-left:2rem">
        <H1 class="text-center" style="font-size: 30px;">TIN TỨC</H1>
    </div>

    <div class="row mt-5" style="padding-left:2rem">
        <div class="col-3">
            <div class="card" style="width: 18rem; border-style:none">
                <img src="https://pos.nvncdn.com/be3159-662/art/20200512_tWsOvjK7GrEPGtWl7LHitQPc.png"
                     class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title" style="font-size: 17px;">Cách thức đặt hàng</h5>
                    <p class="card-text" style="text-align:justify">
                        Đặt hàng qua Hotline: Gọi trực tiếp đến sđt: 0982.022.969 để được nhân viên tư vấn hỗ trợ
                        nhanh nhất về sản phẩm và dịch vụ. Đặt ...
                    </p>
                    <div class="news-btn">
                        <a href="https://krik.vn/cach-thuc-dat-hang-n64984.html" style="text-decoration:none"
                           class="text-danger">Xem thêm</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-3">
            <div class="card" style="width: 18rem; border-style:none">
                <img src="https://pos.nvncdn.com/be3159-662/art/20191216_5ldS53UxoZILDHMoTXdsk99T.png"
                     class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title" style="font-size: 17px;">Chính sách thành viên</h5>
                    <p class="card-text" style="text-align:justify">
                        Đặt hàng qua Hotline: Gọi trực tiếp đến sđt: 0982.022.969 để được nhân viên tư vấn hỗ trợ
                        nhanh nhất về sản phẩm và dịch vụ.
                    </p>
                    <div class="news-btn">
                        <a href="https://krik.vn/chinh-sach-thanh-vien-n57337.html" style="text-decoration:none"
                           class="text-danger">Xem thêm</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-3">
            <div class="card" style="width: 18rem; border-style:none">
                <img src="https://pos.nvncdn.com/be3159-662/art/20200512_qxrfJ3E8NcHVwRABBl5dSRdT.png"
                     class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title" style="font-size: 17px;">Chính sách giao hàng</h5>
                    <p class="card-text" style="text-align:justify">
                        Đặt hàng qua Hotline: Gọi trực tiếp đến sđt: 0982.022.969 để được nhân viên tư vấn hỗ trợ
                        nhanh nhất về sản phẩm và dịch vụ.
                    </p>
                    <div class="news-btn">
                        <a href="https://krik.vn/chinh-sach-giao-hang-n64993.html" style="text-decoration:none"
                           class="text-danger">Xem thêm</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-3">
            <div class="card" style="width: 18rem; border-style:none">
                <img src="https://pos.nvncdn.com/be3159-662/art/20200512_Hm7q4j114CB308j4q47JCO0P.png"
                     class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title" style="font-size: 17px;">Chính sách đổi trả hàng</h5>
                    <p class="card-text" style="text-align:justify">
                        Đặt hàng qua Hotline: Gọi trực tiếp đến sđt: 0982.022.969 để được nhân viên tư vấn hỗ trợ
                        nhanh nhất về sản phẩm và dịch vụ.
                    </p>
                    <div class="news-btn">
                        <a href="https://krik.vn/chinh-sach-doi-tra-hang-n64995.html" style="text-decoration:none"
                           class="text-danger">Xem thêm</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

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



<script src="/docs/5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>

</body>

</html>