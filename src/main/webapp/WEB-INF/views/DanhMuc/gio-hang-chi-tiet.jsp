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
    <script src="../js/script.js"></script>
    <link href="../css/gioHangChiTiet.css" rel="stylesheet">
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
                    <!--mở Drawer giỏ hàng -->
                    <a href="#" data-bs-toggle="offcanvas" data-bs-target="#cartDrawer" aria-controls="cartDrawer">
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
                <a href="#" data-bs-toggle="offcanvas" data-bs-target="#cartDrawer" aria-controls="cartDrawer">
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
                                                  style="border-right: 1px solid #000; padding:0 10px;">Quần Nam </a>
                </li>
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
<div class="drawer">
    <div class="offcanvas offcanvas-end" tabindex="-1" id="cartDrawer" aria-labelledby="cartDrawerLabel">
        <div class="offcanvas-header">
            <h5 class="offcanvas-title" id="cartDrawerLabel">Giỏ hàng</h5>
            <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body">
            <p>Bạn đang có 2 sản phẩm trong giỏ hàng.</p>
            <div id="cartItems">
                <div class="cart-item d-flex justify-content-between align-items-center">
                    <div class="cart-item-image">
                        <img width="300px" src="../images/ao_phong_boxy/DEVOTUS/black.webp" alt="Áo Phông"
                             height="200px" class="img-fluid">
                    </div>
                    <div class="cart-item-info">
                        <p>Áo Phông Fitted 1300 - Be - M</p>
                        <p>329,000 đ x 1</p>
                    </div>
                    <button class="btn btn-danger btn-sm">Xóa</button>
                </div>
                <hr>
                <div class="cart-item d-flex justify-content-between align-items-center">
                    <div class="cart-item-image">
                        <img width="300px" src="../images/ao_phong_boxy/HEAVEN/red.webp" alt="Áo Phông" width="200px"
                             class="img-fluid">
                    </div>
                    <div class="cart-item-info">
                        <p>Áo Phông Fitted 1300 - Đen - L</p>
                        <p>329,000 đ x 1</p>
                    </div>
                    <button class="btn btn-danger btn-sm">Xóa</button>
                </div>
            </div>
            <hr>
            <div class="d-flex justify-content-between">
                <strong>Tổng tiền tạm tính:</strong>
                <span id="totalPrice">658,000 đ</span>
            </div>
            <button class="btn btn-dark w-100 mt-3">TIẾN HÀNH ĐẶT HÀNG</button>
            <a href="#" class="btn btn-light w-100 mt-2 text-center">Xem chi tiết giỏ hàng ➔</a>
        </div>
    </div>
</div>

<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a class="home" href="#"><i class="fas fa-home"></i> Trang chủ</a></li>
        <li class="breadcrumb-item active" aria-current="page">Giỏ hàng</li>
    </ol>
</nav>
<div class="container">
    <div class="container mt-4">
        <h2 class="cart-title">
            GIỎ HÀNG CỦA BẠN
            <span class="text-muted"> (Có 2 sản phẩm trong giỏ hàng) </span>
        </h2>
        <div class="row">
            <div class="col-md-8">
                <div class="cart-item d-flex align-items-center">
                    <img
                            alt="Image "
                            height="150"
                            src="../images/ao_phong_oversize/BUNNY/gray.webp"
                            width="100"
                    />
                    <div class="ms-3">
                        <p>Áo Phông Fitted 1300 - Be - M</p>
                        <button class="btn btn-outline-secondary btn-sm">Xóa</button>
                    </div>
                    <div class="ms-auto d-flex align-items-center">
                        <button class="btn btn-outline-secondary btn-sm">-</button>
                        <input
                                class="form-control text-center mx-2"
                                style="width: 50px"
                                type="text"
                                value="1"
                        />
                        <button class="btn btn-outline-secondary btn-sm">+</button>
                    </div>
                    <div class="ms-3">
                        <p>329,000₫</p>
                    </div>
                </div>
                <div class="cart-item d-flex align-items-center">
                    <img
                            alt="Image "
                            height="150"
                            src="../images/ao_phong_boxy/NO-END/black.webp"
                            width="100"
                    />
                    <div class="ms-3">
                        <p>Áo Phông Fitted 1300 - Đen - L</p>
                        <button class="btn btn-outline-secondary btn-sm">Xóa</button>
                    </div>
                    <div class="ms-auto d-flex align-items-center">
                        <button class="btn btn-outline-secondary btn-sm">-</button>
                        <input
                                class="form-control text-center mx-2"
                                style="width: 50px"
                                type="text"
                                value="1"
                        />
                        <button class="btn btn-outline-secondary btn-sm">+</button>
                    </div>
                    <div class="ms-3">
                        <p>329,000₫</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="cart-summary">
                    <h5>TÓM TẮT ĐƠN HÀNG</h5>
                    <p>Chưa bao gồm phí vận chuyển:</p>
                    <p>
                        <strong> Tổng tiền: </strong>
                        <span class="float-end"> 658,000₫ </span>
                    </p>
                    <hr/>
                    <p>Bạn có thể nhập mã giảm giá ở trang thanh toán</p>
                    <button class="btn btn-dark">TIẾN HÀNH ĐẶT HÀNG</button>
                    <button class="btn btn-outline-dark">MUA THÊM SẢN PHẨM</button>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="row mt-5" style="padding-left:2rem">
    <img src="https://pos.nvncdn.com/be3159-662/bn/20240921_h3xCoY0r.gif" alt="">
</div>
<footer class="container py-5">
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
                    <h6 class="" style="font-size: 14px;"><i class="fa-solid fa-caret-right"></i> CỬA HÀNG SỐ
                        99
                    </h6>
                    <p>168 Hoàng Văn Thụ, Phường Hoàng Văn Thụ, TP.Bắc Giang</p>
                    <p>Tel: 0348.600.168</p>
                </li>

                <li class="nav-item mb-2">
                    <h6 class="" style="font-size: 14px;"><i class="fa-solid fa-caret-right"></i> CỬA HÀNG SỐ
                        88
                    </h6>
                    <p>1239 Giải Phóng, Phường Thịnh Liệt, Quận Hai Bà Trưng, TP Hà Nội</p>
                    <p>Tel: 0375.88.1239</p>
                </li>
                <li class="nav-item mb-2">
                    <h6 class="" style="font-size: 14px;"><i class="fa-solid fa-caret-right"></i> XEM THÊM TOÀN
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
            <li class="ms-3"><a class="link-body-emphasis" href="#">
                <svg class="bi" width="24" height="24">
                    <use xlink:href="#twitter"></use>
                </svg>
            </a></li>
            <li class="ms-3"><a class="link-body-emphasis" href="#">
                <svg class="bi" width="24" height="24">
                    <use xlink:href="#instagram"></use>
                </svg>
            </a></li>
            <li class="ms-3"><a class="link-body-emphasis" href="#">
                <svg class="bi" width="24" height="24">
                    <use xlink:href="#facebook"></use>
                </svg>
            </a></li>
        </ul>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous">
</script>
</body>
</html>