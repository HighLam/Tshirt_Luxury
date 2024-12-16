package com.example.tshirt_luxury_datn.repository;

import com.example.tshirt_luxury_datn.entity.NguoiDung;
import com.example.tshirt_luxury_datn.entity.NguoiDungChiTiet;
import com.example.tshirt_luxury_datn.entity.SanPham;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface nguoiDungRepository extends JpaRepository<NguoiDung, Integer> {
    @Query(value = "SELECT TOP 1 ma_nguoi_dung FROM nguoi_dung ORDER BY ma_nguoi_dung DESC", nativeQuery = true)
    String findLastMaNguoiDung();
}
