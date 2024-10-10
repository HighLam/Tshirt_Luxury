package com.example.tshirt_luxury_datn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class sanPhamController {

    @GetMapping("t-shirt-luxury/admin/san-pham")
    public String sanPhamAdmin() {
        return "san-pham/SanPham";
    }
}
