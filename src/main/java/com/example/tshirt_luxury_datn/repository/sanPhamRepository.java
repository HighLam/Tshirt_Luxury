package com.example.tshirt_luxury_datn.repository;

import com.example.tshirt_luxury_datn.entity.HoaDon;
import com.example.tshirt_luxury_datn.entity.SanPham;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface sanPhamRepository  extends JpaRepository<SanPham, Integer> {
    @Query(value = "SELECT * FROM san_pham WHERE ten_san_pham LIKE  %:keyWord% ",nativeQuery = true)
    List<SanPham> timKiem(@Param("keyWord") String keyWord);
}
