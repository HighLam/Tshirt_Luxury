package com.example.tshirt_luxury_datn.controller;


import com.example.tshirt_luxury_datn.entity.DanhMuc;
import com.example.tshirt_luxury_datn.repository.danhMucRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class danhMucController {


    @Autowired
    danhMucRepository danhMucRepository;

    @GetMapping("t-shirt-luxury/admin/danh-muc")
    public String danhMucAdmin(Model model) {
        model.addAttribute("danhMuc", danhMucRepository.findAll());
        return "DanhMuc/danh-muc-admin";
    }
}
