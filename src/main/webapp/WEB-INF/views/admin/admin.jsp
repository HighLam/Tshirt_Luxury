<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>T-Shirt Luxury | ADMIN</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.png" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body style="max-width: 1460px;">

<div>
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


    <div class="row mt-3 ">
        <div class="col-3 " style="">
            <div class="list-group ">
                <a href="/t-shirt-luxury/admin" class="list-group-item list-group-item-action action"
                   aria-current="true">
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
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">

                    <form class="d-flex">
                        <input style="width: 600px;" class="form-control me-2" type="search" placeholder="Tìm sản phẩm"
                               aria-label="Search">

                        <ul style="list-style-type: none;">
                            <li class="nav-item mt-3">
                                <a href=""><i class="fa-solid fa-barcode" style="font-size: 30px; "></i></a>
                            </li>
                        </ul>
                    </form>

                </div>
            </nav>
            <div class="row">
                <div class="col-8">
                    <p>Sản phẩm</p>
                    <div class="SPCT" style="height: 250px; width: 730px; overflow-y: auto;">
                        <table class="table" style="width: 100%; table-layout: fixed;">
                            <thead>
                            <tr>
                                <th scope="col"
                                    style="width: 5%; position: sticky; top: 0; background: #fff; z-index: 1;">ID
                                </th>
                                <th scope="col"
                                    style="width: 10%; position: sticky; top: 0; background: #fff; z-index: 1;">Mã
                                </th>
                                <th scope="col"
                                    style="width: 35%; position: sticky; top: 0; background: #fff; z-index: 1;">Tên
                                </th>
                                <th scope="col"
                                    style="width: 20%; position: sticky; top: 0; background: #fff; z-index: 1;">Danh Mục
                                </th>
                                <th scope="col"
                                    style="width: 20%; position: sticky; top: 0; background: #fff; z-index: 1;">Trạng
                                    Thái
                                </th>
                                <th scope="col"
                                    style="width: 8%; position: sticky; top: 0; background: #fff; z-index: 1;">Thêm
                                </th>

                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${SP}" var="sp" varStatus="i">
                                <tr>
                                    <td>${i.index+1}</td>
                                    <td>${sp.maSanPham}</td>
                                    <td>${sp.tenSanPham}</td>
                                    <td>${sp.danhMuc.tenDanhMuc}</td>
                                    <td>${sp.trangThai==1 ? "Dang Ban" : "Chua Ban"}</td>
                                    <td><a class="btn btn-themCTSP" data-bs-toggle="modal" data-bs-target="#themSanPham"
                                           data-id="${sp.id}" href="#"><i class="fa-solid fa-check"></i></a></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>


                    <hr>
                    <div class="HDCT">

                        <table class="table">
                            <thead>
                            <tr>
                                <th scope="col">STT</th>
                                <th scope="col">Tên Sản Phẩm</th>
                                <th scope="col">Size</th>
                                <th scope="col">Màu Sắc</th>
                                <th scope="col">Số Lượng</th>
                                <th scope="col">Đơn Giá</th>
                                <th scope="col">Thành Tiền</th>
                                <th scope="col">Chức Năng</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="s" items="${HDCT}" varStatus="i">
                                <tr>
                                    <th scope="row">${i.index+1}</th>
                                    <td>${s.sanPhamChiTiet.sanPham.tenSanPham}</td>
                                    <td>${s.sanPhamChiTiet.size.tenSize}</td>
                                    <td>${s.sanPhamChiTiet.mauSac.tenMauSac}</td>
                                    <td>${s.soLuong}</td>
                                    <td>${s.sanPhamChiTiet.gia}</td>
                                    <td>${s.soLuong * s.sanPhamChiTiet.gia}</td>
                                    <td class="text-center">
                                        <a class="btn" href="/t-shirt-luxury/admin/delete-hdct?id=${s.id}"
                                           onclick="return confirmDelete()"><i class="fa-solid fa-trash"></i></a>
                                    </td>
                                </tr>
                            </c:forEach>


                            </tbody>
                        </table>
                    </div>
                </div>


                <div class="col-4" style="border-left: 1px solid black;">
                    <div class="TTDH" style="height:500px ;">

                        <h5>Thông tin đơn hàng</h5>
                        <hr>
                        <div class="voucher ">
                            <label for="floatingInput">Voucher</label>
                            <div class="d-flex justify-content mt-2">
                                <form action="/t-shirt-luxury/admin/ap-dung-voucher" method="post">
                                    <select class="form-select" aria-label="Default select example" name="idVc" >
                                        <c:forEach var="vc" items="${voucher}" >
                                            <option  value="${vc.id}">${vc.tenVoucher}</option>
                                        </c:forEach>
                                    </select>
                                    <button   class="btn btn-secondary" type="submit" style="margin-left: 10px;">Áp Dụng
                                    </button>
                                </form>
                            </div>

                        </div>
                        <form action="/t-shirt-luxury/admin/thanh-toan" method="post">

                            <div >
                                <div class="d-flex justify-content-between">
                                    <p>Số lượng sản phẩm: </p>
                                    <p>${soLuongSanPhamMua}</p>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <p>Tổng tiền</p>
                                    <p>${tongTien}đ</p>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <p>Chiết khấu</p>
                                    <p>${tongTien-giamHoaDon}</p>
                                </div>
                                <hr>
                                <div class="d-flex justify-content-between">
                                    <h6>Khách phải trả</h6>
                                    <input type="number" readonly name="tongTienHoaDon" value ="${giamHoaDon}">
                                </div>
                                <div class="d-flex justify-content-between">
                                    <p>Tiền khách đưa</p>
                                    <input type="number" id="tienKhachDua" oninput="saveTemporary()">
                                </div>
                                <div class="d-flex justify-content-between">
                                    <p>Tiền thừa</p>
                                    <p>${tongTien}đ</p>
                                </div>
                            </div>


                        <div class="btnHoaDon mt-5 d-flex justify-content-end me-5">
                            <button class="btn btn-secondary">Hủy</button>
                            <button type="submit" class="btn btn-dark ms-3">Thanh toán</button>
                        </div>
                        </form>

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
                <h5 class="modal-title" id="exampleModalLabel"></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/t-shirt-luxury/admin/getIdMau" method="POST">
                <div class="modal-body d-flex flex-column">

                    <h6>Màu sắc:</h6>
                    <div class="box-mau-sac d-flex">

                    </div>
                    <hr>
                    <h6>Size:</h6>
                    <div class="box-size d-flex">

                    </div>
                    <div class="form-floating mb-3">
                        <input type="number" class="form-control" placeholder="Số Lượng" name="soLuong">
                        <label>Số Lượng</label>
                    </div>


                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                    <button type="submit" class="btn btn-primary">Thêm</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    $(".btn-themCTSP").click(function (e) {
        e.preventDefault();

        // Lấy idTEST từ data-id của nút
        const idReponse = $(this).data("id");

        // Gửi AJAX đến server
        $.ajax({
            url: "/t-shirt-luxury/admin/getMauAndSize",
            type: "GET",
            data: {idRequest: idReponse},
            success: function (response) {
                // Hiển thị ID sản phẩm trong modal với dữ liệu nhận được từ server
                $("#exampleModalLabel").text(response.tenSanPham);


                // Xóa nội dung cũ của .box-mau-sac để tránh tạo thêm các mục trùng lặp
                $(".box-mau-sac").empty();

                // Lặp qua danh sách tên màu sắc và tạo một checkbox hoặc label cho từng màu
                response.listMauSac.forEach(function (mauSac) {
                    // Tạo label cho mỗi màu sắc
                    const colorLabel = $("<label></label>")
                        .text(mauSac.tenMauSac)
                        .attr("class", "btn btn-outline-secondary")
                        .css({"margin": "5px", "display": "block", "width": "auto"})
                        .attr("for", "option" + mauSac.id)
                        .attr("id", "label-" + mauSac.id)


                    // Tạo checkbox nếu cần thiết
                    const colorCheckbox = $("<input/>")

                        .attr("type", "checkbox")
                        .attr("autocomplete", "off")
                        .attr("value", mauSac.id)
                        .attr("class", "btn-check")
                        .attr("id", "checked-" + mauSac.id)
                        .attr("name", "idMau");


                    // Thêm checkbox vào label
                    colorLabel.prepend(colorCheckbox);

                    // Thêm label vào container
                    $(".box-mau-sac").append(colorLabel);

                    // Sự kiện nhấp vào label màu sắc
                    $(document).on("click", "[id^='label-']", function () {
                        // Lấy ID của label được nhấp
                        const id = $(this).attr("id").split('-')[1]; // Lấy phần ID sau 'label-'

                        // Xóa CSS từ tất cả label màu
                        $(".box-mau-sac [id^='label-']").removeClass("bg-secondary").css("color", "");

                        // Thêm CSS cho label được nhấp
                        $(this).addClass("bg-secondary").css("color", "#ffff");

                        // Bỏ checked cho tất cả checkbox trong box-mau-sac
                        $(".box-mau-sac .btn-check").prop("checked", false); // Bỏ checked

                        // Đánh dấu checkbox tương ứng với label được nhấp
                        $("#checked-" + id).prop("checked", true); // Đánh dấu checkbox là checked

                        console.log(id); // In ID ra console để kiểm tra
                    });


                });


                // Xóa nội dung cũ của .box-size để tránh tạo thêm các mục trùng lặp
                $(".box-size").empty();


                // Lặp qua danh sách tên size và tạo một checkbox hoặc label cho từng size
                response.listSize.forEach(function (Size) {
                    // Tạo một label cho từng size
                    const sizeLabel = $("<label></label>")
                        .text(Size.tenSize)
                        .addClass("btn btn-outline-secondary ")
                        .css({"margin": "5px", "display": "block", "width": "auto"})
                        .attr("id", "size-" + Size.id);
                    // Tạo checkbox nếu cần thiết
                    const sizeCheckbox = $("<input>")
                        .attr("type", "checkbox")
                        .attr("name", "idSize")
                        .attr("value", Size.id)
                        .attr("autocomplete", "off")
                        .addClass("btn-check")
                        .attr("id", "checked-size" + Size.id)

                    // Thêm checkbox vào label
                    sizeLabel.prepend(sizeCheckbox);

                    // Thêm label vào .modal-body
                    $(".box-size").append(sizeLabel);
                    // Sự kiện nhấp vào label kích thước
                    $(document).on("click", "[id^='size-']", function () {
                        // Lấy ID thực sự của label size được nhấp
                        const id = $(this).attr("id").split('-')[1]; // Lấy phần ID sau 'label-'

                        // Xóa CSS từ tất cả các label size khác
                        $(".box-size [id^='size-']").removeClass("bg-secondary").css("color", "");

                        // Thêm CSS cho label được nhấp
                        $(this).addClass("bg-secondary").css("color", "#ffff");

                        // Bỏ checked cho tất cả các checkbox trong box-size
                        $(".box-size .btn-check").prop("checked", false);

                        // Đánh dấu checkbox tương ứng với label size được nhấp
                        $("#checked-size" + id).prop("checked", true);

                        console.log(id); // In ID ra console để kiểm tra
                    });

                });

                // Mở modal
                $("#themSanPham").modal("show");
            },
            error: function (xhr, status, error) {
                console.log("Có lỗi xảy ra:", error);
            }
        });
    });


    confirmDelete = () => {
        return confirm("Bạn có chắc muốn xóa ?");
    }
    function saveTemporary() {
        // Lấy giá trị từ ô input
        const value = document.getElementById("tienKhachDua").value;
        // Lưu vào sessionStorage với key là 'tienKhachDua'
        sessionStorage.setItem("tienKhachDua", value);
    }

    // Khi trang tải lại, kiểm tra nếu đã có giá trị trong sessionStorage thì hiển thị lại
    window.onload = function() {
        const savedValue = sessionStorage.getItem("tienKhachDua");
        if (savedValue) {
            document.getElementById("tienKhachDua").value = savedValue;
        }
    }
</script>
</html>