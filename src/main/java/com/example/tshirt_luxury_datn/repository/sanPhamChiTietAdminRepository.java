package com.example.tshirt_luxury_datn.repository;

import com.example.tshirt_luxury_datn.entity.SanPhamChiTiet;
import com.example.tshirt_luxury_datn.response.sanPhamChiTietAdminRespone;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface sanPhamChiTietAdminRepository extends JpaRepository<SanPhamChiTiet,Integer> {

    @Query("SELECT spct FROM SanPhamChiTiet spct WHERE spct.sanPham.id = :sanPhamId")
    List<SanPhamChiTiet> findBySanPhamId(@Param("sanPhamId") Integer sanPhamId);
}
