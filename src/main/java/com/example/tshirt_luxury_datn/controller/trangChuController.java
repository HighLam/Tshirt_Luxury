package com.example.tshirt_luxury_datn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class trangChuController {

    @GetMapping("/t-shirt-luxury/trang-chu")
    public String trangChu() {
        return "BanHang/trang-chu";
    }
}
