<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<jsp:include page="gio-hang.jsp" />--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thống Kê</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.png" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
    <link rel="shortcut icon" href="../images/favicon.png" type="image/x-icon">
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
                <a href="/t-shirt-luxury/admin/thong-ke" class="list-group-item list-group-item-action"> <i
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
                <%--                <a href="/t-shirt-luxury/admin/giam-gia" class="list-group-item list-group-item-action"><i--%>
                <%--                        class="fa-brands fa-salesforce"></i> Quản Lý Giảm Giá</a>--%>

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
                        <li><a class="dropdown-item" href="/t-shirt-luxury/admin/anh-san-pham"><i class="fa fa-image"></i></i> Ảnh Sản Phẩm</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="col-9" style="">

            <div class="row">

                <div class="col-3">
                    <div class="p-3 border bg-light"><i class="fa-solid fa-chart-line"></i> Tổng Doanh Thu:
                        <fmt:formatNumber value="${tongDoanhThu}" type="currency" currencySymbol="₫" groupingUsed="true" /></div>
                </div>
                <div class="col-1"></div>
                <div class="col-3">
                    <div class="p-3 border bg-light"><i class="fa-solid fa-money-bill-trend-up"></i> Số Lượng Hóa Đơn: ${soLuongHoaDon}</div>
                </div>
                <div class="col-1"></div>
                <div class="col-3">
                    <div class="p-3 border bg-light"><i class="fa-brands fa-product-hunt"></i> Tổng Sản Phẩm Bán Được: ${tongSoLuong}</div>
                </div>
                <div class="col-1"></div>

            </div>

            <form action="/t-shirt-luxury/admin/thong-ke/loc" method="post">
            <div class="row g-2 mt-2 justify-content-end align-items-end">
                <!-- Input Ngày Bắt Đầu -->

                <div class="col-auto">
                    <div class="form-floating">
                        <input id="floatingInputNgayBatDau"
                               type="date"
                               class="form-control"
                               placeholder="Ngày Bắt Đầu"
                               name="ngayBatDau"
                               >
                        <label for="floatingInputNgayBatDau">Ngày Bắt Đầu</label>
                    </div>
                </div>

                <!-- Input Ngày Kết Thúc -->
                <div class="col-auto">
                    <div class="form-floating">
                        <input id="floatingInputNgayKetThuc"
                               type="date"
                               class="form-control"
                               placeholder="Ngày Kết Thúc"
                               name="ngayKetThuc"
                               >
                        <label for="floatingInputNgayKetThuc">Ngày Kết Thúc</label>
                    </div>
                </div>

                <!-- Button Lọc -->
                <div class="col-auto">
                    <button type="submit" class="btn btn-dark">Lọc</button>
                </div>

            </div>
            </form>

            <div class="row mt-2">

                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th scope="col">Mã Hóa Đơn</th>
                        <th scope="col">Ngày Tạo</th>
                        <th scope="col">Loại Hóa Đơn</th>
                        <th scope="col">Tổng Tiền</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${hoaDonList}" var="hdtk" >
                    <tr>
                        <th scope="row">${hdtk.maHoaDon}</th>
                        <td>${hdtk.ngayTao}</td>
                        <td>
                            <c:if test="${hdtk.loaiHoaDon == 1}">
                                <span class="badge bg-success">Hóa Đơn Online</span>
                            </c:if>
                            <c:if test="${hdtk.loaiHoaDon == 0}">

                                <span class="badge bg-secondary">Hóa Đơn Tại Quầy</span>
                            </c:if>
                        </td>
                        <td><fmt:formatNumber value='${hdtk.tongTien}' pattern="#,##0"/></td>
                    </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>
