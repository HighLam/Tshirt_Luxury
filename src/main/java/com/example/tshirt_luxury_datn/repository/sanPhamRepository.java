package com.example.tshirt_luxury_datn.repository;

import com.example.tshirt_luxury_datn.entity.HoaDon;
import com.example.tshirt_luxury_datn.entity.SanPham;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface sanPhamRepository  extends JpaRepository<SanPham, Integer> {

}
