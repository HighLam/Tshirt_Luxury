package com.example.tshirt_luxury_datn.controller;

import com.example.tshirt_luxury_datn.repository.hoaDonChiTietRepository;
import com.example.tshirt_luxury_datn.repository.hoaDonRepository;
import com.example.tshirt_luxury_datn.repository.sanPhamChiTietAdminRepository;
import com.example.tshirt_luxury_datn.repository.sanPhamRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class adminController {
    @Autowired
    sanPhamChiTietAdminRepository sanPhamChiTietAdminRepo;

    @Autowired
    hoaDonChiTietRepository hoaDonChiTietRepo;

    @Autowired
    hoaDonRepository hoaDonRepo;

    @Autowired
    sanPhamRepository sanPhamRepo;

    @GetMapping("t-shirt-luxury/admin")
    public String getSanPhamChiTiet(Model model) {
        model.addAttribute("SP", sanPhamRepo.findAll());
        return "admin/admin";
    }

    @GetMapping("t-shirt-luxury/admin/{id}")
    public String modal(@PathVariable("id") Integer id, Model model ) {
        model.addAttribute("modal",sanPhamChiTietAdminRepo.findById(id));
        return "admin/admin?id="+id;
    }
}
