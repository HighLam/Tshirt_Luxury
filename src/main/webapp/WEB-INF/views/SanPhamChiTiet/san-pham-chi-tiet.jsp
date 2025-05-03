<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<<<<<<< HEAD
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>



=======
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*, java.util.stream.Collectors" %>
>>>>>>> ab554ba1bd4150e4eedff920d98c81474fcf9d0a
<!DOCTYPE html>
<html lang="en">
<head>
<<<<<<< HEAD
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi Tiết Sản Phẩm</title>
    <%--    <link rel="stylesheet" href="../css/sanPhamChiTiet.css">--%>
    <link rel="stylesheet" href="../css/sanPhamChiTiet.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.png" type="image/x-icon">
=======
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title><c:out value="${product.name}"/> - T-shirt Luxury</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/sanPhamChiTiet.css" />
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.png" type="image/x-icon" />
>>>>>>> ab554ba1bd4150e4eedff920d98c81474fcf9d0a
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<<<<<<< HEAD
    <script src="../js/sanPhamChiTiet.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

=======
    <script src="${pageContext.request.contextPath}/js/sanPhamChiTiet.js"></script>

    <style>
        .btn-group {
            gap: 12px;
        }

        .product-img-item {
            height: 600px;
            object-fit: cover;
            object-position: center;
        }

        .btn-group label {
            width: 40px;
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-weight: bold;
            cursor: pointer;
            color: black;
        }

        .btn-group input:checked + label {
            border: 2px solid black;
        }

        .color-option {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            border: 1px solid #ccc;
        }

        .disabled {
            opacity: 0.4;
            cursor: not-allowed;
            pointer-events: none;
        }
    </style>
>>>>>>> ab554ba1bd4150e4eedff920d98c81474fcf9d0a
</head>
<body>
<<<<<<< HEAD
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
                <form action="/t-shirt-luxury/tim-san-pham" method="get" class="form-search-popup">
                    <i class="fa-solid fa-magnifying-glass"></i>
                    <input class="input-search" type="text" name="timKiemSanPham" id="searchPopUp"
                           placeholder="Tìm kiếm">
                    <input class="input-search" type="text" name="timKiemSanPham" id="searchPopUp" placeholder="Tìm kiếm">
                </form>
                <a href="#">
                    <i class="fa-regular fa-user ps-5"></i>
                </a>
                <a href="#">
                    <i class="fa-regular fa-heart ps-5"></i>
                </a>
                <a href="/t-shirt-luxury/gio-hang-chi-tiet" >
                <a href="/t-shirt-luxury/gio-hang-chi-tiet">
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
            <form action="/t-shirt-luxury/tim-san-pham" method="get" class="form-search-popup">
                <i class="fa-solid fa-magnifying-glass"></i>
                <input class="input-search" type="text" name="timKiemSanPham" id="search" placeholder="Tìm kiếm">
            </form>
            <a href="#">
                <i class="fa-regular fa-user ps-5"></i>
            </a>
            <a href="#">
                <i class="fa-regular fa-heart ps-5"></i>
            </a>
            <a href="/t-shirt-luxury/gio-hang-chi-tiet" >
            <a href="/t-shirt-luxury/gio-hang-chi-tiet">
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
=======
<jsp:include page="/WEB-INF/views/fragments/header.jsp" />

<div class="container mt-3" style="padding-top: 90px;">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="<c:url value='/'/>">Trang chủ</a></li>
            <li class="breadcrumb-item"><a href="<c:url value='/san-pham'/>">Sản phẩm</a></li>
            <li class="breadcrumb-item active" aria-current="page"><c:out value="${product.name}"/></li>
        </ol>
    </nav>
>>>>>>> ab554ba1bd4150e4eedff920d98c81474fcf9d0a
</div>

<div class="modal" tabindex="-1" id="bangsize">
    <div class="modal-dialog">
        <div class="modal-content">
            <img src="/images/bangSize/bangsize.png" alt="Bảng size" />
        </div>
    </div>
</div>

<div class="row">
    <div class="col-1"></div>
    <div class="col-7">
        <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
<<<<<<< HEAD
                <c:if test="${not empty imageDataList}">
                    <div class="image-gallery">
                        <c:forEach var="imageData" items="${imageDataList}">
                            <div class="carousel-item active">

                            <div class="image-item" >
                                <!-- Hiển thị ảnh từ byte[] dưới dạng base64 -->
                                <img src='${imageData}' alt="San Pham Image" style="width: 800px; height: 900px; margin: 5px;" />
                            </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:if>

                <c:if test="${empty imageDataList}">
                    <p>Không có ảnh để hiển thị.</p>
                </c:if>
=======
                <c:forEach var="imageUrl" items="${images}" varStatus="status">
                    <div class="carousel-item ${status.first ? 'active' : ''}">
                        <img src="${imageUrl}" class="d-block w-100 product-img-item" alt="Product Image" />
                    </div>
                </c:forEach>
>>>>>>> ab554ba1bd4150e4eedff920d98c81474fcf9d0a
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls"
                    data-bs-slide="prev" style="margin-top: 350px">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls"
                    data-bs-slide="next" style="margin-top: 350px">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </div>

    <div class="col-4">
<<<<<<< HEAD

    <form action="/t-shirt-luxury/san-pham-chi-tiet/add-cart" method="post" >
        <input type="text" value="${spDetail.id}" hidden="hidden" name="idSPDetail">
        <h6>${spDetail.tenSanPham}</h6>
<%--        <p><fmt:formatNumber value='${spDetail.gia}' pattern="#,##0"/></p>--%>
        <div class="d-flex align-items-center gap-2">
        <p> <fmt:formatNumber value='${giaMin}' pattern="#,##0" /></p>
        <p>${ok}</p>
        <p> <fmt:formatNumber value='${giaMax}' pattern="#,##0"/>₫</p>
        </div>
        <hr>

        <!-- Color Selection -->
        <div class="color">
            <h6>MÀU SẮC</h6>
            <div class="d-flex gap-2">
                <c:forEach var="ms" items="${mauSac}">
                    <input type="radio" class="btn" name="mauSac" value="${ms.id}">
                    <span>${ms.tenMauSac}</span>
                </c:forEach>
            </div>
        <!-- Size Selection -->
        <div class="size" style="margin-top: 5px;">
            <div class="row">
                <div class="col-4">
                    <h6>KÍCH THƯỚC</h6>
                </div>
                <div class="col-6">
                    <a href="" data-bs-toggle="modal" data-bs-target="#bangsize" style="color: black;text-decoration: none">Hướng dẫn chọn size</a>
                </div>
            </div>
            <div class="d-flex gap-2">
                <c:forEach var="s" items="${size}">
                    <input type="radio" class="btn" name="size" value="${s.id}">
                    <span>${s.tenSize}</span>
                </c:forEach>
            </div>
        </div>

        <!-- Quantity Selector -->
        <div class="soLuong" style="margin-top: 10px;">
            <div class="counter">
                <button type="button" class="btn" id="decrease"><b>-</b></button>
                <input type="number" id="number" value="1" min="1" style="width: 50px; text-align: center;" name="soLuong">
                <button type="button" class="btn" id="increase"><b>+</b></button>
            </div>
        </div>

        <!-- Error Messages -->
        <span style="color:red">${errorMessage}</span>

        <!-- Add to Cart Button -->
        <div class="order" style="margin-top: 20px;">
            <p style="color: red">${notiOnl}</p>
            <p style="color:red;">${quaSoLuong}</p>
            <button type="submit" class="btn btn-dark" style="width:185px" >THÊM VÀO GIỎ HÀNG</button>
            <a href="#" class="btn btn-dark" style="margin-left: 5px;">MUA NGAY</a>
        </div>
        </div>
    </form>
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
                <img src="../images/ao_phong_boxy/DEVOTUS/white.webp" class="card-img-top"
                     alt="...">
                <div class="card-body">
                    <h5 class="card-title text-center" style="font-size:13px">Áo Phông DEVOTUS</h5>
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
            <img src="../images/ao_phong_co_chu_v/ATINO/black.webp" class="card-img-top" alt="...">
            <div class="card-body">
                <h5 class="card-title text-center" style="font-size:13px">Áo Phông Cổ Chữ V</h5>
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
            <img src="../images/ao_phong_unisex/LABUBU/pink.webp" class="card-img-top" alt="...">
            <div class="card-body">
                <h5 class="card-title text-center" style="font-size:13px">Áo Phông LABUBU</h5>
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
            <img src="../images/ao_phong_unisex/SMILE/green.webp" class="card-img-top" alt="...">
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
        <div class="text-center mt-4" style="padding-left:2rem">
            <a class="btn btn-outline-dark" href="/t-shirt-luxury/xem-them" style="width: 110px;">Xem Thêm</a>
        </div>
    </div>
</div>
=======
        <h6 id="productName"><c:out value="${product.name}"/></h6>
        <div class="mb-3">
            <span class="text-muted" id="availableQuantity"></span>
        </div>
        <input type="text" hidden id="productId" value="${product.id}" />

        <hr />
        <div class="d-flex flex-column gap-3">
            <h6 id="price">
                <fmt:formatNumber value="${product.price}" groupingUsed="true" maxFractionDigits="0"/> VND
            </h6>

            <div>
                <div class="d-flex gap-2 align-items-center">
                    <h6 class="mb-0 text-uppercase">Màu sắc</h6>
                </div>
                <div class="btn-group">
                    <c:forEach items="${colors}" var="item" varStatus="status">
                        <%
                            List<Long> availableSizeIds = (List<Long>) ((Map<String, Object>) pageContext.getAttribute("item")).get("availableSizeIds");
                            String availableSizes = availableSizeIds != null ? availableSizeIds.stream()
                                    .map(String::valueOf)
                                    .collect(Collectors.joining(",")) : "";
                        %>
                        <input type="radio" class="btn-check color-option" name="color" id="color_${item.id}"
                               value="${item.id}" autocomplete="off" data-name="${item.name}"
                               data-available-sizes="<%= availableSizes %>"
                            ${status.first ? 'checked' : ''} />
                        <label for="color_${item.id}" class="color-option"
                               style="background-color: ${item.colorCode};"></label>
                    </c:forEach>
                </div>
            </div>

            <div>
                <div class="d-flex gap-2 align-items-center">
                    <h6 class="mb-0 text-uppercase">Kích thước</h6>
                    <p href="" class="mb-0 pe-auto" data-bs-toggle="modal" data-bs-target="#bangsize"
                       style="color: black; text-decoration: none">
                        Hướng dẫn chọn size
                    </p>
                </div>
                <div class="btn-group">
                    <c:forEach items="${sizes}" var="item" varStatus="status">
                        <%
                            List<Long> availableColorIds = (List<Long>) ((Map<String, Object>) pageContext.getAttribute("item")).get("availableColorIds");
                            String availableColors = availableColorIds != null ? availableColorIds.stream()
                                    .map(String::valueOf)
                                    .collect(Collectors.joining(",")) : "";
                        %>
                        <input type="radio" class="btn-check size-option" name="size" id="size_${item.id}"
                               value="${item.id}" autocomplete="off" data-name="${item.name}"
                               data-available-colors="<%= availableColors %>"
                            ${status.first ? 'checked' : ''} />
                        <label class="btn btn-default" for="size_${item.id}">${item.name}</label>
                    </c:forEach>
                </div>
            </div>

            <div class="input-group" style="width: 120px">
                <button class="btn btn-outline-secondary" type="button" id="decrease">-</button>
                <input type="text" class="form-control text-center" value="1" id="quantity" readonly />
                <button class="btn btn-outline-secondary" type="button" id="increase">+</button>
            </div>
        </div>
>>>>>>> ab554ba1bd4150e4eedff920d98c81474fcf9d0a

        <div class="order" style="margin-top: 20px">
            <form method="POST" action="/cart/add" class="d-inline">
                <input type="hidden" name="productID" value="${product.id}" />
                <input type="hidden" name="colorID" id="selectedColorId" />
                <input type="hidden" name="sizeID" id="selectedSizeId" />
                <input type="hidden" name="quantity" id="selectedQuantity" value="1" />
                <button type="submit" class="btn btn-dark" id="addToCartBtn" style="width: 185px" disabled>
                    THÊM VÀO GIỎ HÀNG
                </button>
            </form>
            <a class="btn btn-dark" id="buyNow" style="margin-left: 5px" disabled>MUA NGAY</a>
        </div>

        <div class="alert alert-danger d-none mt-3" id="errorMessage">
            Vui lòng chọn kích thước và màu sắc hợp lệ
        </div>

        <!-- Thuộc Tính Sản Phẩm -->
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
                        <p>Chất liệu: 90% Polyester, 9% Rayon, 1% Spandex</p>
                        <p>►Vải Polyester chống nhăn hiệu quả, giữ nhiệt tốt, độ bền cao</p>
                        <p>►Vải Rayon thoáng mát, mềm mại</p>
                        <p>Kiểu dáng:<br />►Form Classic rộng thoáng, dễ mặc tạo sự thoải mái tối đa</p>
                        <p>Chi tiết:<br />►Chất liệu có sự kết hợp của vải Rayon an toàn cho da, thoáng khí, hút ẩm tốt và đặc biệt là ít nhăn và có độ bền cao</p>
                        <p>►Thiết kế cổ tròn basic hài hòa, dễ bearers</p>
                        <p>►Áo bo gấu nhẹ nhàng tạo sự gọn gàng, thoải mái</p>
                        <p>►Áo với hoạ tiết kẻ sọc năng động, dễ dàng đa dạng phong cách</p>
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
                        <p>►Đổi hàng trong vòng 15 ngày.</p>
                        <p>►Giảm đến 15% trên tổng hóa đơn khi mua hàng ( tại cửa hàng ) vào tháng sinh nhật.</p>
                        <p>►Giao hàng nội thành Hà Nội chỉ từ 15.000đ trong vòng 24 giờ.</p>
                        <p>►Tích điểm 3-8% giá trị đơn hàng cho mỗi lần mua và trừ tiền vào lần mua tiếp theo.</p>
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
                        <p>►Có thể giặt tay hay giặt máy đều được (ưu tiên giặt tay để tăng tuổi thọ của sản phẩm)</p>
                        <p>►Lộn trái sản phẩm khi giặt, không giặt chung sản phẩm trắng với quần áo tối màu.</p>
                        <p>►Sử dụng xà phòng trung tính, không sử dụng xà phòng có chất tẩy mạnh.</p>
                        <p>►Không sử dụng chất tẩy, không ngâm sản phẩm.</p>
                        <p>►Hạn chế sấy ở nhiệt độ cao, bảo quản nơi khô ráo, thoáng mát, không phơi trực tiếp dưới ánh nắng mặt trời.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/views/fragments/productForYou.jsp" />
<div class="container">
    <jsp:include page="/WEB-INF/views/fragments/footer.jsp" />
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>

<script>
<<<<<<< HEAD
    $(document).ready(function () {
        // $("form").submit(function (e) {
        //     let isValid = true;
        //     let errorMessage = "";
        //
        //     // Kiểm tra màu sắc
        //     if ($('input[name="mauSac"]:checked').length === 0) {
        //         isValid = false;
        //         errorMessage += "Vui lòng chọn màu sắc!\n";
        //     }
        //
        //     // Kiểm tra kích thước
        //     if ($('input[name="size"]:checked').length === 0) {
        //         isValid = false;
        //         errorMessage += "Vui lòng chọn kích thước!\n";
        //     }
        //
        //     // Hiển thị lỗi nếu không hợp lệ
        //     if (!isValid) {
        //         alert(errorMessage);
        //         e.preventDefault(); // Ngăn form submit
        //     }
        // });
    });



    document.getElementById("searchForm").addEventListener("submit", function (event) {
        // Đảm bảo chỉ ngăn gửi form nếu cần
        const searchInput = document.getElementById("search").value.trim();
        if (!searchInput) {
            event.preventDefault(); // Chỉ ngăn nếu input rỗng
            alert("Vui lòng nhập từ khóa để tìm kiếm!");
        }
    });

    document.getElementById("searchForm").addEventListener("submit", function (event) {
        // Đảm bảo chỉ ngăn gửi form nếu cần
        const searchInput = document.getElementById("searchPopUpsearchPopUp").value.trim();
        if (!searchInput) {
            event.preventDefault(); // Chỉ ngăn nếu input rỗng
            alert("Vui lòng nhập từ khóa để tìm kiếm!");
        }
    });


    // function handleAddToCart() {
    //     // Lấy giá trị từ các trường form
    //     var mauSac = document.querySelector('input[name="mauSac"]:checked');
    //     var size = document.querySelector('input[name="size"]:checked');
    //     var soLuong = document.getElementById('number').value;
    //
    //     // Kiểm tra tính hợp lệ của form
    //     if (!mauSac || !size || !soLuong || soLuong <= 0) {
    //         // Nếu không hợp lệ, hiển thị thông báo lỗi
    //         Swal.fire({
    //             title: 'Lỗi!',
    //             text: 'Vui lòng chọn màu sắc, kích thước và số lượng hợp lệ.',
    //             icon: 'error',
    //             confirmButtonText: 'OK'
    //         });
    //     } else {
    //         // Nếu form hợp lệ, hiển thị thông báo thành công
    //         Swal.fire({
    //             title: 'Thành công!',
    //             text: 'Sản phẩm đã được thêm vào giỏ hàng!',
    //             icon: 'success',
    //             confirmButtonText: 'OK',
    //             timer: 5000, // Hiển thị trong 5 giây
    //             willClose: () => {
    //                 // Gửi form sau khi thông báo đóng
    //                 document.getElementById('addToCartForm').submit();
    //             }
    //         });
    //     }
    // }


</script>
<script>
    document.getElementById("searchForm").addEventListener("submit", function(event) {
        // Đảm bảo chỉ ngăn gửi form nếu cần
        const searchInput = document.getElementById("search").value.trim();
        if (!searchInput) {
            event.preventDefault(); // Chỉ ngăn nếu input rỗng
            alert("Vui lòng nhập từ khóa để tìm kiếm!");
        }
    });

    document.getElementById("searchForm").addEventListener("submit", function(event) {
        // Đảm bảo chỉ ngăn gửi form nếu cần
        const searchInput = document.getElementById("searchPopUpsearchPopUp").value.trim();
        if (!searchInput) {
            event.preventDefault(); // Chỉ ngăn nếu input rỗng
            alert("Vui lòng nhập từ khóa để tìm kiếm!");
        }
    });



</script>



=======
    document.addEventListener('DOMContentLoaded', function () {
        // Global variables
        let selectedSize = document.querySelector('input[name="size"]:checked').value;
        let selectedColor = document.querySelector('input[name="color"]:checked').value;
        let availableQuantity = 0;
        let quantityInput = document.getElementById('quantity');

        // Initialize hidden inputs
        document.getElementById('selectedSizeId').value = selectedSize;
        document.getElementById('selectedColorId').value = selectedColor;

        // Check availability on page load
        checkAvailability();

        // Update color selection
        document.querySelectorAll('input[name="color"]').forEach(colorInput => {
            colorInput.addEventListener('change', function () {
                selectedColor = this.value;
                console.log('Selected Color ID:', selectedColor);
                document.getElementById('selectedColorId').value = selectedColor;

                // Get available sizes for this color
                let availableSizes = this.dataset.availableSizes?.split(',').filter(id => id.trim() !== '') || [];
                console.log('Available sizes for color', selectedColor, ':', availableSizes);

                // Enable/disable size options
                document.querySelectorAll('input[name="size"]').forEach(sizeInput => {
                    const sizeId = sizeInput.value;
                    const sizeLabel = sizeInput.nextElementSibling;
                    if (availableSizes.length > 0 && !availableSizes.includes(sizeId)) {
                        sizeInput.disabled = true;
                        sizeLabel.classList.add('disabled');
                        if (selectedSize === sizeId) {
                            selectedSize = null;
                            document.getElementById('selectedSizeId').value = '';
                            document.querySelectorAll('input[name="size"]').forEach(s => s.checked = false);
                        }
                    } else {
                        sizeInput.disabled = false;
                        sizeLabel.classList.remove('disabled');
                    }
                });

                // Reset quantity
                quantityInput.value = 1;
                document.getElementById('selectedQuantity').value = 1;

                // Check availability
                checkAvailability();
                updateButtons();
            });
        });

        // Update size selection
        document.querySelectorAll('input[name="size"]').forEach(sizeInput => {
            sizeInput.addEventListener('change', function () {
                selectedSize = this.value;
                console.log('Selected Size ID:', selectedSize);
                document.getElementById('selectedSizeId').value = selectedSize;

                // Get available colors for this size
                let availableColors = this.dataset.availableColors?.split(',').filter(id => id.trim() !== '') || [];
                console.log('Available colors for size', selectedSize, ':', availableColors);

                // Enable/disable color options
                document.querySelectorAll('input[name="color"]').forEach(colorInput => {
                    const colorId = colorInput.value;
                    const colorLabel = colorInput.nextElementSibling;
                    if (availableColors.length > 0 && !availableColors.includes(colorId)) {
                        colorInput.disabled = true;
                        colorLabel.classList.add('disabled');
                        if (selectedColor === colorId) {
                            selectedColor = null;
                            document.getElementById('selectedColorId').value = '';
                            document.querySelectorAll('input[name="color"]').forEach(c => c.checked = false);
                        }
                    } else {
                        colorInput.disabled = false;
                        colorLabel.classList.remove('disabled');
                    }
                });

                // Reset quantity
                quantityInput.value = 1;
                document.getElementById('selectedQuantity').value = 1;

                // Check availability
                checkAvailability();
                updateButtons();
            });
        });

        // Handle quantity increase
        document.getElementById('increase').addEventListener('click', function () {
            let qty = parseInt(quantityInput.value);
            if (qty < availableQuantity) {
                qty += 1;
                quantityInput.value = qty;
                document.getElementById('selectedQuantity').value = qty;
            } else {
                alert('Số lượng không được vượt quá số lượng còn lại: ' + availableQuantity);
            }
        });

        // Handle quantity decrease
        document.getElementById('decrease').addEventListener('click', function () {
            let qty = parseInt(quantityInput.value);
            if (qty > 1) {
                qty -= 1;
                quantityInput.value = qty;
                document.getElementById('selectedQuantity').value = qty;
            }
        });

        // Check product availability via Fetch
        function checkAvailability() {
            const quantityDisplay = document.getElementById('availableQuantity');
            if (selectedSize && selectedColor) {
                quantityDisplay.textContent = 'Đang kiểm tra...';
                fetch("/product/quantity?productId=" + ${product.id} + "&sizeId=" + selectedSize + "&colorId=" + selectedColor)
                    .then(response => {
                        if (!response.ok) {
                            throw new Error('Network response was not ok');
                        }
                        return response.json();
                    })
                    .then(data => {
                        availableQuantity = data.quantity || 0;
                        console.log('Quantity for product', ${product.id}, 'size', selectedSize, 'color', selectedColor, ':', availableQuantity);
                        if (availableQuantity > 0) {
                            quantityDisplay.textContent = 'Còn ' + availableQuantity + ' sản phẩm';
                        } else {
                            quantityDisplay.textContent = 'Hết hàng';
                        }
                        // Reset quantity if current quantity exceeds available
                        let currentQty = parseInt(quantityInput.value);
                        if (currentQty > availableQuantity) {
                            quantityInput.value = availableQuantity > 0 ? 1 : 0;
                            document.getElementById('selectedQuantity').value = availableQuantity > 0 ? 1 : 0;
                        }
                        updateButtons();
                    })
                    .catch(error => {
                        console.error('Error fetching quantity:', error);
                        availableQuantity = 0;
                        quantityDisplay.textContent = 'Lỗi kiểm tra số lượng';
                        updateButtons();
                    });
            } else {
                availableQuantity = 0;
                quantityDisplay.textContent = '';
                quantityInput.value = 1;
                document.getElementById('selectedQuantity').value = 1;
                updateButtons();
            }
        }

        // Update button states
        function updateButtons() {
            const addToCartBtn = document.getElementById('addToCartBtn');
            const buyNowBtn = document.getElementById('buyNow');
            const errorMessage = document.getElementById('errorMessage');

            if (selectedSize && selectedColor && availableQuantity > 0 && parseInt(quantityInput.value) > 0) {
                addToCartBtn.disabled = false;
                buyNowBtn.classList.remove('disabled');
                errorMessage.classList.add('d-none');
            } else {
                addToCartBtn.disabled = true;
                buyNowBtn.classList.add('disabled');
                errorMessage.classList.remove('d-none');
                errorMessage.textContent = 'Vui lòng chọn kích thước và màu sắc hợp lệ';
            }
        }

        // Buy now
        document.getElementById('buyNow').addEventListener('click', function (e) {
            if (!selectedSize || !selectedColor || availableQuantity === 0 || parseInt(quantityInput.value) === 0) {
                e.preventDefault();
                return;
            }
            window.location.href = "/checkout?productId=" + ${product.id} + "&sizeId=" + selectedSize + "&colorId=" + selectedColor + "&quantity=" + quantityInput.value;
        });

        // Validate form submission
        document.querySelector('form[action="/cart/add"]').addEventListener('submit', function (e) {
            if (!selectedSize || !selectedColor || availableQuantity === 0 || parseInt(quantityInput.value) === 0) {
                e.preventDefault();
                alert("Vui lòng chọn kích thước, màu sắc hợp lệ và số lượng lớn hơn 0!");
            } else if (parseInt(quantityInput.value) > availableQuantity) {
                e.preventDefault();
                alert("Số lượng không được vượt quá số lượng còn lại: " + availableQuantity);
            }
        });
    });
</script>
</body>
>>>>>>> ab554ba1bd4150e4eedff920d98c81474fcf9d0a
</html>