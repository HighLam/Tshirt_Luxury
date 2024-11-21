package com.example.tshirt_luxury_datn.controller;

import com.example.tshirt_luxury_datn.repository.hoaDonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class hoaDonController {
    @Autowired
    hoaDonRepository hoaDonRepository;

    @GetMapping("/t-shirt-luxury/admin/hoa-don")
    public String hoaDonAdmin(Model model) {
        model.addAttribute("listHoaDonTaiQuay", hoaDonRepository.getHoaDonTaiQuay());
        return "HoaDon/hoa-don-admin";
    }
    @GetMapping("/t-shirt-luxury/admin/hoa-don-online")
    public String hoaDonOnline(Model model) {
        model.addAttribute("listHoaDonOnline", hoaDonRepository.getHoaDonOnline());
        return "HoaDon/hoa-don-online";
    }
}
