package com.example.tshirt_luxury_datn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class nguoiDungController {
    @GetMapping("t-shirt-luxury/admin/nguoi-dung")
    public String nguoiDung() {
        return "NguoiDung/nguoi-dung-admin";
    }
}
