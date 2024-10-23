package com.example.tshirt_luxury_datn.controller;

import com.example.tshirt_luxury_datn.repository.sizeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class sizeController {

    @Autowired
    sizeRepository sizeRepository;

    @GetMapping("t-shirt-luxury/admin/size")
    public String sizeHienThi(Model model) {
        model.addAttribute("size", sizeRepository.findAll());
        return "size/size";
    }

    @GetMapping("t-shirt-luxury/admin/size/delete")
    public String sizeDelete(@RequestParam("id") Integer id) {
        sizeRepository.deleteById(id);
        return "redirect:/t-shirt-luxury/admin/size";
    }
}
