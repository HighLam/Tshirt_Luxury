package com.example.tshirt_luxury_datn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class login {
    @GetMapping("/t-shirt-luxury/login")
    public String login(){
        return "nguoi-dung/login";
    }
}
