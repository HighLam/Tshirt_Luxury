<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>T-Shirt Luxury | ADMIN</title>
    <link
            rel="shortcut icon"
            href="${pageContext.request.contextPath}/images/favicon.png"
            type="image/x-icon"
    />
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
            crossorigin="anonymous"
    />
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
    />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body class="container">

<div>
    <jsp:include page="/WEB-INF/views/fragments/headerAdmin.jsp" />

<<<<<<< HEAD
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
                    </ul>
                </div>
            </div>
        </div>
        <div class="col-9" style="">
=======
    <div class="row mt-3">
        <jsp:include page="/WEB-INF/views/fragments/menuAdmin.jsp" />
        <div class="col-9">
>>>>>>> ab554ba1bd4150e4eedff920d98c81474fcf9d0a
            <div class="row">
                <h2 class="">Quản Lý Hóa Đơn Online</h2>

                <nav class="navbar navbar-expand-lg navbar-light bg-light shadow-sm rounded">
                    <div class="container-fluid">
                        <form action="/t-shirt-luxury/admin/timHDO" method="get" class="d-flex align-items-center gap-2 w-100">
                            <!-- Ô tìm kiếm -->
                            <input
                                    name="searchTerm"
                                    class="form-control"
                                    type="search"
                                    placeholder="Tìm tên khách hàng hoặc mã hóa đơn"
                                    aria-label="Search"
                                    value="${searchTerm}"
                                    style="max-width: 600px;">

                            <!-- Dropdown chọn trạng thái -->
                            <select class="form-select" name="trangThai" id="trangThai" style="width: 30%;">
                                <option value="">-- Chọn Trạng Thái --</option>
                                <option value="0" ${trangThai == 0 ? 'selected' : ''}>Chờ thanh toán</option>
                                <option value="1" ${trangThai == 1 ? 'selected' : ''}>Đã thanh toán</option>
                                <option value="2" ${trangThai == 2 ? 'selected' : ''}>Chờ xác nhận</option>
                                <option value="3" ${trangThai == 3 ? 'selected' : ''}>Đang giao hàng</option>
                                <option value="4" ${trangThai == 4 ? 'selected' : ''}>Giao hàng thành công</option>
                            </select>

                            <!-- Nút tìm kiếm -->
                            <button class="btn btn-success d-flex align-items-center px-4 mt-2" type="submit">
                                <i class="bi bi-search me-1"></i> Tìm Kiếm
                            </button>

                            <!-- Nút reset -->
                            <a href="/t-shirt-luxury/admin/timHDO" class="btn btn-secondary d-flex align-items-center px-4 mt-2">
                                <i class="bi bi-arrow-clockwise me-1"></i> Reset
                            </a>
                        </form>
                    </div>
                </nav>


                <!-- <div class="p-2 bd-highlight d-flex justify-content-end">
                        <button type="button" class="btn btn-outline-success" data-bs-toggle="modal"
                            data-bs-target="#themSanPham">
                            <i class="fa-solid fa-circle-plus"></i> Thêm Mới
                        </button>
                    </div> -->

                <table class="table table-striped border rounded">
                    <thead>
                    <tr>
                        <th scope="col">STT</th>
                        <th scope="col">Mã Hóa Đơn</th>
                        <th scope="col">Tên Khách Hàng</th>
                        <th scope="col">Trạng Thái</th>
                        <th scope="col">Ngày Tạo</th>
                        <th scope="col">Ngày Sửa</th>
                        <th scope="col">Tổng Tiền</th>

                        <th scope="col">Hành Động</th>
                    </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listHoaDonOnline}" var="hd" varStatus="i">
                        <tr>
                            <td>${i.index +1}</td>
                            <td>${hd.maHoaDon}</td>
                            <td>${hd.thongTinNhanHang.hoVaTen}</td>
<<<<<<< HEAD
                                <%--                            <td>${hd.trangThai == 1 ? "Thành công" : (hd.trangThai == 2 ? "Chờ xác nhận" : "Đang giao hàng")}</td>--%>
=======
                                <%--
                                <td>
                                  ${hd.trangThai == 1 ? "Thành công" : (hd.trangThai == 2 ?
                                  "Chờ xác nhận" : "Đang giao hàng")}
                                </td>
                                --%>
>>>>>>> ab554ba1bd4150e4eedff920d98c81474fcf9d0a
                            <td>
                                <c:if test="${hd.trangThai == 0}">
                                    <span class="badge bg-primary">Chờ thanh toán</span>
                                </c:if>
                                <c:if test="${hd.trangThai == 1}">
                                    <span class="badge bg-success">Đã thanh toán</span>
                                </c:if>
                                <c:if test="${hd.trangThai == 2}">
                                    <span class="badge bg-secondary">Chờ xác nhận</span>
                                </c:if>
                                <c:if test="${hd.trangThai == 3}">
                        <span class="badge bg-warning text-dark"
                        >Đang giao hàng</span
                        >
                                </c:if>
                                <c:if test="${hd.trangThai == 4}">
                        <span class="badge bg-info text-dark"
                        >Giao hàng thành công</span
                        >
                                </c:if>
                            </td>
                            <td>${hd.ngayTao}</td>
                            <td>${hd.ngaySua}</td>

<<<<<<< HEAD
                            <td><fmt:formatNumber value='${hd.tongTien}' pattern="#,##0"/></td>

=======
                            <th scope="row">${i.index +1}</th>
                            <th scope="row">${hd.thongTinNhanHang.hoVaTen}</th>
                            <th scope="row">
                                <c:choose>
                                    <c:when test="${hd.trangThai == 0}">
                                        Chờ thanh toán
                                    </c:when>
                                    <c:when test="${hd.trangThai == 1}">
                                        Đã thanh toán
                                    </c:when>
                                    <c:when test="${hd.trangThai == 2}">
                                        Chờ xác nhận
                                    </c:when>
                                    <c:when test="${hd.trangThai == 3}">
                                        Đang giao hàng
                                    </c:when>
                                    <c:when test="${hd.trangThai == 4}">
                                        Đã giao hàng
                                    </c:when>
                                    <c:otherwise> </c:otherwise>
                                </c:choose>
                            </th>
                            <th scope="row">${hd.ngayTao}</th>
                            <th scope="row">${hd.tongTien}</th>
                            <th scope="row">${hd.moTa}</th>
>>>>>>> ab554ba1bd4150e4eedff920d98c81474fcf9d0a
                            <td>
                                <a
                                        href="/t-shirt-luxury/admin/hoa-don-online/detail?idHoaDonOnline=${hd.id}"
                                        class="btn btn-secondary rounded-pill"
                                        data-toggle="tooltip"
                                        data-placement="top"
                                        title="Xem Chi Tiết"
                                >
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