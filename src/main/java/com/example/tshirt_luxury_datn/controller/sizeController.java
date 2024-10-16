package com.example.tshirt_luxury_datn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class sizeController {

    @GetMapping("t-shirt-luxury/admin/size")
    public String size() {
        return "size/size";
    }
}
