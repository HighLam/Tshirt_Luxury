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

<body>
<div  >
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
            <div class="row">
                <h2 class="">Quản Lý Hóa Đơn</h2>

                <!-- <div class="p-2 bd-highlight d-flex justify-content-end">
                    <button type="button" class="btn btn-outline-success" data-bs-toggle="modal"
                        data-bs-target="#themSanPham">
                        <i class="fa-solid fa-circle-plus"></i> Thêm Mới
                    </button>
                </div> -->

                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Mã Hóa Đơn</th>
                        <th scope="col">Tên Khách Hàng</th>
                        <th scope="col">Trạng Thái</th>
                        <th scope="col">Ngày Tạo</th>
                        <th scope="col">Tổng Tiền</th>
                        <th scope="col">Mô Tả</th>
                        <th scope="col">Hành Động</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${listHoaDon}" var="hd">
                        <tr>
                            <th scope="row">${hd.id}</th>
                            <th scope="row">${hd.maHoaDon}</th>
                            <th scope="row">${hd.nguoiDung.tenNguoiDung}</th>
                            <th scope="row">${hd.trangThai}</th>
                            <th scope="row">${hd.ngayTao}</th>
                            <th scope="row">8386</th>
                            <th scope="row">${hd.moTa}</th>
                            <td>
                                <a href="/t-shirt-luxury/admin/hoa-don-chi-tiet" class="btn btn-secondary rounded-pill"
                                   data-toggle="tooltip" data-placement="top" title="Xem Chi Tiết">
                                    <i class="fa-solid fa-eye"></i>
                                </a>
                            </td>
                        </tr>

                    </c:forEach>

                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>

</html>