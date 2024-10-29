package com.example.tshirt_luxury_datn.controller;

import com.example.tshirt_luxury_datn.entity.AnhSanPham;
import com.example.tshirt_luxury_datn.entity.SanPham;
import com.example.tshirt_luxury_datn.entity.SanPhamChiTiet;
import com.example.tshirt_luxury_datn.entity.Size;
import com.example.tshirt_luxury_datn.repository.*;
import com.example.tshirt_luxury_datn.response.sanPhamChiTietAdminRespone;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class sanPhamChiTietAdminController {
    @Autowired
    sizeRepository sizeRepo;
    @Autowired
    anhSanPhamRepository anhSanPhamRepo;
    @Autowired
    chatLieuRepository chatLieuRepo;
    @Autowired
    mauSacRepository mauSacRepo;
    @Autowired
    sanPhamChiTietAdminRepository sanPhamChiTietAdminRepo;
    @Autowired
    sanPhamRepository sanPhamRepo;

    @ModelAttribute("sanPham")
    public String getSanPham(Model model) {
        SanPham sanPham = sanPhamRepo.findAll().get(0);
        model.addAttribute("tenSanPham", sanPham.getId());
        return "SanPhamChiTiet/san-pham-chi-tiet-admin";
    }

    @ModelAttribute("size")
    public String getSize(Model model) {
        model.addAttribute("size", sizeRepo.findAll());
        return "SanPhamChiTiet/san-pham-chi-tiet-admin";
    }

    @ModelAttribute("anhSanPham")
    public String getAnhSanPham(Model model) {
        model.addAttribute("anhSanPham", anhSanPhamRepo.findAll());
        return "SanPhamChiTiet/san-pham-chi-tiet-admin";
    }


    @ModelAttribute("chatLieu")
    public String getchatLieu(Model model) {
        model.addAttribute("chatLieu", chatLieuRepo.findAll());
        return "SanPhamChiTiet/san-pham-chi-tiet-admin";
    }


    @ModelAttribute("mauSac")
    public String getMauSac(Model model) {
        model.addAttribute("mauSac", mauSacRepo.findAll());
        return "SanPhamChiTiet/san-pham-chi-tiet-admin";
    }

    @GetMapping("t-shirt-luxury/admin/san-pham-chi-tiet")
    public String sanPhamChiTietAdmin(@RequestParam("id") Integer id, Model model) {
        model.addAttribute("spct", sanPhamChiTietAdminRepo.findBySanPhamId(id));
        return "SanPhamChiTiet/san-pham-chi-tiet-admin";
    }




    @PostMapping("t-shirt-luxury/admin/san-pham-chi-tiet/add")
    public String sanPhamChiTietSave(
            @RequestParam("id_san_pham") Integer idSanPham,
            @RequestParam("id_anh_san_pham_chi_tiet") Integer idAnhSanPham,
            @RequestParam("id_size") Integer idSize,
            @RequestParam("id_chat_lieu") Integer idChatLieu,
            @RequestParam("id_mau_sac") Integer idMauSac,
            @ModelAttribute("sanPhamChiTiet") SanPhamChiTiet sanPhamChiTiet) {
        sanPhamChiTiet.setSanPham(sanPhamRepo.findById(idSanPham).get());
        sanPhamChiTiet.setNgayTao(new Date());
        sanPhamChiTiet.setNgaySua(new Date());
        sanPhamChiTiet.setAnhSanPham(anhSanPhamRepo.findById(idAnhSanPham).get());
        sanPhamChiTiet.setSize(sizeRepo.findById(idSize).get());
        sanPhamChiTiet.setChatLieu(chatLieuRepo.findById(idChatLieu).get());
        sanPhamChiTiet.setMauSac(mauSacRepo.findById(idMauSac).get());
        sanPhamChiTietAdminRepo.save(sanPhamChiTiet);
        return "redirect:/t-shirt-luxury/admin/san-pham-chi-tiet";
    }

    @GetMapping("t-shirt-luxury/admin/san-pham-chi-tiet/delete")
    public String sanPhamChiTietDelete(@RequestParam("id") Integer id) {
        sanPhamChiTietAdminRepo.deleteById(id);
        return "redirect:/t-shirt-luxury/admin/san-pham-chi-tiet";
    }
}