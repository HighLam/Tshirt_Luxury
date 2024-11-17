package com.example.tshirt_luxury_datn.controller;


import com.example.tshirt_luxury_datn.entity.*;
import com.example.tshirt_luxury_datn.repository.*;
import com.example.tshirt_luxury_datn.response.sanPhamResponse;
import jakarta.servlet.http.HttpSession;
import com.example.tshirt_luxury_datn.repository.sanPhamRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;
import java.util.List;

@Controller
public class trangChuController {
    @Autowired
    sanPhamRepository sanPhamRepo;
    @Autowired
    sanPhamChiTietRepository sanPhamChiTietRepo;
    @Autowired
    gioHangRepository gioHangRepo;

    @Autowired
    sanPhamChiTietAdminRepository sanPhamChiTietAdminRepo;

    @Autowired
    gioHangChiTietRepository gioHangChiTietRepo;


    public GioHang createGioHang(HttpSession session) {
        GioHang gioHang = new GioHang();

        if (gioHangRepo.trangThaiGioHang() == 1) {
            gioHang.setNgaySua(new Date());
            gioHang.setNgayTao(new Date());
            gioHang.setTrangThai(0);
            gioHangRepo.save(gioHang);
        }

        session.setAttribute("idGioHang", gioHang.getId());
        return gioHang;
    }


    @GetMapping("/t-shirt-luxury/trang-chu")
    public String trangChu(Model model) {
        Pageable pageable = PageRequest.of(0, 4); // Lấy 4 sản phẩm mới nhất
        List<sanPhamResponse> sanPhamList = sanPhamRepo.findTop4NewestSanPhamWithGia(pageable);
        System.out.println(sanPhamList);
        model.addAttribute("sanPhamList", sanPhamList);
        return "BanHang/trang-chu";

    }


    @GetMapping("/t-shirt-luxury/san-pham-chi-tiet-detail")
    public String sanPhamChiTietDetail(@RequestParam("idSPDetail") Integer id, Model model, HttpSession session) {
        model.addAttribute("spDetail",sanPhamRepo.getReferenceById(id));
        model.addAttribute("mauSac",sanPhamChiTietRepo.findMauSacBySanPhamId(id));
        model.addAttribute("size",sanPhamChiTietRepo.findSizesBySanPhamId(id));


        if(gioHangRepo.trangThaiGioHang() == 1){
            createGioHang(session);
        }


        session.setAttribute("idSPDetail", id);
        return "SanPhamChiTiet/san-pham-chi-tiet";
    }

//    @GetMapping("/t-shirt-luxury/gio-hang-canvas")
//    public String gioHangCanvas(@RequestParam("idSPDetail") Integer idSanPham,Model model,
//                                HttpSession session) {
//        int idGioHang = (Integer) session.getAttribute("idGioHang");
//        model.addAttribute("gioHang", gioHangRepo.getReferenceById(idGioHang));
//        gioHangChiTietRepo.gioHangChiTietByID(idGioHang);
//
//        return "redirect:/t-shirt-luxury/san-pham-chi-tiet-detail?idSPDetail=" + idSanPham;
//    }


    @PostMapping("/t-shirt-luxury/san-pham-chi-tiet/add-cart")
    public String addCart(@RequestParam("idSPDetail") Integer idSanPham,
                          @RequestParam("mauSac") Integer idMauSac,
                          @RequestParam("size") Integer idSize, HttpSession session) {

        SanPhamChiTiet sanPhamChiTiet = sanPhamChiTietAdminRepo.getSanPhamChiTiet(idMauSac, idSize, idSanPham);

        Integer idGioHang = (Integer) session.getAttribute("idGioHang");

        GioHangChiTiet gioHangChiTiet = new GioHangChiTiet();
        gioHangChiTiet.setGioHang(gioHangRepo.getReferenceById(idGioHang));
        gioHangChiTiet.setNgayTao(new Date());
        gioHangChiTiet.setNgaySua(new Date());
        gioHangChiTiet.setSanPhamChiTiet(sanPhamChiTiet);


        // Lưu bản ghi mới
        gioHangChiTietRepo.save(gioHangChiTiet);

        return "redirect:/t-shirt-luxury/san-pham-chi-tiet-detail?idSPDetail=" + idSanPham;
    }




}
