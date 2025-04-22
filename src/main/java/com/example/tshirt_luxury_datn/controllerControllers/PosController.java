package com.example.tshirt_luxury_datn.controllerControllers;

import com.example.tshirt_luxury_datn.dto.CartItemDTO;
import com.example.tshirt_luxury_datn.dto.OrderDTO;
import com.example.tshirt_luxury_datn.dto.ProductDetailDTO;
import com.example.tshirt_luxury_datn.entity.CartItem;
import com.example.tshirt_luxury_datn.entity.Order;
import com.example.tshirt_luxury_datn.entity.ProductDetail;
import com.example.tshirt_luxury_datn.services.CartService;
import com.example.tshirt_luxury_datn.services.OrderService;
import com.example.tshirt_luxury_datn.services.ProductDetailService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/admin/pos")
public class PosController {
    @Autowired
    private ProductDetailService productDetailService;

    @Autowired
    private CartService cartService;

    @Autowired
    private OrderService orderService;

    @GetMapping
    public String PointOfSale(Model model, @RequestParam(required = false) String code, HttpSession session,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "6") int size) {
        // List<Product> list = (code != null && !code.isEmpty()) ?
        // productService.searchProductByName(code)
        // : productService.getAllProduct();
        Pageable pageable = PageRequest.of(page, size);
        Page<ProductDetail> productPage;
        if (code != null && !code.isEmpty()) {
            productPage = productDetailService.searchProductDetail(code, pageable);
        } else {
            productPage = productDetailService.getAllProductDetail(pageable);
        }
        @SuppressWarnings("unchecked")
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (cart == null) {
            cart = new ArrayList<>();
            session.setAttribute("cart", cart);
        }
        
        List<CartItemDTO> cartItems = cartService.pos_cartItem(cart);
        model.addAttribute("products", productPage.getContent());
        model.addAttribute("cart", cartItems);
        model.addAttribute("total", cartService.pos_caculateTotal(cart));
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", productPage.getTotalPages());
        model.addAttribute("pageSize", size);
        model.addAttribute("code", code);
        return "admin/Pos/pos";
    }

    @GetMapping("/product-details")
    @ResponseBody
    public List<ProductDetailDTO> getProductDetails(@RequestParam Long productId) {
        List<ProductDetail> details = productDetailService.getProductDetailByProductId(productId);
        return details.stream()
                .map(ProductDetailDTO::new)
                .collect(Collectors.toList());
    }

    @PostMapping
    public String handlePOSAction(@RequestParam String action, @RequestParam(required = false) String productCode,
            @RequestParam(required = false) Integer quantity, @RequestParam(required = false) String code,
            OrderDTO orderDTO,
            HttpSession session, Model model) {
        @SuppressWarnings("unchecked")
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        switch (action) {
            case "add":
                ProductDetail p = productDetailService.getProductDetailByCode(code);
                if (p != null) {
                    cartService.pos_addToCart(cart, p);
                }
                break;
            case "update":
                cartService.pos_updateQuantity(cart, code, quantity);
                break;
            case "remove":
                cartService.pos_removeFromCart(cart, code);
                break;
            case "clear":
                cart.clear();
                break;
            case "checkout":
                if (cart != null && !cart.isEmpty()) {
                    Order order = orderService.orderInStore(cart, orderDTO);
                    cart.clear();
                    model.addAttribute("message", order.getCode());
                }
                break;
            default:
                break;
        }
        session.setAttribute("cart", cart);
        return "redirect:/admin/pos";
    }

}
