<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>T-Shirt Luxury | ADMIN</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
          crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

    <script src="../js/script.js"></script>
</head>

<body class="container">
<div>
    <jsp:include page="/WEB-INF/views/fragments/headerAdmin.jsp" />


    <div class="row mt-3 ">
<<<<<<< HEAD
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
                        <li><a class="dropdown-item" href="/t-shirt-luxury/admin/anh-san-pham"><i class="fa fa-image"></i> Ảnh Sản Phẩm</a></li>
                    </ul>
                </div>
            </div>
        </div>
=======
        <jsp:include page="/WEB-INF/views/fragments/menuAdmin.jsp" />
>>>>>>> ab554ba1bd4150e4eedff920d98c81474fcf9d0a
        <div class="col-9" style="">
            <div class="row">
                <h2 class="">Sửa Sản Phẩm</h2>
                <form action="/t-shirt-luxury/admin/updateSanPhamChiTiet?id=${SPCT.id}" method="POST">
                    <div>

                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <!-- Mã Sản Phẩm -->
                        <div class="form-floating mb-3">
<<<<<<< HEAD
                            <input readonly type="text" class="form-control" id="floatingInput" placeholder="Mã Voucher" name="maVoucher" value="${voucher.maVoucher}">
                            <label for="floatingInput">Mã Voucher</label>
=======
                            <input type="text" class="form-control" placeholder="Tên Sản Phẩm" disabled
                                   readonly value="${SPCT.sanPham.tenSanPham}">
                            <label for="floatingInput">Tên Sản Phẩm</label>
>>>>>>> ab554ba1bd4150e4eedff920d98c81474fcf9d0a
                        </div>
                        <div class="form-floating mb-3 mt-3">
                            <input min="0" type="number" class="form-control" id="floatingInput"
                                   placeholder="Số Lượng" name="soLuong" value="${SPCT.soLuong}">
                            <label for="floatingInput">Số Lượng</label>
                        </div>
<<<<<<< HEAD
                        <div class="modal-footer">
                            <a href="/t-shirt-luxury/admin/voucher" class="btn btn-secondary">Đóng</a>
                            <button type="submit" class="btn btn-success">Cập nhật</button>
=======
                        <!-- Trạng Thái -->
                        <div>
                            <div class="text mt-2">Trạng Thái</div>
                            <div class="form-check form-check-inline mt-2">
                                <input class="form-check-input" type="radio" name="trangThai"
                                       id="inlineRadio1" value="1" ${SPCT.trangThai==1 ? 'checked' :''}>
                                <label class="form-check-label" for="inlineRadio1">Bán</label>
                            </div>
                            <div class="form-check form-check-inline mt-2">
                                <input class="form-check-input" type="radio" name="trangThai"
                                       id="inlineRadio2" value="0" ${SPCT.trangThai==0 ? 'checked' :''}>
                                <label class="form-check-label" for="inlineRadio2">Chưa Bán</label>
                            </div>
>>>>>>> ab554ba1bd4150e4eedff920d98c81474fcf9d0a
                        </div>
                    </div>
                    <div class="p-2 bd-highlight d-flex justify-content-end">
                        <button type="submit" class="btn btn-outline-warning">
                            <i class="fa-solid fa-pen"></i> Cập nhật
                        </button>
                    </div>
                </form>


            </div>
        </div>
    </div>
</div>


<<<<<<< HEAD
<script>
    $(document).ready(function() {
        // Kiểm tra nếu errorMessage có giá trị (lỗi tồn tại)
        if ($('#errorTenVoucher').text().trim() !== '') {
            // Nếu có lỗi, set giá trị của input là rỗng
            $('#floatingInputTenVoucher').val('');
        }
        if ($('#errorGiaTriGiamVoucher').text().trim() !== '') {
            // Nếu có lỗi, set giá trị của input là rỗng
            $('#floatingInputGiaTriGiamVoucher').val('');
        }
        if ($('#errorSoLuongVoucher').text().trim() !== '') {
            // Nếu có lỗi, set giá trị của input là rỗng
            $('#floatingInputSoLuongVoucher').val('');
        }
        if ($('#errorMucChiVoucher').text().trim() !== '') {
            // Nếu có lỗi, set giá trị của input là rỗng
            $('#floatingInputMucChiVoucher').val('');
        }
        if ($('#errorGioiHanVoucher').text().trim() !== '') {
            // Nếu có lỗi, set giá trị của input là rỗng
            $('#floatingInputGioiHanVoucher').val('');
        }
    });
</script>

=======





</div>
>>>>>>> ab554ba1bd4150e4eedff920d98c81474fcf9d0a
</body>

</html>