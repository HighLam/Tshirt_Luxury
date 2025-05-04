package com.example.tshirt_luxury_datn.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.tshirt_luxury_datn.entity.Cart;
import com.example.tshirt_luxury_datn.entity.User;

@Repository
public interface CartRepository extends JpaRepository<Cart, Long> {
    Optional<Cart> findByUser(User user);

    Cart findByUserId(Long userId);
}
