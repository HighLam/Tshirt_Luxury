package com.example.tshirt_luxury_datn.controller;

import com.example.tshirt_luxury_datn.entity.GioHangChiTiet;
import com.example.tshirt_luxury_datn.repository.gioHangChiTietRepository;
import com.example.tshirt_luxury_datn.repository.gioHangRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class gioHangController {

    @Autowired
    gioHangChiTietRepository gioHangChiTietRepo;

    @Autowired
    gioHangRepository gioHangRepo;

    @GetMapping("/t-shirt-luxury/gio-hang-chi-tiet")
    public String gioHangCanvas(HttpSession session, Model model) {
        Integer idGioHang = (Integer) session.getAttribute("idGioHang");
        List<GioHangChiTiet> gioHangChiTiets =  gioHangChiTietRepo.gioHangChiTietByID(idGioHang);
        model.addAttribute("tongTienGioHang",gioHangChiTietRepo.tinhTongGia());
        System.out.println("sjjdfhghjdk"+gioHangChiTietRepo.tinhTongGia());
        model.addAttribute("GHCT", gioHangChiTiets);
        return "DanhMuc/gio-hang-chi-tiet";

    }
    @GetMapping("/t-shirt-luxury/gio-hang-chi-tiet/delete")
    public String deleteGioHangChiTiet(@RequestParam("id") Integer id){
        gioHangChiTietRepo.deleteById(id);
        return "redirect:/t-shirt-luxury/gio-hang-chi-tiet";
    }

}
