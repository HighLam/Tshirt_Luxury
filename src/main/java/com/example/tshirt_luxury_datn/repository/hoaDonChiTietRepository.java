package com.example.tshirt_luxury_datn.repository;

import com.example.tshirt_luxury_datn.entity.HoaDonChiTiet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface hoaDonChiTietRepository extends JpaRepository<HoaDonChiTiet ,Integer> {

}
