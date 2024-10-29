package com.example.tshirt_luxury_datn.controller;

import com.example.tshirt_luxury_datn.entity.AnhSanPham;
import com.example.tshirt_luxury_datn.entity.ChatLieu;
import com.example.tshirt_luxury_datn.entity.DanhMuc;
import com.example.tshirt_luxury_datn.entity.SanPham;
import com.example.tshirt_luxury_datn.repository.anhSanPhamRepository;
import com.example.tshirt_luxury_datn.repository.danhMucRepository;
import com.example.tshirt_luxury_datn.repository.sanPhamRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;
import java.util.List;

@Controller
public class sanPhamController {
    @Autowired
    sanPhamRepository sanPhamRepository;
    @Autowired
    danhMucRepository danhMucRepository;
    @Autowired
    anhSanPhamRepository anhSanPhamRepository;

    @GetMapping("t-shirt-luxury/admin/san-pham")
    public String sanPhamAdmin(Model model) {
        model.addAttribute("listSanPham",sanPhamRepository.findAll());
        return "SanPham/san-pham-admin";
    }
    @ModelAttribute("danhMuc")
    public String getDanhMuc(Model model) {
        model.addAttribute("danhMuc",danhMucRepository.findAll());
        return "SanPham/san-pham-admin";
    }
    @ModelAttribute("anhSP")
    public String getAnhSP(Model model) {
        model.addAttribute("anhSP",anhSanPhamRepository.findAll());
        return "SanPham/san-pham-admin";
    }

    @PostMapping("t-shirt-luxury/admin/san-pham/add")
    public String sanPhamSave(
            @RequestParam("id_danh_muc") Integer idDanhMuc,
            @RequestParam("id_anh_san_pham") Integer idAnhSanPham,
            @ModelAttribute("sanPham") SanPham sanPham){

        sanPham.setNgayTao(new Date());
        sanPham.setNgaySua(new Date());
        sanPham.setDanhMuc(danhMucRepository.findById(idDanhMuc).get());
        sanPhamRepository.save(sanPham);
        return "redirect:/t-shirt-luxury/admin/san-pham";
    }

    @GetMapping("t-shirt-luxury/admin/san-pham/delete")
    public String sanPhamDelete(@RequestParam("id") Integer id){
        sanPhamRepository.deleteById(id);
        return "redirect:/t-shirt-luxury/admin/san-pham";
    }

    @GetMapping("t-shirt-luxury/admin/san-pham/detail")
    public String sanPhamDetail(@RequestParam("id") Integer id, Model model) {
        SanPham sanPham = sanPhamRepository.findById(id).orElse(null);
        model.addAttribute("sanPham",sanPham);
        return "SanPham/san-pham-admin";
    }

}
