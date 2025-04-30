package com.example.tshirt_luxury_datn.controller;

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
    dotGiamGiaRepository dotGiamGiaRepo;
    @Autowired
    danhMucRepository danhMucRepo;

    public String generateMaDotGiamGia() {
        // Lấy mã hóa đơn lớn nhất từ cơ sở dữ liệu
        String lastMaDotGiamGia = dotGiamGiaRepo.findLastMaDotGiamGia(); // Giả sử phương thức này trả về "HD005"

        int nextNumber = 1; // Số bắt đầu nếu không có hóa đơn nào
        if (lastMaDotGiamGia != null && lastMaDotGiamGia.startsWith("DGG")) {
            // Lấy phần số từ mã hóa đơn cuối cùng
            String numberPart = lastMaDotGiamGia.substring(2); // Bỏ "HD"
            nextNumber = Integer.parseInt(numberPart) + 1;
        }

        // Format mã hóa đơn mới với 3 chữ số (HD001, HD002, ...)
        return String.format("DGG%03d", nextNumber);
    }

    @GetMapping("/t-shirt-luxury/admin/giam-gia")
    public String dotGiamGia(Model model) {
        model.addAttribute("listGiamGia", dotGiamGiaRepo.findAll());
        return "DotGiamGia/dot-giam-gia-admin";
    }
    @PostMapping("/t-shirt-luxyry/admin/giam-gia/add")
    public String addGiamGia(DotGiamGia dotGiamGia){
        dotGiamGia.setMaDotGiamGia(generateMaDotGiamGia());
        dotGiamGia.setNgayBatDau(new Date());
        dotGiamGia.setNgayKetThuc(new Date());

        dotGiamGiaRepo.save(dotGiamGia);
        return "redirect:/t-shirt-luxury/admin/giam-gia";
    }
    @GetMapping("/t-shirt-luxury/admin/giam-gia/delete")
    public String giamGiaDelete(@RequestParam("id") Integer id){
        dotGiamGiaRepo.deleteById(id);
        return "redirect:/t-shirt-luxury/admin/giam-gia";
    }
    @GetMapping("/t-shirt-luxury/admin/giam-gia/getOne")
    public String getOneGiamGia(@RequestParam("id") Integer id, Model model){
        DotGiamGia dotGiamGia = dotGiamGiaRepo.getOne(id);
        model.addAttribute("dotGiamGia", dotGiamGia);
        return "DotGiamGia/sua-giam-gia";
    }
    @PostMapping("/t-shirt-luxury/admin/giam-gia/update")
    public String updateGiamGia(@RequestParam("id") Integer id,
                                @ModelAttribute("dotGiamGia") DotGiamGia dotGiamGia){
        DotGiamGia getOne = dotGiamGiaRepo.getReferenceById(id);
        if(getOne.getId() == id){
            Date ngayBatDau = new Date();
            dotGiamGia.setId(id);
            dotGiamGia.setNgayBatDau(ngayBatDau);
            dotGiamGia.setNgayKetThuc(getOne.getNgayBatDau());
            dotGiamGiaRepo.save(dotGiamGia);
        }
        return "redirect:/t-shirt-luxury/admin/giam-gia";
    }
}
