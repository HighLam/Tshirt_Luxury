<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

        <div class="row mt-3">
            <jsp:include page="/WEB-INF/views/fragments/menuAdmin.jsp" />
            <div class="col-9">
                <div class="row">
                    <h2>Quản Lý Ảnh Sản Phẩm</h2>
                    <div class="p-2 bd-hightlight d-flex justify-content-end">
                        <button
                        type="button"
                        class="btn btn-outline-success"
                        data-bs-toggle="modal"
                        data-bs-target="#themSanPham"
                        style="font-size: 14px"
                        >
                            <i class="fa-solid fa-circle-plus"></i> Thêm Mới

                        </button>
                    </div>
                    <table
                            class="table table-striped border rounded"
                            style="font-size: 14px"
                    >
                        <thead>
                        <tr>
                            <th scope="col">STT</th>
                            <th scope="col">Mã Ảnh SP</th>
                            <th scope="col">Tên Ảnh SP</th>
                            <th scope="col">Trạng Thái</th>
                            <th scope="col">Mô Tả</th>
                            <th scope="col">Hành Động</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${anhSanPham}" var="anh" varStatus="i">
                            <tr>
                                <th scope="row">${i.index + 1}</th>
                                <td>${anh.maAnhSanPham}</td>
                                <td>${anh.tenAnhSanPham}</td>
                                <td>
                                    <c:if test="${anh.trangThai == 1}"> Hoạt Động </c:if>
                                    <c:if test="${anh.trangThai == 0}">
                                        Không Hoạt Động
                                    </c:if>
                                </td>

                                <td>${anh.moTa}</td>
                                <td>
                                    <a
                                            class="btn btn-warning rounded-pill"
                                            data-toggle="tooltip"
                                            data-placement="top"
                                            href="/t-shirt-luxury/admin/anh-san-pham/getOne?id=${anh.id}"
                                            title="Chỉnh Sửa"
                                    ><i class="fa-solid fa-pen-to-square"></i
                                    ></a>
                                    <a
                                            href="/t-shirt-luxury/admin/anh-san-pham/delete?id=${anh.id}"
                                            onclick="return confirmDelete()"
                                            class="btn btn-danger rounded-pill"
                                            data-toggle="tooltip"
                                            data-placement="top"
                                            title="Xóa"
                                    ><i class="fa-solid fa-trash"></i
                                    ></a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>

<!-- Modal -->
    <form action="/t-shirt-luxury/admin/anh-san-pham/add" method="post">
        <div
                class="modal fade"
                id="themSanPham"
                tabindex="-1"
                aria-labelledby="exampleModalLabel"
                aria-hidden="true"
        >
            <div class="modal-dialog">
                <div class="modal-content" style="font-size: 14px">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Thêm Mới Ảnh</h5>
                        <button
                                type="button"
                                class="btn-close"
                                data-bs-dismiss="modal"
                                aria-label="Close"
                        ></button>
                    </div>
                    <div class="modal-body">
                        <div class="form-floating mb-3">
                            <input
                                    type="text"
                                    class="form-control"
                                    id="floatingInput"
                                    placeholder="Tên Ảnh"
                                    name="tenAnhSanPham"
                            />
                            <label for="floatingInput">Tên Ảnh</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input
                                    type="text"
                                    class="form-control"
                                    id="floatingInput"
                                    placeholder="Url Ảnh"
                                    name="maAnhSanPham"
                            />
                            <label for="floatingInput">URL Ảnh </label>
                        </div>

                        <div class="mb-3 mt-3">
                            <label for="exampleFormControlTextarea1" class="form-label"
                            >Mô tả</label
                            >
                            <textarea
                                    class="form-control"
                                    id="exampleFormControlTextarea1"
                                    rows="3"
                                    name="moTa"
                            ></textarea>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button
                                type="button"
                                class="btn btn-secondary"
                                data-bs-dismiss="modal"
                                style="font-size: 14px"
                        >
                            Đóng
                        </button>
                        <button
                                type="submit"
                                class="btn btn-success"
                                style="font-size: 14px"
                        >
                            Thêm Mới
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </form>

</body>
<script>
    confirmDelete = () => {
        return confirm("Bạn có chắc chắn muốn xoá Ảnh này không ?");
    }
</script>
</html>