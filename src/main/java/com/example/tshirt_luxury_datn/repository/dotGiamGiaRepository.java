package com.example.tshirt_luxury_datn.repository;

import com.example.tshirt_luxury_datn.entity.DotGiamGia;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface dotGiamGiaRepository extends JpaRepository<DotGiamGia, Integer> {
    @Query(value = "SELECT TOP 1 ma_dot_giam_gia FROM dot_giam_gia ORDER BY ma_dot_giam_gia DESC", nativeQuery = true)
    String findLastMaDotGiamGia();
}
