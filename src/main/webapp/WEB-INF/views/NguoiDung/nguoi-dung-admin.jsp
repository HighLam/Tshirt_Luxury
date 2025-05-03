<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
        contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <link
            rel="apple-touch-icon"
            sizes="76x76"
            href="../assets/img/apple-icon.png"
    />
    <link rel="icon" type="image/png" href="../assets/img/favicon.png" />
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
            rel="stylesheet"
    />
    <title>Quản lý người dùng | T-Luxury</title>
    <!-- Fonts and icons -->
    <link
            href="https://fonts.googleapis.com/css?family=Inter:300,400,500,600,700,800"
            rel="stylesheet"
    />
    <!-- Nucleo Icons -->
    <link
            href="https://demos.creative-tim.com/soft-ui-dashboard/assets/css/nucleo-icons.css"
            rel="stylesheet"
    />
    <link
            href="https://demos.creative-tim.com/soft-ui-dashboard/assets/css/nucleo-svg.css"
            rel="stylesheet"
    />
    <!-- Font Awesome Icons -->
    <script
            src="https://kit.fontawesome.com/42d5adcbca.js"
            crossorigin="anonymous"
    ></script>
    <!-- CSS Files -->
    <link rel="stylesheet" href="../css/soft-ui-dashboard.css" />
    <!-- Nepcha Analytics (nepcha.com) -->
    <!-- Nepcha is a easy-to-use web analytics. No cookies and fully compliant with GDPR, CCPA and PECR. -->
    <script
            defer
            data-site="YOUR_DOMAIN_HERE"
            src="https://api.nepcha.com/js/nepcha-analytics.js"
    ></script>
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
    <link
            rel="shortcut icon"
            href="../images/favicon.png"
            type="image/x-icon"
    />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<<<<<<< HEAD

<%--    <script src="../js/script.js"></script>--%>

=======
    <link rel="stylesheet" href="../css/button.css" />
>>>>>>> ab554ba1bd4150e4eedff920d98c81474fcf9d0a
</head>

<body class="g-sidenav-show bg-gray-100 text-sm">
<!-- <jsp:include page="/WEB-INF/views/fragments/headerAdmin.jsp" /> -->

<div class="mt-3">
    <jsp:include page="/WEB-INF/views/fragments/menuAdmin.jsp" />
    <main class="main-content max-height-vh-100 h-100 border-radius-lg pe-3">
        <!-- Navbar -->
        <nav
                class="navbar navbar-main navbar-expand-lg px-0 shadow-none border-radius-xl"
                id="navbarBlur"
                navbar-scroll="true"
        >
            <nav aria-label="breadcrumb">
                <ol
                        class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5"
                >
                    <li class="breadcrumb-item text-sm">
                        <a class="opacity-5 text-dark" href="javascript:;">Pages</a>
                    </li>
                    <li
                            class="breadcrumb-item text-sm text-dark active"
                            aria-current="page"
                    >
                        Quản lý người dùng
                    </li>
                </ol>
            </nav>
        </nav>
        <!-- End Navbar -->

        <div>
            <h2>Quản Lý Người Dùng</h2>
            <div>
                <nav>
                    <div class="/admin/user">
                        <form action="" method="GET" class="row g-1 w-100">
                            <!-- Ô tìm kiếm -->
                            <div class="col-5">
                                <input
                                        type="text"
                                        name="keyword"
                                        placeholder="Tìm kiếm theo username hoặc email"
                                        value="${keyword}"
                                        style="font-size: 14px"
                                        class="form-control"
                                />
                            </div>

                            <div class="col-5 d-flex justify-content-between">
                                <button
                                        style="font-size: 14px"
                                        class="btn btn-success flex-fill mx-1"
                                        type="submit"
                                >
                                    <i class="bi bi-search me-1"></i> Tìm Kiếm
                                </button>

                                <a
                                        href="/admin/user"
                                        style="font-size: 14px"
                                        class="btn btn-secondary flex-fill mx-1"
                                >
                                    <i class="bi bi-arrow-clockwise"></i> Reset
                                </a>

                                <button
                                        type="button"
                                        class="btn btn-outline-primary flex-fill mx-1"
                                        style="font-size: 14px"
                                        data-bs-toggle="modal"
                                        data-bs-target="#themNguoiDung"
                                >
                                    <i class="fa-solid fa-circle-plus"></i> Thêm Mới
                                </button>
                            </div>
                        </form>
                    </div>
                </nav>
            </div>

            <table class="table border rounded">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Tên Người Dùng</th>
                    <th scope="col">Email</th>
                    <th scope="col">Chức Vụ</th>
                    <th scope="col">Trạng Thái</th>
                    <th scope="col" class="text-end">Hành Động</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${listUser}" var="nd" varStatus="i">
                    <tr>
                        <th class="text-center align-middle" scope="row">
                                ${i.index + 1}
                        </th>
                        <td class="align-middle">${nd.username}</td>
                        <td class="align-middle">${nd.email}</td>
                        <td class="align-middle">${nd.role}</td>
                        <td class="align-middle">
                            <c:if test="${nd.status == true}">
                                <span class="badge bg-success">Hoạt Động</span>
                            </c:if>
                            <c:if test="${nd.status == false}">
                                <span class="badge bg-danger">Không Hoạt Động</span>
                            </c:if>
                        </td>
                        <td class="align-middle d-flex justify-content-end">
                            <a
                                    class="btn edit-btn mb-0"
                                    data-bs-toggle="modal"
                                    data-bs-target="#editModal"
                                    data-id="${nd.id}"
                                    data-username="${nd.username}"
                                    data-status="${nd.status}"
                                    data-email="${nd.email}"
                                    data-role="${nd.role}"
                                    title="Chỉnh Sửa"
                            >
                                <i class="fa-solid fa-pen-to-square"></i>
                            </a>

                            <a
                                    onclick="return confirmDelete()"
                                    class="btn delete-btn mb-0"
                                    data-toggle="tooltip"
                                    data-placement="top"
                                    data-id="${nd.id}"
                                    title="Xóa"
                            >
                                <i class="fa-solid fa-trash"></i>
                            </a>

                            <a
                                    href="/admin/nguoi-dung-chi-tiet"
                                    class="btn mb-0"
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

        <!-- Modal Thêm Mới -->
        <div
                class="modal fade"
                id="themNguoiDung"
                tabindex="-1"
                aria-labelledby="exampleModalLabel"
                aria-hidden="true"
        >
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">
                            Thêm Mới Người Dùng
                        </h5>
                        <button
                                type="button"
                                class="btn-close"
                                data-bs-dismiss="modal"
                                aria-label="Close"
                        ></button>
                    </div>
                    <form action="/admin/user/post" method="POST">
                        <div class="modal-body d-flex flex-column gap-2">
                            <div class="form-group">
                                <label class="mb-1" for="username">Tên Người Dùng:</label>
                                <input
                                        type="string"
                                        class="form-control"
                                        id="username"
                                        aria-describedby="emailHelp"
                                        placeholder="Nhập tên người dùng"
                                        name="username"
                                        required
                                />
                            </div>

                            <div class="form-group">
                                <label class="mb-1" for="email">Email:</label>
                                <input
                                        type="email"
                                        name="email"
                                        class="form-control"
                                        id="email"
                                        aria-describedby="email"
                                        placeholder="Nhập Email"
                                />
                            </div>

                            <div class="form-group">
                                <label class="mb-1" for="password">Mật Khẩu:</label>
                                <input
                                        type="password"
                                        class="form-control"
                                        id="password"
                                        aria-describedby="password"
                                        placeholder="Nhập mật khẩu"
                                        name="password"
                                />
                            </div>

                            <div class="form-group">
                                <label class="mb-1" for="password">Vai Trò:</label>
                                <select id="role" name="role" class="form-select">
                                    <option value="USER">USER</option>
                                    <option value="ADMIN">ADMIN</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label class="mb-1" for="password">Trạng Thái:</label>
                                <select id="status" name="status" class="form-select">
                                    <option value="1">Hoạt Động</option>
                                    <option value="0">Không Hoạt Động</option>
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button
                                    type="button"
                                    class="btn btn-secondary"
                                    data-bs-dismiss="modal"
                            >
                                Đóng
                            </button>
                            <button type="submit" class="btn btn-success">
                                Thêm Mới
                            </button>
                        </div>
                    </form>
                </div>
            </div>
<<<<<<< HEAD
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
                        <li><a class="dropdown-item" href="/t-shirt-luxury/admin/anh-san-pham"><i class="fa fa-image"></i> Ảnh Sản Phẩm</a></li>
                    </ul>
                </div>
            </div>
=======
>>>>>>> ab554ba1bd4150e4eedff920d98c81474fcf9d0a
        </div>

        <!-- Modal Edit -->
        <form id="editUserForm" method="POST">
            <div
                    class="modal fade"
                    id="editModal"
                    tabindex="-1"
                    aria-labelledby="editModalLabel"
                    aria-hidden="true"
            >
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="editModalLabel">
                                Chỉnh Sửa Người Dùng
                            </h5>
                            <button
                                    type="button"
                                    class="btn-close"
                                    data-bs-dismiss="modal"
                                    aria-label="Close"
                            ></button>
                        </div>
                        <div class="modal-body d-flex flex-column gap-2">
                            <input type="hidden" id="userId" name="id" />

                            <div class="form-group">
                                <label class="mb-1" for="username">Tên Người Dùng:</label>
                                <input
                                        type="text"
                                        class="form-control"
                                        id="usernameU"
                                        name="username"
                                        placeholder="Nhập tên người dùng"
                                        required
                                        readonly
                                />
                            </div>

                            <div class="form-group">
                                <label class="mb-1" for="email">Email:</label>
                                <input
                                        type="email"
                                        class="form-control"
                                        id="emailU"
                                        name="email"
                                        placeholder="Nhập Email"
                                />
                            </div>

                            <div class="form-group">
                                <label class="mb-1" for="password">Mật Khẩu:</label>
                                <input
                                        type="password"
                                        class="form-control"
                                        id="passwordU"
                                        name="password"
                                        placeholder="Nhập mật khẩu"
                                />
                            </div>

                            <div class="form-group">
                                <label class="mb-1" for="role">Vai Trò:</label>
                                <select id="roleU" name="role" class="form-select">
                                    <option value="USER">USER</option>
                                    <option value="ADMIN">ADMIN</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label class="mb-1" for="status">Trạng Thái:</label>
                                <select id="statusU" name="status" class="form-select">
                                    <option value="true">Hoạt Động</option>
                                    <option value="false">Không Hoạt Động</option>
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button
                                    type="button"
                                    class="btn btn-secondary"
                                    data-bs-dismiss="modal"
                            >
                                Đóng
                            </button>
                            <button type="submit" class="btn btn-success">
                                Cập Nhật
                            </button>
                        </div>
                    </div>
                </div>
<<<<<<< HEAD

                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Mã Người Dùng</th>
                        <th scope="col">Tên Người Dùng</th>
                        <th scope="col">Email</th>
                        <th scope="col">Chức Vụ</th>
                        <th scope="col">Trạng Thái</th>
                        <th scope="col">Mô Tả</th>
                        <th scope="col">Hành Động</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${listNguoiDung}" var="nd" varStatus="i">
                        <tr>
                            <th scope="row">${i.index + 1}</th>
                            <td>${nd.maNguoiDung}</td>
                            <td>${nd.tenNguoiDung}</td>
                            <td>${nd.email}</td>
                            <td>${nd.chucVu.tenChucVu}</td>
                            <td>
                                <c:if test="${nd.trangThai == 1}">
                                    <span class="badge bg-success">Hoạt Động</span>
                                </c:if>
                                <c:if test="${nd.trangThai == 0}">

                                    <span class="badge bg-danger">Không Hoạt Động</span>
                                </c:if>
                            </td>
                            <td>${nd.moTa}</td>
                            <td>
                                <button class="btn btn-warning rounded-pill" data-toggle="tooltip"
                                        data-placement="top" data-bs-toggle="modal" data-bs-target="#suaNguoiDung"
                                        title="Chỉnh Sửa">
                                    <a href="/t-shirt-luxury/admin/getOne?id=${nd.id}" style="color:#000" class="modalSua">
                                        <i class="fa-solid fa-pen-to-square"></i>
                                    </a>
                                </button>

                                <button class="btn btn-danger rounded-pill" data-toggle="tooltip"
                                        data-placement="top" title="Xóa">
                                    <a href="/t-shirt-luxury/admin/xoaNguoiDung/${nd.id}" onclick="return confirmDelete()"  style="color:#000">
                                        <i class="fa-solid fa-trash"></i>
                                    </a>
                                </button>

                            </td>
                        </tr>
                    </c:forEach>


                    </tbody>
                </table>
=======
>>>>>>> ab554ba1bd4150e4eedff920d98c81474fcf9d0a
            </div>
        </form>
    </main>
</div>

<<<<<<< HEAD

<!-- Modal -->
<div class="modal fade" id="themNguoiDung" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Thêm Mới Người Dùng</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/t-shirt-luxury/admin/taoNguoiDung" method="POST">

                <div class="modal-body">
<%--                    <div class="form-floating mb-3">--%>
<%--                        <input name="maNguoiDung" type="text" class="form-control" id="floatingInput" placeholder="Mã Người Dùng">--%>
<%--                        <label for="floatingInput">Mã Người Dùng</label>--%>
<%--                    </div>--%>

                    <div class="form-floating mb-3">
                        <input name="tenNguoiDung" type="text" class="form-control" id="floatingInput" placeholder="Tên Người Dùng">
                        <label for="floatingInput">Tên Người Dùng</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input name="email" type="text" class="form-control" id="floatingInput" placeholder="Email">
                        <label for="floatingInput">Email</label>
                    </div>
                    <select class="form-select" aria-label="Default select example" name="chucVu.id">
                        <c:forEach items="${listChucVu}" var="cv">
                            <option selected hidden="hidden" value="3">Chọn chức vụ</option>
                            <option value="${cv.id}">${cv.tenChucVu}</option>
                        </c:forEach>

                    </select>
                    <div class="mt-3">
                        <div class="text mt-2">
                            Trạng Thái
                        </div>
                        <div class="form-check form-check-inline mt-2">
                            <input class="form-check-input" type="radio" name="trangThai" id="hoatDong"
                                   value="1">
                            <label class="form-check-label" for="inlineRadio1">Hoạt Động</label>
                        </div>
                        <div class="form-check form-check-inline mt-2">
                            <input class="form-check-input" type="radio" name="trangThai" id="khongHoatDong"
                                   value="0">
                            <label class="form-check-label" for="inlineRadio2">Không Hoạt Động</label>
                        </div>
                    </div>
                    <div class="mb-3 mt-3">
                        <label for="exampleFormControlTextarea1" class="form-label">Mô tả</label>
                        <textarea class="form-control" id="exampleFormControlTextarea1" name="moTa" rows="3"></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                    <button type="submit" class="btn btn-success">Thêm Mới</button>
                </div>
            </form>

        </div>
    </div>
</div>


</div>
<script>
    confirmDelete = () => {
        return confirm("Bạn có chắc muốn xóa ?");
    }
</script>
=======
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="../js/actionUser.js"></script>
>>>>>>> ab554ba1bd4150e4eedff920d98c81474fcf9d0a
</body>
</html>
