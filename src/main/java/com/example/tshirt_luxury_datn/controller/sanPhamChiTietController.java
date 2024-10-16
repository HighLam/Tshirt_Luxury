package com.example.tshirt_luxury_datn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class sanPhamChiTietController {
        @GetMapping("t-shirt-luxury/san-pham-chi-tiet")
        public String SanPhamChiTiet() {
            return "SanPhamChiTiet/san-pham-chi-tiet";
        }

    @GetMapping("t-shirt-luxury/admin/san-pham-chi-tiet")
    public String SanPhamChiTietAdmin() {
        return "SanPhamChiTiet/san-pham-chi-tiet-admin";
    }

}
