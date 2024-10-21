package com.example.tshirt_luxury_datn.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class danhMucController {

    @GetMapping("t-shirt-luxury/admin/danh-muc")
    public String danhMucAdmin() {
        return "DanhMuc/danh-muc-admin";
    }
}
