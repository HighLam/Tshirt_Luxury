
package com.example.tshirt_luxury_datn.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.example.tshirt_luxury_datn.dto.DiscountDTO;
import com.example.tshirt_luxury_datn.services.DiscountService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class DiscountController {
    @Autowired
    private DiscountService discountService;

    @GetMapping("/admin/discount")
    public String listDiscount(Model model) {
        model.addAttribute("discounts", discountService.getAllDiscounts());
        return "admin/Discounts/discount";
    }
}