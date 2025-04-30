package com.example.tshirt_luxury_datn.repository;

import com.example.tshirt_luxury_datn.enums.OrderStatus;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
    long countByStatus(OrderStatus status);


    List<Order> findTop5ByOrderByOrderDateDesc();

    @SuppressWarnings("null")
    Page<Order> findAll(Pageable pageable);

    List<Order> findByUserId(Long userId);

    Page<Order> findByCodeIgnoreCaseStartingWithAndStatus(String code, OrderStatus status, Pageable pageable);

    Page<Order> findByCodeIgnoreCaseStartingWith(String code, Pageable pageable);

    Page<Order> findByStatus(OrderStatus status, Pageable pageable);

    Optional<Order> findByCode(String code);
}
