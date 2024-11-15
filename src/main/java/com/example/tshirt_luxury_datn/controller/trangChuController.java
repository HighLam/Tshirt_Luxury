package com.example.tshirt_luxury_datn.controller;

import com.example.tshirt_luxury_datn.repository.sanPhamRepository;
import com.example.tshirt_luxury_datn.response.sanPhamResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class trangChuController {

@Autowired
sanPhamRepository sanPhamRepo;

    @GetMapping("/t-shirt-luxury/trang-chu")
    public String trangChu(Model model) {
        Pageable pageable = PageRequest.of(0, 4); // Lấy 4 sản phẩm mới nhất
        List<sanPhamResponse> sanPhamList = sanPhamRepo.findTop4NewestSanPhamWithGia(pageable);
        System.out.println(sanPhamList);
        model.addAttribute("sanPhamList", sanPhamList);
        return "BanHang/trang-chu";
    }
}
