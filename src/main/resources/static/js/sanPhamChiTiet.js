$(document).ready(function () {

document.addEventListener("DOMContentLoaded", function() {
    let number = document.getElementById("number");
    let currentValue = parseInt(number.innerText);

    document.getElementById("increase").addEventListener("click", function() {
        currentValue++;
        number.innerText = currentValue;
    });

    document.getElementById("decrease").addEventListener("click", function() {
        if (currentValue > 1) {  // Điều kiện ngăn số giảm xuống dưới 1
            currentValue--;
            number.innerText = currentValue;
        }
    });
});

//Thuộc Tính Sản Phẩm
// Lấy nút và đoạn văn từ DOM
const toggleButton = document.getElementById("toggleButtonttsp");
const text = document.getElementById("textttsp");

// Đặt sự kiện click cho nút
toggleButton.addEventListener("click", function() {
    // Nếu đoạn văn đang bị ẩn thì hiển thị ra
    if (text.classList.contains("show")) {
        text.classList.remove("show");
        toggleButton.innerText = "+";
    } else {
        // Nếu đoạn văn đang hiển thị thì ẩn đi
        text.classList.add("show");
        toggleButton.innerText = "-";
    }
});


//Chính Sách Sản Phẩm
// Lấy nút và đoạn văn từ DOM
const toggleButtoncssp = document.getElementById("toggleButtoncssp");
const textcssp = document.getElementById("textcssp");

// Đặt sự kiện click cho nút
toggleButtoncssp.addEventListener("click", function() {
    // Nếu đoạn văn đang bị ẩn thì hiển thị ra
    if (textcssp.classList.contains("show")) {
        textcssp.classList.remove("show");
        toggleButtoncssp.innerText = "+";
    } else {
        // Nếu đoạn văn đang hiển thị thì ẩn đi
        textcssp.classList.add("show");
        toggleButtoncssp.innerText = "-";
    }
});

//Chính Sách Sản Phẩm
// Lấy nút và đoạn văn từ DOM
const toggleButtonhdbq = document.getElementById("toggleButtonhdbq");
const texthdbq = document.getElementById("texthdbq");

// Đặt sự kiện click cho nút
toggleButtonhdbq.addEventListener("click", function() {
    // Nếu đoạn văn đang bị ẩn thì hiển thị ra
    if (texthdbq.classList.contains("show")) {
        texthdbq.classList.remove("show");
        toggleButtonhdbq.innerText = "+";
    } else {
        // Nếu đoạn văn đang hiển thị thì ẩn đi
        texthdbq.classList.add("show");
        toggleButtonhdbq.innerText = "-";
    }
    const input = document.getElementById('autoExpand');


});
}