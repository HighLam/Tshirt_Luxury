package com.example.tshirt_luxury_datn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class gioHangChiTietController {
    @GetMapping("t-shirt-luxury/gio-hang-chi-tiet")
    public String aoNam() {
        return "DanhMuc/gio-hang-chi-tiet";
    }
}
