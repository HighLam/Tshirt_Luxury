package com.example.tshirt_luxury_datn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class adminController {

    @GetMapping("t-shirt-luxury/admin")
    public String admin() {
        return "admin/admin";
    }
}
