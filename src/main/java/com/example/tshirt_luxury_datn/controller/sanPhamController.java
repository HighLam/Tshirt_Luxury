package com.example.tshirt_luxury_datn.controller;

import com.example.tshirt_luxury_datn.entity.*;
import com.example.tshirt_luxury_datn.repository.anhSanPhamRepository;
import com.example.tshirt_luxury_datn.repository.danhMucRepository;
import com.example.tshirt_luxury_datn.repository.sanPhamRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
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


    @GetMapping("t-shirt-luxury/admin/sua-san-pham/getOne")
    public String getSanPham(@RequestParam(name = "id") Integer id, Model model) {

        // Lấy đối tượng san pham theo ID
        SanPham sanPham = sanPhamRepository.getOne(id);
        model.addAttribute("sanPham", sanPham);
        return "SanPham/sua-san-pham";
    }
    @PostMapping("t-shirt-luxury/admin/updateSanPham")
    public String updateNguoiDung(@RequestParam("id") Integer id, @ModelAttribute("sanPham") SanPham sanPham) {
        SanPham getOne = sanPhamRepository.getReferenceById(id);
        if (getOne.getId() == id) {
            Date ngaySua = new Date();
            sanPham.setId(id);
            sanPham.setNgaySua(ngaySua);
            sanPham.setNgayTao(getOne.getNgayTao());
            sanPhamRepository.save(sanPham);
        }
        return "redirect:/t-shirt-luxury/admin/san-pham";
    }


}
