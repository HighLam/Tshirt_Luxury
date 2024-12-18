<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<jsp:include page="../DanhMuc/gio-hang.jsp" />--%>
<jsp:include page="../DanhMuc/gio-hang.jsp"/>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <%--    <link rel="stylesheet" href="../css/sanPhamChiTiet.css">--%>
    <link rel="stylesheet" href="../css/sanPhamChiTiet.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.png" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"/>
    <link rel="shortcut icon" href="../images/favicon.png" type="image/x-icon">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="../js/sanPhamChiTiet.js"></script>
</head>

<body>
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
                <a href="/t-shirt-luxury/gio-hang-chi-tiet" >
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
            <li class="item-danh-muc"><a href="/t-shirt-luxury/ao-nam" class="name-danh-muc-popup ">Áo Nam
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
                <a href="/t-shirt-luxury/ao-nam" class="ten-danh-muc hover-change-color">Áo Nam
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

<div class="modal" tabindex="-1" id="bangsize">
    <div class="modal-dialog">
        <div class="modal-content">

            <img src="/images/bangSize/bangsize.png" alt="">
        </div>
    </div>
</div>
<div class="row" style="margin-top: 100px;">
    <div class="col-1">
    </div>
    <div class="col-7">
        <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="../images/ao_phong_boxy/DEVOTUS/black.webp" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="../images/ao_phong_boxy/DEVOTUS/wash.webp" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="../images/ao_phong_boxy/DEVOTUS/white.webp" class="d-block w-100" alt="...">
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls"
                    data-bs-slide="prev" style="margin-top: 350px; ">
                <span class="carousel-control-prev-icon " aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls"
                    data-bs-slide="next" style="margin-top: 350px; ">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </div>


    <div class="col-4">
        <form action="/t-shirt-luxury/san-pham-chi-tiet/add-cart" method="post">
            <input type="text" value="${spDetail.id}" hidden="hidden" name="idSPDetail">
            <h6>${spDetail.tenSanPham}</h6>
            <p>Còn hàng</p>
            <hr>

            <div class="color">
                <h6>MÀU SẮC</h6>
                <div class="d-flex gap-2">
                    <c:forEach var="ms" items="${mauSac}">
                        <input type="radio" class="btn" name="mauSac" value="${ms.id}">
                        <span>${ms.tenMauSac}</span>
                    </c:forEach>
                </div>


            </div>

            <div class="size" style="margin-top: 5px;">
                <div class="row">
                    <div class="col-4">
                        <h6>KÍCH THƯỚC</h6>
                    </div>
                    <div class="col-6">
                        <a href="" data-bs-toggle="modal" data-bs-target="#bangsize" style="color: black;text-decoration: none">Hướng dẫn
                            chọn size</a>
                    </div>
                </div>
                <div class="d-flex gap-2">
                    <c:forEach var="s" items="${size}">
                        <input type="radio" class="btn" name="size" value="${s.id}">
                        <span>${s.tenSize}</span>
                    </c:forEach>
                </div>
            </div>
            <div class="soLuong" style="margin-top: 10px;">
                <div class="counter">
                    <button type="button" class="btn" id="decrease"><b>-</b></button>
                    <input type="number" id="number" value="1" min="1" style="width: 50px; text-align: center;"
                           name="soLuong">
                    <button type="button" class="btn" id="increase"><b>+</b></button>
                </div>
            </div>
            <span style="color:red">
                ${errorMessage}
            </span>


            <div class="order" style="margin-top: 20px;">

                <button type="submit" class="btn btn-dark" style="width:185px">THÊM VÀO GIỎ HÀNG</button>


                <a href="#" class="btn btn-dark" style="margin-left: 5px;">MUA NGAY</a>
            </div>

            <!-- Thuộc Tính Sản Phẩm  -->
            <div class="accordion" id="accordionExample" style="margin-top: 20px">
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingOne">
                        <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                            THUỘC TÍNH SẢN PHẨM
                        </button>
                    </h2>
                    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne"
                         data-bs-parent="#accordionExample">
                        <div class="accordion-body">
                            <P>Chất liệu: 90% Polyester, 9% Rayon, 1% Spandex</p>
                            <P>►Vải Polyester chống nhăn hiệu quả, giữ nhiệt tốt, độ bền cao</P>
                            <P>►Vải Rayon thoáng mát, mềm mại</P>
                            <P>Kiểu dáng:
                                <br>
                                ►Form Classic rộng thoáng, dễ mặc tạo sự thoải mái tối đa</P>
                            <P> Chi tiết:
                                <br>
                                ►Chất liệu có sự kết hợp của vải Rayon an toàn cho da, thoáng khí, hút ẩm tốt và đặc
                                biệt là ít nhăn và có độ bền cao</P>
                            <p> ►Thiết kế cổ tròn basic hài hòa, dễ chịu</p>
                            <p>►Áo bo gấu nhẹ nhàng tạo sự gọn gàng, thoải mái</p>
                            <p> ►Áo với hoạ tiết kẻ sọc năng động, dễ dàng đa dạng phong cách </P>
                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingTwo">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                            CHÍNH SÁCH SẢN PHẨM
                        </button>
                    </h2>
                    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo"
                         data-bs-parent="#accordionExample">
                        <div class="accordion-body">
                            <p> ►Đổi hàng trong vòng 15 ngày.</p>
                            <p> ►Giảm đến 15% trên tổng hóa đơn khi mua hàng ( tại cửa hàng ) vào tháng sinh nhật.</p>
                            <p> ►Giao hàng nội thành Hà Nội chỉ từ 15.000đ trong vòng 24 giờ.</p>
                            <p> ►Tích điểm 3-8% giá trị đơn hàng cho mỗi lần mua và trừ tiền vào lần mua tiếp theo.</p>
                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingThree">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                            HƯỚNG DẪN BẢO QUẢN
                        </button>
                    </h2>
                    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree"
                         data-bs-parent="#accordionExample">
                        <div class="accordion-body">
                            <p>►Có thể giặt tay hay giặt máy đều được (ưu tiên giặt tay để tăng tuổi thọ của sản phẩm)
                            </p>
                            <p>►Lộn trái sản phẩm khi giặt, không giặt chung sản phẩm trắng với quần áo tối màu.</p>
                            <p>►Sử dụng xà phòng trung tính,không sử dụng xà phòng có chất tẩy mạnh. </p>
                            <p>►Không sử dụng chất tẩy, không ngâm sản phẩm. </p>
                            <p>►Hạn chế sấy ở nhiệt độ cao, bảo quản nơi khô ráo, thoáng mát, không phơi trực tiếp dưới
                                ánh nắng mặt trời.</p>

                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>

</div>
<div class="comment " style="margin-top: 100px; ">
    <p style="margin-left: 80px;"><b>0 bình luận</b></p>
    <div class="cmt" style="display: flex; align-items: center; gap: 10px; margin: 20px;">
        <!-- Hình ảnh đại diện -->
        <img src="/images/linhtinh/avt.jpg" alt="Avatar" style="width: 50px; height: 50px; margin-top: 0; ">

        <!-- Dòng nhập liệu với chiều rộng lớn hơn (gấp đôi) -->
        <input type="text" placeholder="Nhập nội dung tại đây" style="flex-grow: 1; width: 400px; padding: 10px;">

    </div>
    <div>
        <a class="btn btn-primary" type="button" style="margin-left: 80px;">Gửi</a>
    </div>
</div>
<hr>
<div class="container">
    <h5><b>CÓ THỂ BẠN THÍCH</b></h5>
    <div class="row">
        <div class="col-3">
            <div class="card" style="width: 18rem; border-style:none">
                <img src="/images/Images_teeshirt/ao_phong_unisex/Airplane/black.webp" class="card-img-top"
                     alt="...">
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
            <div class="card" style="width: 18rem; border-style:none"></div>
            <img src="/images/Images_teeshirt/ao_phong_unisex/Airplane/black.webp" class="card-img-top" alt="...">
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
        <div class="col-3">
            <div class="card" style="width: 18rem; border-style:none"></div>
            <img src="/images/Images_teeshirt/ao_phong_unisex/Airplane/black.webp" class="card-img-top" alt="...">
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
        <div class="col-3">
            <div class="card" style="width: 18rem; border-style:none"></div>
            <img src="/images/Images_teeshirt/ao_phong_unisex/Airplane/black.webp" class="card-img-top" alt="...">
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
        <div class="text-center mt-4" style="padding-left:2rem">
            <button class="btn btn-outline-dark" type="submit" style="width: 110px;">Xem Thêm</button>
        </div>
    </div>
</div>

<footer class="py-5" style="margin: 20px;">
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
<script>
    $(document).ready(function () {
        $("form").submit(function (e) {
            let isValid = true;
            let errorMessage = "";

            // Kiểm tra màu sắc
            if ($('input[name="mauSac"]:checked').length === 0) {
                isValid = false;
                errorMessage += "Vui lòng chọn màu sắc!\n";
            }

            // Kiểm tra kích thước
            if ($('input[name="size"]:checked').length === 0) {
                isValid = false;
                errorMessage += "Vui lòng chọn kích thước!\n";
            }

            // Hiển thị lỗi nếu không hợp lệ
            if (!isValid) {
                alert(errorMessage);
                e.preventDefault(); // Ngăn form submit
            }
        });
    });

</script>
</html>