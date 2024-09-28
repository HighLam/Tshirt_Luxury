$(document).ready(function () {
    $(".danh-muc").mouseenter(function () {
        $(".danh-muc").addClass("bg-white");
        $(".hover-change-color").css("color","#000");
        $(".item-danh-muc").css("border-right", "0.5px solid #000");
        $(".button-login").css("border-right", "0.5px solid #000");
        $(".button-login").css("padding-bottom", "0px");

        $(".login-and-signin").show();
    });
    $(".danh-muc").mouseleave(function () {
        $(".danh-muc").removeClass("bg-white");
        $(".hover-change-color").css("color","#fff");
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

    //Hide and show menu popup

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
            $(".danh-muc").hide();
            $(".logo-header").hide();
            $(".search-favourite-cart").hide();
        }
    });
    //Event Onload Window
    $(window).on("load", function () {
        $(".header-popup").hide();
        $(".type-tshirt-popup").hide();
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
});
