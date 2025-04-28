package com.example.tshirt_luxury_datn.repository;

import com.example.tshirt_luxury_datn.entity.Cart;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface CartRepository extends JpaRepository<Cart, Long> {
    Optional<Cart> findByUser(User user);

    Cart findByUserId(Long userId);
}
