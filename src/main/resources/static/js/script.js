
$(document).ready(function () {
    // Event Onload Window
    $(window).on("load", function () {
        $(".wrapper-login").animate(
            {
                left: "0", // Di chuyển về vị trí ban đầu
                opacity: 1, // Hiển thị dần
            },
            1000
        );
        $(".wrapper-register").animate(
            {
                left: "0", // Di chuyển về vị trí ban đầu
                opacity: 1, // Hiển thị dần
            },
            1000
        );
    });
    $(".danh-muc").mouseenter(function () {
        $(".danh-muc").addClass("bg-white");
        $(".hover-change-color").addClass("text-black");
        $(".item-danh-muc").css("border-right", "0.5px solid #000");
        $(".button-login").css("border-right", "0.5px solid #000");
        $(".button-login").css("padding-bottom", "0px");

        $(".login-and-signin").show();
    });
    $(".danh-muc").mouseleave(function () {
        $(".danh-muc").removeClass("bg-white");
        $(".hover-change-color").removeClass("text-black");
        $(".item-danh-muc").css("border-right", "0.5px solid #ffff");
        $(".button-login").css("border-right", "0.5px solid #ffff");

        $(".login-and-signin").hide();
    });

    // Vô hiệu hoá scroll
    function disableScroll() {
        $("body").css("overflow", "hidden");
    }

    // Kích hoạt lại scroll
    function enableScroll() {
        $("body").css("overflow", "auto");
    }

    // Khi mouseenter vào div, vô hiệu hoá scroll
    $(".danh-muc").mouseenter(function () {
        disableScroll();
    });

    // Khi mouseleave khỏi div, kích hoạt lại scroll
    $(".danh-muc").mouseleave(function () {
        enableScroll();
    });

    $(window).scroll(function () {
        // Code thực thi khi có sự kiện scroll
        var scrollTop = $(this).scrollTop();

        if (scrollTop == 0) {
            $(".header-popup").hide();
            $(".danh-muc").show();
            $(".logo-header").show();
            $(".search-favourite-cart").show();
        } else if (scrollTop >= 100) {
            $(".header-popup").fadeIn(500);
            $(".header-popup").removeClass("display-hidden");
            $(".header-popup").css("position", "fixed");
            $(".header-popup").css("display", "flex");
            $(".danh-muc").hide();
            $(".logo-header").hide();
            $(".search-favourite-cart").hide();
        }
    });

    $(".name-type-tshirt-popup").mouseenter(function () {
        $(this).addClass("text-black");
    });
    $(".name-type-tshirt-popup").mouseleave(function () {
        $(this).removeClass("text-black");
    });
    //Mouseenter Type Tshirt Popup

    // Hiển thị popup khi di chuột vào danh mục
    $(".name-danh-muc-popup").mouseenter(function () {
        $(".type-tshirt-popup").fadeIn(500);
        $(this).addClass("border-bottom-menu-popup");
        $(".type-tshirt-popup").css("display", "flex");
    });

    // Ẩn popup khi chuột rời khỏi cả hai phần tử
    $(".name-danh-muc-popup, .type-tshirt-popup").mouseleave(function () {
        $(".type-tshirt-popup").fadeOut(100);
        $(this).removeClass("border-bottom-menu-popup");
    });

    // Ghi lại sự kiện mouseenter cho popup
    $(".type-tshirt-popup").mouseenter(function () {
        $(this).stop(true, true).show(); // Dừng hiệu ứng fadeOut nếu đang diễn ra
    });

    //Start Page Login
    $("input")
        .focus(function () {
            $(this).data("placeholder", $(this).attr("placeholder")); // Lưu placeholder ban đầu
            $(this).attr("placeholder", ""); // Xóa placeholder khi focus
            $(this).css("outline", "none");
        })
        .blur(function () {
            // Khôi phục placeholder khi blur
            $(this).attr("placeholder", $(this).data("placeholder"));
        });

    $(".button-dang-nhap").mouseenter(function () {
        $(this).css("background-color", "#000");
        $(this).css("color", "#ffff");
    });
    $(".button-dang-nhap").mouseleave(function () {
        $(this).css("background-color", "#fff");
        $(this).css("color", "#000");
    });

    $(".forgot-password").mouseenter(function () {
        $(this).css("color", "#000");
    });
    $(".forgot-password").mouseleave(function () {
        $(this).css("color", "#666");
    });

    $(".change-page-register").mouseenter(function () {
        $(".link-page-register").css("color", "#000");
    });
    $(".change-page-register").mouseleave(function () {
        $(".link-page-register").css("color", "#666");
    });
    //End Page Login

    //Start Page Register
    $(".button-dang-ky").mouseenter(function () {
        $(this).css("background-color", "#000");
        $(this).css("color", "#ffff");
    });
    $(".button-dang-ky").mouseleave(function () {
        $(this).css("background-color", "#fff");
        $(this).css("color", "#000");
    });
    $(".change-page-login").mouseenter(function () {
        $(".link-page-login").css("color", "#000");
    });
    $(".change-page-login").mouseleave(function () {
        $(".link-page-login").css("color", "#666");
    });
    //End Page Register
});
