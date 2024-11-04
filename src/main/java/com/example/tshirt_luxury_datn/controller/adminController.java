package com.example.tshirt_luxury_datn.controller;

import com.example.tshirt_luxury_datn.entity.MauSac;
import com.example.tshirt_luxury_datn.entity.SanPham;
import com.example.tshirt_luxury_datn.entity.SanPhamChiTiet;
import com.example.tshirt_luxury_datn.entity.Size;
import com.example.tshirt_luxury_datn.repository.*;
import com.example.tshirt_luxury_datn.response.MauSacReponse;
import com.example.tshirt_luxury_datn.response.SizeReponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
public class adminController {
    @Autowired
    sanPhamChiTietAdminRepository sanPhamChiTietAdminRepo;

    @Autowired
    hoaDonChiTietRepository hoaDonChiTietRepo;

    @Autowired
    hoaDonRepository hoaDonRepo;

    @Autowired
    sanPhamRepository sanPhamRepo;

    @Autowired
    mauSacRepository mauSacRepo;

    @Autowired
    sizeRepository sizeRepository;

    @GetMapping("t-shirt-luxury/admin")
    public String getSanPhamChiTiet(Model model) {
        model.addAttribute("SP", sanPhamRepo.findAll());
        return "Admin/admin";
    }

    @GetMapping("/t-shirt-luxury/admin/getTest")
    @ResponseBody
    public Map<String, Object> getProductById(@RequestParam(name = "idRequest") Integer idSanPham) {
        Map<String, Object> response = new HashMap<>();
        SanPham sanPham = sanPhamRepo.getReferenceById(idSanPham);
        // Xử lý dữ liệu dựa trên idTEST (ví dụ: lấy thông tin từ CSDL)
        // Đây chỉ là ví dụ trả về ID sản phẩm, có thể thêm thông tin khác nếu cần
        response.put("id", idSanPham);
        response.put("tenSanPham", sanPham.getTenSanPham());

        //Lấy màu sắc của từng sản phẩm
        List<Integer> listIdMauSac = sanPhamChiTietAdminRepo.getIdMauSac(idSanPham);
        List<MauSacReponse> listMauSacReponse = listIdMauSac.stream()
                .map(idMS -> {
                    MauSac mauSac = mauSacRepo.getReferenceById(idMS);
                    return new MauSacReponse(mauSac.getId(), mauSac.getTenMauSac());
                })
                .collect(Collectors.toList());


        response.put("listMauSac", listMauSacReponse);

        //Lấy size của từng sản phẩm
        List<Integer> listIdSize = sanPhamChiTietAdminRepo.getIdSize(idSanPham);
        List<SizeReponse> listSizeReponse = listIdSize.stream()
                .map(idSize -> {
                    Size size = sizeRepository.getReferenceById(idSize);
                    return new SizeReponse(size.getId(), size.getTenSize());
                })
                .collect(Collectors.toList());
        response.put("listSize", listSizeReponse);

        return response;
    }

    @PostMapping("/t-shirt-luxury/admin/getIdMau")
    public String getidMau(
            @RequestParam(name = "idMau") Integer idMau,
            @RequestParam(name = "idSize") Integer idSize

    ) {
        SanPhamChiTiet sanPhamChiTiet1 = sanPhamChiTietAdminRepo.getSanPhamChiTiet(idMau, idSize);
        System.out.println(sanPhamChiTiet1);

        return "redirect:/t-shirt-luxury/admin";
    }

}
