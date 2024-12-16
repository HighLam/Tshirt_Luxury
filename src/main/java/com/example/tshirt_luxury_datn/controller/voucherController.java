package com.example.tshirt_luxury_datn.controller;

import com.example.tshirt_luxury_datn.entity.DotGiamGia;
import com.example.tshirt_luxury_datn.entity.Voucher;
import com.example.tshirt_luxury_datn.repository.voucherRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;

@Controller
public class voucherController {
    @Autowired
    voucherRepository voucherRepo;

    public String generateMaVoucher() {
        // Lấy mã hóa đơn lớn nhất từ cơ sở dữ liệu
        String lastMaVoucher = voucherRepo.findLastMaVoucher(); // Giả sử phương thức này trả về "HD005"

        int nextNumber = 1; // Số bắt đầu nếu không có hóa đơn nào
        if (lastMaVoucher != null && lastMaVoucher.startsWith("VC")) {
            // Lấy phần số từ mã hóa đơn cuối cùng
            String numberPart = lastMaVoucher.substring(2); // Bỏ "HD"
            nextNumber = Integer.parseInt(numberPart) + 1;
        }

        // Format mã hóa đơn mới với 3 chữ số (HD001, HD002, ...)
        return String.format("VC%03d", nextNumber);
    }
    @GetMapping("/t-shirt-luxury/admin/voucher")
    public String Voucher(Model model) {
        model.addAttribute("listVoucher", voucherRepo.findAll());
        return "voucher/voucher";
    }
    @PostMapping("/t-shirt-luxury/admin/voucher/add")
    public String voucherAdd(@ModelAttribute("listVoucher") Voucher voucher){
        voucher.setMaVoucher(generateMaVoucher());
        voucher.setNgayBatDau(new Date());
        voucher.setNgayKetThuc(new Date());
        voucherRepo.save(voucher);
        return "redirect:/t-shirt-luxury/admin/voucher";
    }
    @GetMapping("/t-shirt-luxury/admin/voucher/delete")
    public String voucherDelete(@RequestParam("id")Integer id){
        voucherRepo.deleteById(id);
        return "redirect:/t-shirt-luxury/admin/voucher";
    }
    @GetMapping("/t-shirt-luxury/admin/voucher/getOne")
    public String getOneVoucher(@RequestParam("id") Integer id, Model model){
        Voucher voucher  = voucherRepo.getOne(id);
        model.addAttribute("voucher", voucher);
        return "voucher/update-voucher";
    }
    @PostMapping("/t-shirt-luxury/admin/voucher/update")
    public String updateVoucher(@RequestParam("id") Integer id,
                                @ModelAttribute("voucher") Voucher voucher){
        Voucher getOne = voucherRepo.getReferenceById(id);
        if(getOne.getId() == id){
            Date ngayBatDau = new Date();
            voucher.setId(id);
            voucher.setNgayBatDau(ngayBatDau);
            voucher.setNgayKetThuc(getOne.getNgayBatDau());
            voucherRepo.save(voucher);
        }
        return "redirect:/t-shirt-luxury/admin/voucher";
    }
}
