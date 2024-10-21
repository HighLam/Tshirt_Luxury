package com.example.tshirt_luxury_datn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class hoaDonController {

    @GetMapping("/t-shirt-luxury/admin/hoa-don")
    public String hoaDonAdmin() {
        return "HoaDon/hoa-don-admin";
    }
}
