package com.example.tshirt_luxury_datn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class mauSacController {

    @GetMapping("t-shirt-luxury/admin/mau-sac")
    public String mauSac() {
        return "mau-sac/MauSac";
    }
}
