package com.example.tshirt_luxury_datn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class dotGiamGiaController {

    @GetMapping("/t-shirt-luxury/admin/giam-gia")
    public String dotGiamGia() {
        return "DotGiamGia/dot-giam-gia";
    }
}
