<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="../js/script.js"></script>
    <link rel="stylesheet" href="../css/style.css">
    <title>DASHBOARD</title>
</head>

<body class="container">

<div class="modal" tabindex="-1" id="bangsize">
    <div class="modal-dialog">
        <div class="modal-content">

            <img src="/images/bangSize/bangsize.png" alt="">
        </div>
    </div>
</div>
<div class="row" style="margin-top: 100px;" >
    <div class="col-1">
    </div>
    <div class="col-7">
        <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="images/Images_teeshirt/ao_phong_co_chu_v/BELAIRMAN/blue.webp" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="images/Images_teeshirt/ao_phong_co_chu_v/BELAIRMAN/brow.webp" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="images/Images_teeshirt/ao_phong_co_chu_v/BELAIRMAN/crem.webp" class="d-block w-100" alt="...">
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev" style="margin-top: 350px; ">
                <span class="carousel-control-prev-icon "  aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next" style="margin-top: 350px; ">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden" >Next</span>
            </button>
        </div>
    </div>
    <div class="col-4">
        <h6>BELAIRMAN</h6>
        <p>Còn hàng</p>
        <hr style="width: 300px;">
        <div class="color">
            <h6>MÀU SẮC</h6>
            <a class="btn" href="#">Blue</a>
            <a class="btn" href="#">Gray</a>
            <a class="btn" href="#">Crem</a>
        </div>

        <div class="size" style="margin-top: 5px;">
            <div class="row">
                <div class="col-4">
                    <h6>KÍCH THƯỚC</h6>
                </div>
                <div class="col-6">
                    <a href="" data-bs-toggle="modal" data-bs-target="#bangsize" style="color: black;">hướng dẫn chọn size</a>
                </div>
            </div>
            <a class="btn" href="#">S</a>
            <a class="btn" href="#">M</a>
            <a class="btn" href="#">L</a>
            <a class="btn" href="#">XL</a>
        </div>
        <div class="soLuong" style="margin-top: 10px;">
            <div class="counter">
                <button class="btn" id="decrease"><b>-</b></button>
                <span id="number">1</span>
                <button class="btn" id="increase"><b>+</b></button>
            </div>
        </div>
        <div class="order" style="margin-top: 20px;">
            <a href="#" class="btn btn-dark">THÊM VÀO GIỎ HÀNG</a>
            <a href="#" class="btn btn-dark" style="margin-left: 5px;">MUA NGAY</a>
        </div>
        <!-- Thuộc Tính Sản Phẩm  -->
        <div class="ttsp" style="margin-top: 20PX;">
            <!-- Nút dấu cộng và trừ -->
            <P>THUỘC TÍNH SẢN PHẨM <button id="toggleButtonttsp" class="btn ">+</button></P>
            <!-- Đoạn văn sẽ hiển thị/ẩn -->
            <div class="ttsp" id="textttsp">
                <P>Chất liệu: 90% Polyester, 9% Rayon, 1% Spandex</p>
                <P>►Vải Polyester chống nhăn hiệu quả, giữ nhiệt tốt, độ bền cao</P>
                <P>►Vải Rayon thoáng mát, mềm mại</P>
                <P>Kiểu dáng:
                    <br >
                    ►Form Classic rộng thoáng, dễ mặc tạo sự thoải mái tối đa</P>
                <P>          Chi tiết:
                    <br>
                    ►Chất liệu có sự kết hợp của vải Rayon an toàn cho da, thoáng khí, hút ẩm tốt và đặc biệt là ít nhăn và có độ bền cao</P>
                <p> ►Thiết kế cổ tròn basic hài hòa, dễ chịu</p>
                <p>►Áo bo gấu nhẹ nhàng tạo sự gọn gàng, thoải mái</p>
                <p> ►Áo với hoạ tiết kẻ sọc năng động, dễ dàng đa dạng phong cách </P>
            </div>
        </div>
        <hr style="width: 350px; margin-top: 0;">
        <!-- Chính Sách Sản Phẩm -->
        <div class="cssp" style="margin-top: 0;">
            <P>CHÍNH SÁCH SẢN PHẨM <button id="toggleButtoncssp" class="btn ">+</button></P>
            <div class="cssp" id="textcssp">
                <p> ►Đổi hàng trong vòng 15 ngày.</p>
                <p> ►Giảm đến 15% trên tổng hóa đơn khi mua hàng ( tại cửa hàng ) vào tháng sinh nhật.</p>
                <p> ►Giao hàng nội thành Hà Nội chỉ từ 15.000đ trong vòng 24 giờ.</p>
                <p> ►Tích điểm 3-8% giá trị đơn hàng cho mỗi lần mua và trừ tiền vào lần mua tiếp theo.</p>
            </div>
        </div>
        <hr style="width: 350px; margin-top: 0;">
        <!-- Hướng Dẫn Bảo Quản -->
        <div class="hdbq" style="margin-top: 0; ">
            <P>HƯỚNG DẪN BẢO QUẢN <button id="toggleButtonhdbq" class="btn ">+</button></P>
            <div class="hdbq" id="texthdbq">
                <p>►Có thể giặt tay hay giặt máy đều được (ưu tiên giặt tay để tăng tuổi thọ của sản phẩm)</p>
                <p>►Lộn trái sản phẩm khi giặt, không giặt chung sản phẩm trắng với quần áo tối màu.</p>
                <p>►Sử dụng xà phòng trung tính,không sử dụng xà phòng có chất tẩy mạnh. </p>
                <p>►Không sử dụng chất tẩy, không ngâm sản phẩm. </p>
                <p>►Hạn chế sấy ở nhiệt độ cao, bảo quản nơi khô ráo, thoáng mát, không phơi trực tiếp dưới ánh nắng mặt trời.</p>
            </div>
        </div>
        <hr style="width: 350px; margin-top: 0;">
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

<footer class="py-5" style="margin: 20px;" >
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
                    <input id="newsletter1" type="text" class="form-control" placeholder="Email address" >
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>