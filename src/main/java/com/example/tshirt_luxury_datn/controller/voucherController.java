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
    @GetMapping("/t-shirt-luxury/admin/voucher")
    public String Voucher(Model model) {
        model.addAttribute("listVoucher", voucherRepo.findAll());
        return "voucher/voucher";
    }
    @PostMapping("/t-shirt-luxury/admin/voucher/add")
    public String voucherAdd(@ModelAttribute("listVoucher") Voucher voucher){
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
