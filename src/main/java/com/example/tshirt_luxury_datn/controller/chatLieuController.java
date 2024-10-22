package com.example.tshirt_luxury_datn.controller;

import com.example.tshirt_luxury_datn.repository.chatLieuRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class chatLieuController {

    @Autowired
    chatLieuRepository chatLieuRepository;

//    @GetMapping("t-shirt-luxury/admin/chat-lieu")
//    public String chatLieu() {
//        return "ChatLieu/chat-lieu";
//    }

    @GetMapping("t-shirt-luxury/admin/chat-lieu")
    public String chatLieuHienThi(Model model) {
        model.addAttribute("chatLieu", chatLieuRepository.findAll());
        return "ChatLieu/chat-lieu";
    }

    @GetMapping("t-shirt-luxury/admin/chat-lieu/delete")
    public String chatLieuDelete(@RequestParam("id") Integer id) {
        chatLieuRepository.deleteById(id);
        return "redirect:/t-shirt-luxury/admin/chat-lieu";
    }
}
