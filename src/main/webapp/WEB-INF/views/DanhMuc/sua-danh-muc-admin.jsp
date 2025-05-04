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
                    <jsp:include page="/WEB-INF/views/fragments/menuAdmin.jsp" />
                    <div class="col-9" >
                        <div class="row">
                            <h2 class="">Cập Nhật Danh Mục</h2>


                            <form action="/t-shirt-luxury/admin/danh-muc/update?id=${danhMuc.id}" method="POST">
                                <div class="form-floating mb-3">
                                    <input readonly name="maDanhMuc" type="text" class="form-control" id="floatingInput"
                                        value="${danhMuc.maDanhMuc}">
                                    <label for="floatingInput">Mã Danh Mục</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input name="tenDanhMuc" type="text" class="form-control" id="floatingInput"
                                        placeholder="Tên Danh Mục" value="${danhMuc.tenDanhMuc}">
                                    <label for="floatingInput">Tên Danh Mục <span class="text-danger">*</span></label>
                                </div>
                                <div class="mt-3">
                                    <div class="text mt-2">
                                        Trạng Thái
                                    </div>
                                    <div class="form-check form-check-inline mt-2">
                                        <input class="form-check-input" type="radio" name="trangThai" id="hoatDong"
                                            value="1" ${danhMuc.trangThai==1 ? 'checked' :''}>
                                        <label class="form-check-label" for="inlineRadio1">Hoạt Động</label>
                                    </div>
                                    <div class="form-check form-check-inline mt-2">
                                        <input class="form-check-input" type="radio" name="trangThai" id="khongHoatDong"
                                            value="0" ${danhMuc.trangThai==0 ? 'checked' :''}>
                                        <label class="form-check-label" for="inlineRadio2">Không Hoạt Động</label>
                                    </div>
                                </div>
                                <div class="form-floating mb-3 mt-3">
                                    <input name="moTa" type="text" class="form-control" id="floatingInput"
                                        placeholder="Mô tả" value="${danhMuc.moTa}">
                                    <label for="floatingInput">Mô tả</label>
                                </div>
                                <div class="p-2 bd-highlight d-flex justify-content-end">
                                    <button type="submit" class="btn btn-outline-warning">
                                        <i class="fa-solid fa-pen"></i> Cập Nhật
                                    </button>
                                </div>
                            </form>


                        </div>
                    </div>
                </div>
            </div>







            </div>
        </body>

        </html>