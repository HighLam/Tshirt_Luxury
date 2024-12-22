package com.example.tshirt_luxury_datn.repository;

import com.example.tshirt_luxury_datn.entity.DanhMuc;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface danhMucRepository extends JpaRepository<DanhMuc, Integer> {

    @Query(value = "SELECT TOP 1 ma_danh_muc FROM danh_muc ORDER BY ma_danh_muc DESC", nativeQuery = true)
    String findLastMaDanhMuc();
}
