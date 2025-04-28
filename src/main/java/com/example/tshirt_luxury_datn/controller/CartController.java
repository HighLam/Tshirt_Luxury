package com.example.tshirt_luxury_datn.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class CartController {
    @Autowired
    private CartService cartService;

    @Autowired
    private ProductDetailService productDetailService;

}
