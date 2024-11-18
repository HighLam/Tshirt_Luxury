package com.example.tshirt_luxury_datn.repository;

import com.example.tshirt_luxury_datn.entity.GioHangChiTiet;
import com.example.tshirt_luxury_datn.entity.SanPhamChiTiet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface gioHangChiTietRepository extends JpaRepository<GioHangChiTiet, Integer> {

    @Query(value = "SELECT * FROM gio_hang_chi_tiet WHERE id_gio_hang = :idGioHang", nativeQuery = true)
    List<GioHangChiTiet> gioHangChiTietByID(@Param("idGioHang") Integer idGioHang);

    @Query(value = "SELECT SUM(ghct.so_luong * spct.gia)  " +
            "FROM gio_hang_chi_tiet ghct " +
            "JOIN san_pham_chi_tiet spct ON ghct.id_san_pham_chi_tiet = spct.id",
            nativeQuery = true)
    Float tinhTongGia();

}
