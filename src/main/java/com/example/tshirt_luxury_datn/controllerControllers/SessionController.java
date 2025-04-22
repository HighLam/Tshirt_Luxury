package com.example.tshirt_luxury_datn.controllerControllers;

import com.example.tshirt_luxury_datn.entity.CartItem;
import com.example.tshirt_luxury_datn.entity.User;
import com.example.tshirt_luxury_datn.services.CartService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class SessionController {
    @Autowired
    private CartService cartService;

    @GetMapping("/getCurrent")
    public ResponseEntity<?> getCurrentUser(HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");

        if (loggedInUser == null) {
            return ResponseEntity.badRequest().body("Chưa đăng nhập!");
        }

        return ResponseEntity.ok(loggedInUser);
    }

    @PostMapping("/api/updateCart")
    public ResponseEntity<String> updateCartItemQuantity(@RequestParam String code, @RequestParam Integer quantity,
            HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser != null) {
            cartService.updateCartItemQuantity(code, quantity, loggedInUser);
        } else {
            List<CartItem> cart = (List<CartItem>) session.getAttribute("userCart");
            cartService.pos_updateQuantity(cart, code, quantity);
            session.setAttribute("userCart", cart);
        }

        return ResponseEntity.ok("ok");
    }

}
