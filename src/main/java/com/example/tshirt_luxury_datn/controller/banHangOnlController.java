package com.example.tshirt_luxury_datn.controller;

import com.example.tshirt_luxury_datn.entity.*;
import com.example.tshirt_luxury_datn.repository.*;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;
import java.util.List;

@Controller
public class banHangOnlController {
    @Autowired
    thongTinDonHangRepository thongTinDonHangRepo;
    @Autowired
    gioHangChiTietRepository gioHangChiTietRepo;
    @Autowired
    voucherRepository voucherRepo;
    @Autowired
    gioHangRepository gioHangRepo;
    @Autowired
    hoaDonRepository hoaDonRepo;
    @Autowired
    sanPhamChiTietRepository sanPhamChiTietRepo;
    @Autowired
    hoaDonChiTietRepository hoaDonChiTietRepo;

    @GetMapping("/t-shirt-luxury/ban-hang-onl")
    public String banHangOnl(Model model, HttpSession session) {
        Integer idGioHang = (Integer) session.getAttribute("idGioHang");
        List<GioHangChiTiet> gioHangChiTiets = gioHangChiTietRepo.gioHangChiTietByID(idGioHang);
        Float tongGia = gioHangChiTietRepo.tinhTongGia();
        model.addAttribute("voucher", voucherRepo.listVoucher(tongGia));
        model.addAttribute("tongTienGioHang", gioHangChiTietRepo.tinhTongGia());
        model.addAttribute("banHang", gioHangChiTiets);
        model.addAttribute("giaTriGiam", session.getAttribute("giaTriGiam"));
        return "BanHang/ban-hang-onl";
    }

    @GetMapping("/t-shirt-luxury/ban-hang-onl/getVoucher")
    public String getVoucher(@RequestParam("idVoucher") Integer idVC, HttpSession session) {
        Integer giaTriGiam = voucherRepo.getGiaTriGiam(idVC);
        session.setAttribute("giaTriGiam", giaTriGiam);
        Voucher voucher = voucherRepo.getReferenceById(idVC);
        session.setAttribute("voucher",voucher);

        return "redirect:/t-shirt-luxury/ban-hang-onl";
    }

    @GetMapping("/t-shirt-luxury/ban-hang-onl/plus")
    public String plusSLGHCTBanHang(@RequestParam("id") Integer id, HttpSession session) {
        GioHangChiTiet gioHangChiTiet = gioHangChiTietRepo.getReferenceById(id);

        gioHangChiTiet.setId(id);
        gioHangChiTiet.setSoLuong(gioHangChiTiet.getSoLuong() + 1);
        gioHangChiTietRepo.save(gioHangChiTiet);


        return "redirect:/t-shirt-luxury/ban-hang-onl";
    }

    @GetMapping("/t-shirt-luxury/ban-hang-onl/subtract")
    public String subtractSLGHCTBanHang(@RequestParam("id") Integer id) {
        GioHangChiTiet gioHangChiTiet = gioHangChiTietRepo.getReferenceById(id);
        if (gioHangChiTiet.getSoLuong() > 1) {
            gioHangChiTiet.setId(id);
            gioHangChiTiet.setSoLuong(gioHangChiTiet.getSoLuong() - 1);
            gioHangChiTietRepo.save(gioHangChiTiet);
        } else {
            gioHangChiTiet.setId(id);
            gioHangChiTiet.setSoLuong(gioHangChiTiet.getSoLuong());
            gioHangChiTietRepo.save(gioHangChiTiet);
        }
        return "redirect:/t-shirt-luxury/ban-hang-onl";
    }

    @PostMapping("/t-shirt-luxury/ban-hang-onl/createHD")
    public String createHD( HttpSession session,ThongTinNhanHang thongTinNhanHang) {
        thongTinDonHangRepo.save(thongTinNhanHang);
        HoaDon hoaDon = new HoaDon();
        hoaDon.setNgaySua(new Date());
        hoaDon.setNgayTao(new Date());
        hoaDon.setTrangThai(0);
        hoaDon.setThongTinNhanHang(thongTinNhanHang);
        hoaDonRepo.save(hoaDon);

        session.setAttribute("hoaDon", hoaDon);
        session.setAttribute("idHoaDon", hoaDon.getId());

        return "redirect:/t-shirt-luxury/ban-hang-onl";
    }
    @PostMapping("/t-shirt-luxury/ban-hang-onl/doneHD")
    public String addSPCT(@RequestParam("tongTienHoaDonOnl") Float tongTien , HttpSession session){
        HoaDonChiTiet hoaDonChiTiet = new HoaDonChiTiet();
        HoaDon  hoaDon = (HoaDon) session.getAttribute("hoaDon");
        hoaDon.setVoucher((Voucher) session.getAttribute("voucher"));
        hoaDon.setTongTien(tongTien);
        hoaDon.setTrangThai(2);
        hoaDon.setLoaiHoaDon("Hóa Đơn Online");
        hoaDonRepo.save(hoaDon);
        Integer idGioHang = (Integer) session.getAttribute("idGioHang");
        List<GioHangChiTiet> gioHangChiTiets = gioHangChiTietRepo.gioHangChiTietByID(idGioHang);
        List<Integer>listIDSPCT = gioHangChiTietRepo.findIdSanPhamChiTietByIdGioHang(idGioHang);
        for(int i =0; i <= gioHangChiTiets.size(); i++){
            for (Integer idSPCT : listIDSPCT){
                SanPhamChiTiet sanPhamChiTiet = sanPhamChiTietRepo.getReferenceById(idSPCT);
                hoaDonChiTiet.setHoaDon(hoaDon);
                hoaDonChiTiet.setSanPhamChiTiet(sanPhamChiTiet);

                hoaDonChiTietRepo.save(hoaDonChiTiet);
            }
        }
        gioHangChiTietRepo.deleteByIdGioHang(idGioHang);
        return "redirect:/t-shirt-luxury/trang-chu";
    }


}
