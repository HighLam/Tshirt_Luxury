package com.example.tshirt_luxury_datn.controller;

import com.example.tshirt_luxury_datn.entity.GioHangChiTiet;
import com.example.tshirt_luxury_datn.repository.gioHangChiTietRepository;
import com.example.tshirt_luxury_datn.repository.gioHangRepository;
import com.example.tshirt_luxury_datn.repository.voucherRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class banHangOnlController {
    @Autowired
    gioHangChiTietRepository gioHangChiTietRepo;
    @Autowired
    voucherRepository voucherRepo;
    @Autowired
    gioHangRepository gioHangRepo;
    @GetMapping("/t-shirt-luxury/ban-hang-onl")
    public String banHangOnl(Model model, HttpSession session){
        Integer idGioHang = (Integer) session.getAttribute("idGioHang");
        List<GioHangChiTiet> gioHangChiTiets =  gioHangChiTietRepo.gioHangChiTietByID(idGioHang);
        model.addAttribute("tongTienGioHang",gioHangChiTietRepo.tinhTongGia());
        model.addAttribute("banHang", gioHangChiTiets);
        return "BanHang/ban-hang-onl";
    }

}
