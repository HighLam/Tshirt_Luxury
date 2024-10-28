package com.example.tshirt_luxury_datn.controller;

import com.example.tshirt_luxury_datn.entity.DotGiamGia;
import com.example.tshirt_luxury_datn.repository.dotGiamGiaRepository;
import com.example.tshirt_luxury_datn.repository.danhMucRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;

@Controller
public class dotGiamGiaController {
    @Autowired
    dotGiamGiaRepository giamGiaRepository;
    @Autowired
    danhMucRepository danhMucRepo;

    @GetMapping("/t-shirt-luxury/admin/giam-gia")
    public String dotGiamGia(Model model) {
        model.addAttribute("listGiamGia", giamGiaRepository.findAll());
        return "DotGiamGia/dot-giam-gia-admin";
    }
    @ModelAttribute("danhMuc")
    public String danhMuc(Model model){
        model.addAttribute("listDanhMuc", danhMucRepo.findAll());
        return "voucher/voucher";
    }
    @PostMapping("/t-shirt-luxyry/admin/giam-gia/add")
    public String addGiamGia(@ModelAttribute("listGiamGia")DotGiamGia dotGiamGia,
                             @RequestParam("id_danh_muc") Integer idDanhMuc
                             ){
        dotGiamGia.setNgayBatDau(new Date());
        dotGiamGia.setNgayKetThuc(new Date());
        dotGiamGia.setDanhMuc(danhMucRepo.findById(idDanhMuc).get());
        giamGiaRepository.save(dotGiamGia);
        return "redirect:/t-shirt-luxury/admin/giam-gia";
    }
    @GetMapping("/t-shirt-luxury/admin/giam-gia/delete")
    public String giamGiaDelete(@RequestParam("id") Integer id){
        giamGiaRepository.deleteById(id);
        return "redirect:/t-shirt-luxury/admin/giam-gia";
    }
}
