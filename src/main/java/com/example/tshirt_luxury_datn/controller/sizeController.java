package com.example.tshirt_luxury_datn.controller;

import com.example.tshirt_luxury_datn.entity.Size;
import com.example.tshirt_luxury_datn.repository.sizeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;

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

    @PostMapping("t-shirt-luxury/admin/size/add")
    public String sizeAdd(@ModelAttribute("size") Size size) {
        size.setNgayTao(new Date());
        size.setNgaySua(new Date());
        sizeRepository.save(size);
        return "redirect:/t-shirt-luxury/admin/size";
    }
}
