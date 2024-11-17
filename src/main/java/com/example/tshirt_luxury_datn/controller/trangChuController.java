package com.example.tshirt_luxury_datn.controller;

import com.example.tshirt_luxury_datn.repository.gioHangRepository;
import com.example.tshirt_luxury_datn.repository.sanPhamChiTietRepository;
import com.example.tshirt_luxury_datn.repository.sanPhamRepository;
import com.example.tshirt_luxury_datn.response.sanPhamResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class trangChuController {
    @Autowired
    sanPhamRepository sanPhamRepo;
    @Autowired
    sanPhamChiTietRepository sanPhamChiTietRepo;
    @Autowired
    gioHangRepository gioHangRepo;
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
        model.addAttribute("gioHang",gioHangRepo.findByGioHangId());
        System.out.println("oqwuegrhjejrhdsjaklsdfj"+sanPhamChiTietRepo.findMauSacBySanPhamId(id));

        session.setAttribute("idSPDetail", id);
        return "SanPhamChiTiet/san-pham-chi-tiet";
    }


}
