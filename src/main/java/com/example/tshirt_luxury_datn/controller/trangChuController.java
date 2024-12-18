package com.example.tshirt_luxury_datn.controller;

import com.example.tshirt_luxury_datn.entity.*;
import com.example.tshirt_luxury_datn.repository.*;
import com.example.tshirt_luxury_datn.response.sanPhamResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
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
            gioHang.setNgaySua(new Date());
            gioHang.setNgayTao(new Date());
            gioHang.setTrangThai(0);
            gioHangRepo.save(gioHang);
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
        model.addAttribute("spDetail", sanPhamRepo.getReferenceById(id));
        model.addAttribute("mauSac", sanPhamChiTietRepo.findMauSacBySanPhamId(id));
        model.addAttribute("size", sanPhamChiTietRepo.findSizesBySanPhamId(id));
        model.addAttribute("notiOnl",session.getAttribute("notiOnl"));
        model.addAttribute("quaSoLuong",session.getAttribute("quaSoLuong"));


        if (gioHangRepo.trangThaiGioHang() == 1) {
            createGioHang(session);
        }


        session.setAttribute("idSPDetail", id);
        return "SanPhamChiTiet/san-pham-chi-tiet";
    }


    @PostMapping("/t-shirt-luxury/san-pham-chi-tiet/add-cart")
    public String addCart(@RequestParam(value = "idSPDetail")  Integer idSanPham,
                          @RequestParam(value = "mauSac",defaultValue = "") Integer idMauSac,
                          @RequestParam("soLuong") Integer soLuong,
                          @RequestParam(value = "size",defaultValue = "") Integer idSize, HttpSession session) {
        Integer soLuongSpct = sanPhamChiTietAdminRepo.getSoLuong(idMauSac, idSize, idSanPham);

        if(idMauSac == null || idMauSac <= 0){
            String notiOnl = "Chưa chọn màu";
            session.setAttribute("notiOnl", notiOnl);
        }
        if(idSize == null || idSize <= 0){
            String notiOnl = "Chưa chọn size";
            session.setAttribute("notiOnl", notiOnl);
        }
        else {
            if (soLuong <= soLuongSpct) {
                SanPhamChiTiet sanPhamChiTiet = sanPhamChiTietAdminRepo.getSanPhamChiTiet(idMauSac, idSize, idSanPham);

                Integer idGioHang = (Integer) session.getAttribute("idGioHang");
                GioHang gioHang = gioHangRepo.getReferenceById(idGioHang);


                GioHangChiTiet gioHangChiTiet = new GioHangChiTiet();
                gioHangChiTiet.setGioHang(gioHang);
                gioHangChiTiet.setSoLuong(soLuong);
                gioHangChiTiet.setNgayTao(new Date());
                gioHangChiTiet.setNgaySua(new Date());
                gioHangChiTiet.setSanPhamChiTiet(sanPhamChiTiet);

                // Lưu bản ghi mới
                gioHangChiTietRepo.save(gioHangChiTiet);
                String gioHangNull = "";
                session.setAttribute("gioHangNull", gioHangNull);
                String quaSoLuong = "";
                session.setAttribute("quaSoLuong", quaSoLuong);




            } else {
                String quaSoLuong = "Số lượng không được vượt quá " + soLuongSpct;
                session.setAttribute("quaSoLuong", quaSoLuong);



            }
        }
        return "redirect:/t-shirt-luxury/san-pham-chi-tiet-detail?idSPDetail=" + idSanPham;
    }


}
