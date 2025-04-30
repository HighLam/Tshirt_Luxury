package com.example.tshirt_luxury_datn.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CartItemsRepository extends JpaRepository<CartItem, Long> {
    void deleteByCart(Cart cart);
}

