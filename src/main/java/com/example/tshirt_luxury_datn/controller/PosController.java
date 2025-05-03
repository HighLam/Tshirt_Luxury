package com.example.tshirt_luxury_datn.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.tshirt_luxury_datn.dto.CartItemDTO;
import com.example.tshirt_luxury_datn.dto.OrderDTO;
import com.example.tshirt_luxury_datn.dto.ProductDTO;
import com.example.tshirt_luxury_datn.dto.ProductDetailDTO;
import com.example.tshirt_luxury_datn.entity.CartItem;
import com.example.tshirt_luxury_datn.entity.Order;
import com.example.tshirt_luxury_datn.entity.Product;
import com.example.tshirt_luxury_datn.entity.ProductDetail;
import com.example.tshirt_luxury_datn.services.CartService;
import com.example.tshirt_luxury_datn.services.OrderService;
import com.example.tshirt_luxury_datn.services.ProductDetailService;
import com.example.tshirt_luxury_datn.services.ProductService;

import jakarta.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequestMapping("/admin/pos")
public class PosController {
    @Autowired
    private ProductDetailService productDetailService;

    @Autowired
    private CartService cartService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private ProductService productService;

    @GetMapping
    public String PointOfSale(Model model,
                              @RequestParam(required = false) String code,
                              HttpSession session,
                              @RequestParam(defaultValue = "0") int page,
                              @RequestParam(defaultValue = "6") int size) {

        Pageable pageable = PageRequest.of(page, size);
        Page<Product> productPage;

        if (code != null && !code.isEmpty()) {
            productPage = productService.searchProducts(code, true, pageable);
            if (productPage.isEmpty()) {
                model.addAttribute("message", "Không tìm thấy sản phẩm nào với mã: " + code);
                // Optionally, you could get all products instead of showing empty page
                productPage = productService.getAllProduct(pageable);
            }
        } else {
            productPage = productService.getAllProduct(pageable);
        }
        Page<ProductDTO> productDTOPage = productPage.map(ProductDTO::new);

        @SuppressWarnings("unchecked")
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (cart == null) {
            cart = new ArrayList<>();
            session.setAttribute("cart", cart);
        }

        List<CartItemDTO> cartItems = cartService.pos_cartItem(cart);
        model.addAttribute("products", productDTOPage.getContent());
        model.addAttribute("cart", cartItems);
        model.addAttribute("total", cartService.pos_caculateTotal(cart));
        model.addAttribute("currentPage", productDTOPage.getNumber());
        model.addAttribute("totalPages", productDTOPage.getTotalPages());
        model.addAttribute("pageSize", size);
        model.addAttribute("code", code);

        return "admin/Pos/pos";
    }
}