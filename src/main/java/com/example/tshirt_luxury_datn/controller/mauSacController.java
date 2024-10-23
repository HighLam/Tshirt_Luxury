package com.example.tshirt_luxury_datn.controller;

import com.example.tshirt_luxury_datn.entity.MauSac;
import com.example.tshirt_luxury_datn.repository.mauSacRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class mauSacController {

    @Autowired
    mauSacRepository mauSacRepository;


    @GetMapping("t-shirt-luxury/admin/mau-sac")
    public String mauSac(Model model) {
        model.addAttribute("mauSac", mauSacRepository.findAll());
        return "MauSac/mau-sac";
    }

    @GetMapping("t-shirt-luxury/admin/mau-sac/delete")
    public String mauSacDelete(@RequestParam("id")Integer id) {
        mauSacRepository.deleteById(id);
        return "redirect:/t-shirt-luxury/admin/mau-sac";
    }
}
