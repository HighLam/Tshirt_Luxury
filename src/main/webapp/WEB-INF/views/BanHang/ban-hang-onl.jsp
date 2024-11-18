<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body class="container">
<div class="row">
    <div class="col-6 mt-5" >
        <a href="" style="text-decoration: none;">Giỏ hàng > </a>  Thanh toán

        <div class="TTGH" style="margin-top: 60px;">
            <h5>Thông tin giao hàng</h5>
            <form>
                <div class="mb-3">
                    <input style="width: 600px; height: 50px;" class="form-control me-2"
                           placeholder="Họ và tên">
                </div>
                <div class="mb-3">
                    <input style="width: 600px;  height: 50px;" class="form-control me-2"
                           placeholder="Số điện thoại">
                </div>
                <div class="mb-3 ">
                    <input style="width: 600px;  height: 50px; " class="form-control me-2"
                           placeholder="Địa chỉ">
                </div>
                <div class="mb-3 ">
                        <textarea style="width: 600px; height: 100px;" class="form-control me-2"
                                  placeholder="Ghi chú"></textarea>
                </div>
            </form>
        </div>
        <div>
            <h5 class="fw-normal">Phương thức thanh toán</h5>
            <div class="d-flex">
                <input type="radio">
                <p style="margin-left: 10px; margin-top: 13px;">Thanh toán khi nhận hàng(COD)</p>
            </div>
        </div>
    </div>
    <div class="col-6 mt-3" style="background-color: rgb(247, 247, 247);" >
        <table class="table">

            <tbody>
            <c:forEach var="bh" items="${banHang}">
            <tr>
                <td><img style="width: 80px; height: 100px; border-radius: 10%;" src="https://pos.nvncdn.com/be3159-662/ps/20241011_HyHQUS9NwA.jpeg" alt=""></td>
                <td>${bh.sanPhamChiTiet.sanPham.tenSanPham} - ${bh.sanPhamChiTiet.mauSac.tenMauSac} - ${bh.sanPhamChiTiet.size.tenSize} </td>
                <td>${bh.sanPhamChiTiet.gia * bh.soLuong}</td>
                <td><div class="ms-auto d-flex align-items-center">
                    <button class="btn btn-outline-secondary btn-sm" id="decrement">-</button>
                    <input
                            class="form-control text-center mx-2"
                            style="width: 50px"
                            type="text"
                            value="${bh.soLuong}"
                            id="quantity"
                    />
                    <button class="btn btn-outline-secondary btn-sm" id="increment">+</button>
                </div>
                </td>
            </tr>
            </c:forEach>
            </tbody>

        </table>
        <div class="voucher d-flex">
            <select style="width: 300px;" class="form-select" aria-label="Default select example">
                <option selected>Open this select menu</option>
                <option value="1">One</option>
                <option value="2">Two</option>
                <option value="3">Three</option>
            </select>
            <button style="margin-left: 20px;" class="btn btn-secondary">Áp dụng</button>
        </div>
        <hr>
        <h6 class="fw-normal" >Phí vận chuyển</h6>
        <hr>
        <h5 class="fw-normal" >Tổng cộng: ${tongTienGioHang}</h5>
        <a href="" style="margin-left: 400px; height: 45px; font-size: large;" class="btn btn-secondary">Hoàn tất đơn hàng</a>
    </div>

</div>




<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script>
    const decrementBtn = document.getElementById("decrement");
    const incrementBtn = document.getElementById("increment");
    const quantityInput = document.getElementById("quantity");

    // Xử lý khi nhấn nút Trừ (-)
    decrementBtn.addEventListener("click", () => {
        let currentValue = parseInt(quantityInput.value) || 0;
        if (currentValue > 0) {
            quantityInput.value = currentValue - 1;
        }
    });

    // Xử lý khi nhấn nút Cộng (+)
    incrementBtn.addEventListener("click", () => {
        let currentValue = parseInt(quantityInput.value) || 0;
        quantityInput.value = currentValue + 1;
    });

    // Đảm bảo giá trị nhập vào là số nguyên hợp lệ
    quantityInput.addEventListener("input", () => {
        quantityInput.value = quantityInput.value.replace(/[^0-9]/g, '');
    });
</script>
</body>
</html>