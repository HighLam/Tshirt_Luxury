package com.example.tshirt_luxury_datn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class register {
    @GetMapping("/t-shirt-luxury/register")
    public String register() {
        return "NguoiDung/register";
    }
}
