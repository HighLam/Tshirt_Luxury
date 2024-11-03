<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>T-Shirt Luxury | ADMIN</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.png" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body style="max-width: 1460px;">

<div >
    <div class="row">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container">
                <nav class="navbar navbar-light bg-light">
                    <div class="container">
                        <a class="navbar-brand" href="/t-shirt-luxury/admin">
                            <img src="${pageContext.request.contextPath}/images/logo.png" alt="" width="55" height="55"
                                 class="d-inline-block rounded-circle align-text-top" style="filter: brightness(0);">
                            <a class="fw-bold font-monospace" href="/t-shirt-luxury/admin"
                               style="text-decoration: none; color:black; font-size:23px">T-SHIRT
                                LUXURY </a>
                        </a>
                    </div>
                </nav>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    </ul>
                    <form class="d-flex">
                        <img src="${pageContext.request.contextPath}/images/user.jpg" class="rounded-circle" alt="..." width="40px" height="40px">
                        <div class="dropdown">
                            <button class="btn btn-outline-dark dropdown-toggle ms-2" type="button"
                                    id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                            </button>
                            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                <li><a class="dropdown-item" href="#"><i class="fa-solid fa-gear"></i> Cài đặt</a>
                                </li>
                                <li><a class="dropdown-item" href="/t-shirt-luxury/login" style="color: red;"><i
                                        class="fa-solid fa-right-from-bracket"></i> Đăng xuất</a></li>
                            </ul>
                        </div>
                    </form>
                </div>
            </div>
        </nav>
    </div>


    <div class="row mt-3 ">
        <div class="col-3 " style="">
            <div class="list-group ">
                <a href="/t-shirt-luxury/admin" class="list-group-item list-group-item-action action" aria-current="true">
                    <i class="fa-solid fa-house"></i> Trang Chủ
                </a>
                <a href="#" class="list-group-item list-group-item-action"> <i
                        class="fa-solid fa-chart-simple"></i> Số Liệu Thống Kê</a>
                <a href="/t-shirt-luxury/admin/nguoi-dung" class="list-group-item list-group-item-action"><i
                        class="fa-solid fa-users-gear"></i>
                    Quản Lý Người Dùng</a>
                <a href="/t-shirt-luxury/admin/hoa-don" class="list-group-item list-group-item-action"><i
                        class="fa-solid fa-money-bill-transfer"></i> Quản Lý Hóa Đơn</a>

                <a href="/t-shirt-luxury/admin/san-pham" class="list-group-item list-group-item-action"><i
                        class="fa-solid fa-shirt"></i> Quản Lý Sản Phẩm</a>
                <a href="/t-shirt-luxury/admin/voucher" class="list-group-item list-group-item-action"><i
                        class="fa-solid fa-ticket"></i> Quản Lý Voucher</a>
                <a href="/t-shirt-luxury/admin/giam-gia" class="list-group-item list-group-item-action"><i
                        class="fa-brands fa-salesforce"></i> Quản Lý Giảm Giá</a>

                <div class="dropdown">
                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1"
                            data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fa-solid fa-wand-magic-sparkles"></i> Quản Lý Thuộc Tính
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                        <li><a class="dropdown-item" href="/t-shirt-luxury/admin/mau-sac"><i class="fa-solid fa-palette"></i> Màu
                            Sắc</a></li>
                        <li><a class="dropdown-item" href="/t-shirt-luxury/admin/size"><i class="fa-solid fa-s"></i> Size</a></li>
                        <li><a class="dropdown-item" href="/t-shirt-luxury/admin/chat-lieu"><i class="fa-solid fa-star"></i> Chất
                            Liệu</a></li>
                        <li><a class="dropdown-item" href="/t-shirt-luxury/admin/danh-muc"><i class="fa-solid fa-table-list"></i> Danh
                            Mục</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="col-9" style="">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid" >

                    <form class="d-flex">
                        <input style="width: 600px;" class="form-control me-2" type="search" placeholder="Tìm sản phẩm" aria-label="Search">

                        <ul style="list-style-type: none;">
                            <li class="nav-item mt-3" >
                                <a href="" ><i class="fa-solid fa-barcode" style="font-size: 30px; "></i></a>
                            </li>
                        </ul>
                    </form>

                </div>
        </nav>
        <div class="row">
            <div class="col-8">
                <div class="HDCT" style="height:250px ; width: 730px;">
                    <p>Sản phẩm</p>
                    <table class="table scrollspy-example" >
                        <tbody>
                        <c:forEach items="${SP}" var="sp" varStatus="i">


                        <tr>
                            <td>${i.index+1}</td>
                            <td>${sp.maSanPham}</td>
                            <td>${sp.tenSanPham}</td>
                            <td>${sp.danhMuc.tenDanhMuc}</td>
                            <td>${sp.trangThai==1?"Dang Ban":"Chua Ban"}</td>
                            <td>
                                <button type="button"
                                   class="btn"
                                   data-bs-toggle="modal"
                                   data-bs-target="#themSanPham"
                                    onclick="a('${sp.id}')">
                                    <i class="fa-solid fa-check"></i></button></td>


                        </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <hr>
        <div class="SPCT">

            <table class="table" >
                <tbody>
                <tr>
                    <th scope="row">1</th>
                    <td>Mark</td>
                    <td>Otto</td>
                    <td>@mdo</td>
                    <td>Mark</td>
                    <td>Otto</td>
                    <td>@mdo</td>
                </tr>

                </tbody>
            </table>
        </div>
            </div>


            <div class="col-4" style="border-left: 1px solid black;">
                <div class="TTDH" style="height:500px ;">

                    <h5>Thông tin đơn hàng</h5>
                    <hr>
                    <div class="row">
                        <div class="col-6">
                            <p>Số lượng sản phẩm</p>
                            <p>Tổng tiền</p>
                            <p>Chiết khấu</p>
                            <hr>
                            <h6>Khách phải trả</h6>
                            <p>Tiền khách đưa</p>
                            <p>Tiền thừa</p>
                        </div>
                        <div class="col-6">
                            <p>1</p>
                            <p>100000Đ</p>
                            <p>10000</p>
                            <hr>
                            <H6>90000</H6>
                            <p>100000</p>
                            <p>10000</p>
                        </div>
                    </div>
                    <div class="voucher ">
                        <label for="floatingInput">Voucher</label>
                        <div class="d-flex justify-content mt-2">
                            <input style="width: 284px;" type="text" class="form-control" id="floatingInput">
                            <button class="btn btn-secondary "  type="submit" style="margin-left: 10px;">Áp Dụng</button>
                        </div>

                    </div >
                    <div class="btnHoaDon mt-5 d-flex justify-content-end me-5" >
                        <button class="btn btn-secondary">Hủy</button>
                        <button class="btn btn-dark ms-3" >Thanh toán</button>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </div>
</div>
</body>
<div class="modal fade" id="themSanPham" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">${modal.id}</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                ...
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                <button type="button" class="btn btn-primary">Thêm</button>
            </div>
        </div>
    </div>
</div>
<script>
    const a = (id)=>{
        console.log(id)
    }
</script>
</html>