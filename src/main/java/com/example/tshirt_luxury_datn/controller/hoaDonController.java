package com.example.tshirt_luxury_datn.controller;

import com.example.tshirt_luxury_datn.entity.HoaDon;
import com.example.tshirt_luxury_datn.entity.HoaDonChiTiet;
import com.example.tshirt_luxury_datn.entity.ThongTinNhanHang;
import com.example.tshirt_luxury_datn.repository.hoaDonChiTietRepository;
import com.example.tshirt_luxury_datn.repository.hoaDonRepository;
import com.example.tshirt_luxury_datn.repository.thongTinDonHangRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class hoaDonController {
    @Autowired
    hoaDonRepository hoaDonRepo;
    @Autowired
    hoaDonChiTietRepository hoaDonChiTietRepo;

    @Autowired
    thongTinDonHangRepository thongTinDonHangRepo;

    @GetMapping("/t-shirt-luxury/admin/hoa-don")
    public String hoaDonAdmin(Model model) {
        model.addAttribute("listHoaDonTaiQuay", hoaDonRepo.getHoaDonTaiQuay());
        return "HoaDon/hoa-don-admin";
    }
    @GetMapping("/t-shirt-luxury/admin/hoa-don-online")
    public String hoaDonOnline(Model model) {
        model.addAttribute("listHoaDonOnline", hoaDonRepo.getHoaDonOnline());
        return "HoaDon/hoa-don-online";
    }

    @GetMapping("/t-shirt-luxury/admin/hoa-don-online/detail")
    public String hoaDonOnlineDetail(@RequestParam("idHoaDonOnline") Integer idHoaDon, Model model, HttpSession session){
        List<HoaDonChiTiet> hoaDonChiTiet = hoaDonChiTietRepo.getHoaDonChiTietByIdHoaDon(idHoaDon);
        model.addAttribute("tongTien",hoaDonRepo.tongTienHoaDonOnline(idHoaDon));

        model.addAttribute("hoaDonChiTietOnline",hoaDonChiTiet);
        Integer idThongTinDonHang = hoaDonRepo.getThongTinDonHang(idHoaDon);
         ThongTinNhanHang thongTinNhanHang = thongTinDonHangRepo.getReferenceById(idThongTinDonHang);
         model.addAttribute("thongTinNhanHang",thongTinNhanHang);
        return "HoaDon/xac-nhan-don-hang";

    }

    @PostMapping("/t-shirt-luxury/admin/hoa-don-online/xac-nhan-don")
    public String xacNhanDon(@RequestParam("idHoaDonXacNhan") Integer idHoaDon){
        HoaDon hoaDon = hoaDonRepo.getReferenceById(idHoaDon);
        hoaDon.setId(idHoaDon);
        hoaDon.setTrangThai(3);
        hoaDonRepo.save(hoaDon);
        return "redirect:/t-shirt-luxury/admin/hoa-don-online";
    }
}
