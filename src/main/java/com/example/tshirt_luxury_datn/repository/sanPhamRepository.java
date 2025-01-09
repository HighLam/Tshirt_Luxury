package com.example.tshirt_luxury_datn.repository;

import com.example.tshirt_luxury_datn.entity.SanPham;
import com.example.tshirt_luxury_datn.entity.SanPhamChiTiet;
import com.example.tshirt_luxury_datn.response.sanPhamResponse;
import org.springframework.data.domain.Page;
import com.example.tshirt_luxury_datn.response.sanPhamSearchResponse;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface sanPhamRepository extends JpaRepository<SanPham, Integer> {
    @Query(value = "SELECT * FROM san_pham ORDER BY ngay_tao DESC", nativeQuery = true)
    List<SanPham> findAllSanPhamByNgayTaoDesc();

    @Query(value = "SELECT * FROM san_pham WHERE ten_san_pham LIKE  %:keyWord%  AND trang_thai = 1 ", nativeQuery = true)
    List<SanPham> timKiem(@Param("keyWord") String keyWord);

    @Query(value = "SELECT * FROM san_pham WHERE trang_thai = 1 ", nativeQuery = true)
    List<SanPham> SanPham();

    @Query("SELECT new com.example.tshirt_luxury_datn.response.sanPhamResponse(s.id, s.maSanPham, s.tenSanPham, s.ngayTao, " +
            " (SELECT spc.gia FROM SanPhamChiTiet spc WHERE spc.sanPham.id = s.id ORDER BY spc.ngayTao DESC LIMIT 1)) " +
            "FROM SanPham s " +
            "ORDER BY s.ngayTao DESC")
    List<sanPhamResponse> findTop4NewestSanPhamWithGia(Pageable pageable);

    @Query(value = "SELECT * FROM san_pham WHERE barcode = :barCode", nativeQuery = true)
    SanPham findSanPhamByBarcode(@Param("barCode") String barCode);


    @Query(value = "SELECT * FROM san_pham WHERE ten_san_pham LIKE %:keyWord% "
           + " AND (:trangThai IS NULL OR trang_thai = :trangThai)", nativeQuery = true)
    List<SanPham> timKiemSP(@Param("keyWord") String keyWord, @Param("trangThai") Integer trangThai);


    @Query(value = "SELECT TOP 1 ma_san_pham FROM san_pham ORDER BY ma_san_pham DESC", nativeQuery = true)
    String findLastMaSanPham();

    Page<SanPham> findAll(Pageable pageable);

    @Query("SELECT new com.example.tshirt_luxury_datn.response.sanPhamSearchResponse(sp.id, sp.tenSanPham, spct.gia) " +
            "FROM SanPhamChiTiet spct " +
            "JOIN spct.sanPham sp " +
            "WHERE sp.tenSanPham LIKE %:keyWord% " +
            "GROUP BY sp.id, sp.tenSanPham, spct.gia")
    List<sanPhamSearchResponse> sanPhamSearch(@Param("keyWord") String keyWord);

    @Query("SELECT new com.example.tshirt_luxury_datn.response.sanPhamSearchResponse(sp.id, sp.tenSanPham, spct.gia) " +
            "FROM SanPhamChiTiet spct " +
            "JOIN spct.sanPham sp " +
            " " +
            "GROUP BY sp.id, sp.tenSanPham, spct.gia")
    List<sanPhamSearchResponse> getAllXemThem();



    @Query(value = "SELECT TOP 1 ma_san_pham FROM san_pham ORDER BY ma_san_pham DESC", nativeQuery = true)
    String findLastSanPham();

}
