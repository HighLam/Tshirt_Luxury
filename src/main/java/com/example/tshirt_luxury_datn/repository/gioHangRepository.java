package com.example.tshirt_luxury_datn.repository;

import com.example.tshirt_luxury_datn.entity.GioHang;
import com.example.tshirt_luxury_datn.entity.SanPhamChiTiet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface gioHangRepository extends JpaRepository<GioHang, Integer> {
    @Query("SELECT spct FROM SanPhamChiTiet spct WHERE spct.gioHang.id = :idGioHang")
    List<SanPhamChiTiet> findByGioHangId(@Param("idGioHang") Integer idGioHang);
}
