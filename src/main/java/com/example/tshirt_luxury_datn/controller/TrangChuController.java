package com.example.tshirt_luxury_datn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TrangChuController {

    @GetMapping("/t-shirt-luxury/trang-chu")
    public String trangChu() {
        return "ban-hang/trang-chu";
    }
}
