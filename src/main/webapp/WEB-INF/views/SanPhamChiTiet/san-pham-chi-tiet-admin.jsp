<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body style="max-width: 1461px">
<div class="wrapper">
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
                        <img src="${pageContext.request.contextPath}/images/user.jpg" class="rounded-circle" alt="..."
                             width="40px" height="40px">
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

    <div class="row">
        <div class="col-3 " style="">
            <div class="list-group ">
                <a href="/t-shirt-luxury/admin" class="list-group-item list-group-item-action action"
                   aria-current="true">
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
                        <li><a class="dropdown-item" href="/t-shirt-luxury/admin/mau-sac"><i
                                class="fa-solid fa-palette"></i> Màu
                            Sắc</a></li>
                        <li><a class="dropdown-item" href="/t-shirt-luxury/admin/size"><i class="fa-solid fa-s"></i>
                            Size</a></li>
                        <li><a class="dropdown-item" href="/t-shirt-luxury/admin/chat-lieu"><i
                                class="fa-solid fa-star"></i> Chất
                            Liệu</a></li>
                        <li><a class="dropdown-item" href="/t-shirt-luxury/admin/danh-muc"><i
                                class="fa-solid fa-table-list"></i> Danh
                            Mục</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="col-9" style="">
            <div class="p-2 bd-highlight d-flex justify-content-start mt-3">
                <a type="button" href="/t-shirt-luxury/admin/san-pham" class="btn btn-outline-secondary">
                    <i class="fa-solid fa-backward"></i> Trở lại
                </a>
            </div>
            <div class="row mt-2">
                <h2 class="">Quản Lý Sản Phẩm Chi Tiết</h2>

                <div class="p-2 bd-highlight d-flex justify-content-end">
                    <button type="button" class="btn btn-outline-success" data-bs-toggle="modal"
                            data-bs-target="#themSanPhamChiTiet">
                        <i class="fa-solid fa-circle-plus"></i> Thêm Mới
                    </button>
                </div>
                <p style="color: red;text-align: center;font-weight: 500;font-size: 24px">${error}</p>
                <p>${tenSanPham}</p>
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th scope="col">STT</th>
                        <th scope="col">Tên Sản Phẩm</th>
                        <%--                    <th scope="col">Ảnh Sản Phẩm</th>--%>
                        <th scope="col">Size</th>
                        <th scope="col">Chất Liệu</th>
                        <th scope="col">Màu Sắc</th>
                        <th scope="col">Số Lượng</th>
                        <th scope="col">Giá Tiền</th>
                        <th scope="col">Khối Lượng (g)</th>
                        <th scope="col">Hành Động</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:if test="${not empty spct}">
                        <c:forEach items="${spct}" var="s" varStatus="i">
                            <tr>
                                <td>${i.index + 1 + (currentPage * 5)}</td>
                                <td>${s.sanPham.tenSanPham}</td>
                                <td>${s.size.tenSize}</td>
                                <td>${s.chatLieu.tenChatLieu}</td>
                                <td>${s.mauSac.tenMauSac}</td>
                                <td>${s.soLuong}</td>
                                <td><fmt:formatNumber value="${s.gia}" pattern="#,##0"/></td>
                                <td>${s.khoiLuongSanPham}</td>
                                <td>
                                    <a href="/t-shirt-luxury/admin/sua-san-pham-chi-tiet/getOne?id=${s.id}" class="btn btn-warning rounded-pill">
                                        <i class="fa-solid fa-pen-to-square"></i>
                                    </a>
                                    <a href="/t-shirt-luxury/admin/san-pham-chi-tiet/delete?id=${s.id}" class="btn btn-danger rounded-pill" onclick="return confirmDelete()">
                                        <i class="fa-solid fa-trash"></i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:if>


                    </tbody>
                </table>


            </div>
        </div>
    </div>

    <!-- --Modal-- -->
    <form action="/t-shirt-luxury/admin/san-pham-chi-tiet/add" method="POST"  enctype="multipart/form-data"x`>
        <div class="modal fade" id="themSanPhamChiTiet" tabindex="-1" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" style="max-width: 800px">
                <div class="modal-content" style="width: 800px">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Thêm Mới Sản Phẩm Chi Tiết</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" name="id" value="${idSanPham}">
                        <%--                        <div class="form-floating mb-3">--%>
                        <%--                            <input type="number" class="form-control" id="floatingInput" placeholder="Tên Sản Phẩm"--%>
                        <%--                                     value="${idSanPham}">--%>
                        <%--                            <label for="floatingInput">Tên Sản Phẩm</label>--%>
                        <%--                        </div>--%>
                        <%--                        <div class="mb-3">--%>

                        <div class="mb-3">
                            <label class="form-label">Chọn Size Sản Phẩm</label>
                            <select class="form-select" aria-label="Default select example" name="id_size">
                                <c:forEach var="size" items="${size}">
                                    <option value="${size.id}">${size.tenSize}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Chọn Chất Liệu Sản Phẩm</label>
                            <select class="form-select" aria-label="Default select example" name="id_chat_lieu">
                                <c:forEach var="chatLieu" items="${chatLieu}">
                                    <option value="${chatLieu.id}">${chatLieu.tenChatLieu}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Chọn Màu Sắc Sản Phẩm</label>
                            <select class="form-select" aria-label="Default select example" name="id_mau_sac">
                                <c:forEach var="mauSac" items="${mauSac}">
                                    <option value="${mauSac.id}">${mauSac.tenMauSac}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="form-floating mb-3 mt-3">
                            <input type="number" class="form-control" id="floatingInput" placeholder="Số Lượng"
                                   name="soLuong">
                            <label for="floatingInput">Số Lượng</label>
                        </div>

                        <div class="form-floating mb-3 mt-3">
                            <input type="number" class="form-control" id="floatingInput" placeholder="Giá Tiền"
                                   name="giaTien">
                            <label for="floatingInput">Giá Tiền</label>
                        </div>

                        <%--                        <div>--%>
                        <%--                            <div class="text mt-2">--%>
                        <%--                                Trạng Thái--%>
                        <%--                            </div>--%>
                        <%--                            <div class="form-check form-check-inline mt-2">--%>
                        <%--                                <input class="form-check-input" type="radio" name="trangThai" id="inlineRadio1"--%>
                        <%--                                       value="1" checked>--%>
                        <%--                                <label class="form-check-label" for="inlineRadio1">Bán</label>--%>
                        <%--                            </div>--%>
                        <%--                            <div class="form-check form-check-inline mt-2">--%>
                        <%--                                <input class="form-check-input" type="radio" name="trangThai" id="inlineRadio2"--%>
                        <%--                                       value="0">--%>
                        <%--                                <label class="form-check-label" for="inlineRadio2">Chưa Bán</label>--%>
                        <%--                            </div>--%>
                        <%--                        </div>--%>
                        <div class="form-floating mb-3 mt-3">
                            <input type="number" class="form-control" id="floatingInput" placeholder="Khối Lượng"
                                   name="khoiLuongSanPham">
                            <label for="floatingInput">Khối Lượng(gam)</label>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Chọn Ảnh Sản Phẩm</label>
                            <input type="file" class="form-control" name="anhSanPham" accept="image/*">
                        </div>

                        <div class="mb-3">
                            <label for="exampleFormControlTextarea1" class="form-label">Mô tả sản phẩm</label>
                            <textarea class="form-control" id="exampleFormControlTextarea1" name="moTa"
                                      rows="3"></textarea>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                        <button type="submit" class="btn btn-success">Thêm Mới</button>
                    </div>
                </div>
            </div>
        </div>
    
    </form>


    <div class="modal fade" id="themAnhSanPhamChiTiet" tabindex="-1" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" style="max-width: 800px">
            <div class="modal-content" style="width: 800px">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Chọn Ảnh Sản Phẩm Chi Tiết</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="container">
                        <div class="row">
                            <c:forEach items="${listAnh}" var="anhSP" varStatus="status">
                            <div class="col-6 mb-3">
                                <div class="card">
                                    <img src="${pageContext.request.contextPath}/images/${anhSP.tenAnhSanPham}"
                                         class="card-img-top img-fluid" style="max-height: 200px;" alt="Ảnh sản phẩm">
                                    <div class="card-body text-center">
                                        <button type="button" class="btn btn-outline-primary btn-sm">Chọn</button>
                                    </div>
                                </div>
                            </div>
                            <!-- Xuống hàng mới sau mỗi 2 ảnh -->
                            <c:if test="${status.index % 2 == 1}">
                        </div><div class="row">
                        </c:if>
                        </c:forEach>
                    </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <!-- Điều hướng phân trang -->
                    <c:if test="${totalPages > 0}">
                        <nav aria-label="Page navigation">
                            <ul class="pagination justify-content-center">
                                <!-- Nút Previous -->
                                <li class="page-item ${currentPage == 0 ? 'disabled' : ''}">
                                    <a class="page-link" href="?id=${idSanPham}&page=${currentPage - 1}" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>

                                <!-- Các trang -->
                                <c:forEach begin="0" end="${totalPages - 1}" var="i">
                                    <li class="page-item ${i == currentPage ? 'active' : ''}">
                                        <a class="page-link" href="?id=${idSanPham}&page=${i}">${i + 1}</a>
                                    </li>
                                </c:forEach>

                                <!-- Nút Next -->
                                <li class="page-item ${currentPage == totalPages - 1 ? 'disabled' : ''}">
                                    <a class="page-link" href="?id=${idSanPham}&page=${currentPage + 1}" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </c:if>



                    <c:if test="${empty spct}">
                        <p class="text-center">Không có sản phẩm chi tiết nào để hiển thị.</p>
                    </c:if>

                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                </div>
            </div>
        </div>
    </div>
    </div>
</div>
</body>
<script>
    confirmDelete = () => {
        return confirm("Bạn có chắc chắn muốn xóa sản phẩm chi tiết này không ?");
    }

</script>
</html>