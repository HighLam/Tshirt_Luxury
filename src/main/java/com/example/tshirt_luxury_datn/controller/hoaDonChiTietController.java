package com.example.tshirt_luxury_datn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class hoaDonChiTietController {

    @GetMapping("/t-shirt-luxury/admin/hoa-don-chi-tiet")
    public String hoaDonChiTietAdmin() {
        return "HoaDonChiTiet/hoa-don-chi-tiet-admin";
    }
}
