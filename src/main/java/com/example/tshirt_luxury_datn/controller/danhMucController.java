package com.example.tshirt_luxury_datn.controller;


import com.example.tshirt_luxury_datn.entity.DanhMuc;
import com.example.tshirt_luxury_datn.repository.danhMucRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class danhMucController {


    @Autowired
    danhMucRepository danhMucRepository;

    @GetMapping("t-shirt-luxury/admin/danh-muc")
    public String danhMucAdmin(Model model) {
        model.addAttribute("danhMuc", danhMucRepository.findAll());
        return "DanhMuc/danh-muc-admin";
    }

    @GetMapping("t-shirt-luxury/admin/danh-muc/delete")
    public String danhMucAdminDelete(@RequestParam("id") Integer id) {
        danhMucRepository.deleteById(id);
        return "redirect:/t-shirt-luxury/admin/danh-muc";
    }
}
