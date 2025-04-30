package com.example.tshirt_luxury_datn.controller;


import com.example.tshirt_luxury_datn.repository.danhMucRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Date;

@RequestMapping("/t-shirt-luxury/admin")
@Controller
public class danhMucController {


    @Autowired
    danhMucRepository danhMucRepository;

    public String generateMaDanhMuc() {
        // Lấy mã hóa đơn lớn nhất từ cơ sở dữ liệu
        String lastMaDanhMuc = danhMucRepository.findLastMaDanhMuc(); // Giả sử phương thức này trả về "HD005"

        int nextNumber = 1; // Số bắt đầu nếu không có hóa đơn nào
        if (lastMaDanhMuc != null && lastMaDanhMuc.startsWith("DM")) {
            // Lấy phần số từ mã hóa đơn cuối cùng
            String numberPart = lastMaDanhMuc.substring(2); // Bỏ "HD"
            nextNumber = Integer.parseInt(numberPart) + 1;
        }

        // Format mã hóa đơn mới với 3 chữ số (HD001, HD002, ...)
        return String.format("DM%03d", nextNumber);
    }

    boolean validateAdd(DanhMuc danhMuc, RedirectAttributes redirectAttributes) {

        if (danhMuc.getTenDanhMuc() == null || danhMuc.getTenDanhMuc().isEmpty()) {
            String message = "Vui lòng nhập tên danh mục !";
            redirectAttributes.addFlashAttribute("errorTenDanhMuc", message);
            redirectAttributes.addFlashAttribute("openModal", "themDanhMuc");
            return false;
        } else {
            redirectAttributes.addFlashAttribute("tenDanhMuc", danhMuc.getTenDanhMuc());
        }
        return true;
    }

    @GetMapping("/danh-muc")
    public String danhMucAdmin(Model model) {
        model.addAttribute("danhMuc", danhMucRepository.findAll());
        return "DanhMuc/danh-muc-admin";
    }

    @GetMapping("/danh-muc/delete")
    public String danhMucAdminDelete(@RequestParam("id") Integer id, Model model) {
        if (!danhMucRepository.existsById(id)) {
            model.addAttribute("error", "ID không tồn tại.");
            return "redirect:/t-shirt-luxury/admin/danh-muc";
        }
        danhMucRepository.deleteById(id);
        return "redirect:/t-shirt-luxury/admin/danh-muc";
    }

    @PostMapping("/danh-muc/add")
    public String danhMucAdminAdd(@ModelAttribute("danhMuc") DanhMuc danhMuc, RedirectAttributes redirectAttributes) {
        if(validateAdd(danhMuc,redirectAttributes)){
            danhMuc.setMaDanhMuc(generateMaDanhMuc());
            danhMuc.setNgayTao(new Date());
            danhMuc.setNgaySua(new Date());
            danhMucRepository.save(danhMuc);
        }
        return "redirect:/t-shirt-luxury/admin/danh-muc";
    }

    @GetMapping("/danh-muc/getOne")
    public String getOneDanhMuc(@RequestParam(name = "id") Integer id, Model model) {

        DanhMuc danhMuc = danhMucRepository.getOne(id);
        model.addAttribute("danhMuc", danhMuc);
        return "DanhMuc/sua-danh-muc-admin";
    }


    @PostMapping("/danh-muc/update")
    public String updateNguoiDung(@RequestParam("id") Integer id, @ModelAttribute("danhMuc") DanhMuc danhMuc,
                                  RedirectAttributes redirectAttributes, @RequestParam("tenDanhMuc") String tenDanhMuc) {
        DanhMuc getOne = danhMucRepository.getReferenceById(id);
        if (getOne.getId() == id) {
            if(tenDanhMuc == null || tenDanhMuc.isEmpty()){
                String message = "Vui lòng nhập tên danh mục !";
                redirectAttributes.addFlashAttribute("errorTenDanhMuc", message);
                return "redirect:/t-shirt-luxury/admin/danh-muc/getOne?id=" + id;
            }else {
                Date ngaySua = new Date();
                danhMuc.setId(id);
                danhMuc.setNgaySua(ngaySua);
                danhMuc.setNgayTao(getOne.getNgayTao());
                danhMucRepository.save(danhMuc);
            }
        }
        return "redirect:/t-shirt-luxury/admin/danh-muc";
    }
}
