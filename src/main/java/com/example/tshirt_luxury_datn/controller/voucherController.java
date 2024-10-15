package com.example.tshirt_luxury_datn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class voucherController {

    @GetMapping("/t-shirt-luxury/admin/voucher")
    public String Voucher(Model model) {
        return "voucher/voucher";
    }
}
