package com.example.tshirt_luxury_datn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class chatLieuController {

    @GetMapping("t-shirt-luxury/admin/chat-lieu")
    public String chatLieu() {
        return "chat-lieu/ChatLieu";
    }
}
