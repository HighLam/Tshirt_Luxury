package com.example.tshirt_luxury_datn.repository;

import com.example.tshirt_luxury_datn.entity.HoaDon;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface hoaDonRepository extends JpaRepository<HoaDon, Integer> {
}
