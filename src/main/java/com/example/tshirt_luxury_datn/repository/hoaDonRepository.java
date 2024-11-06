package com.example.tshirt_luxury_datn.repository;

import com.example.tshirt_luxury_datn.entity.HoaDon;
import com.example.tshirt_luxury_datn.entity.HoaDonChiTiet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface hoaDonRepository extends JpaRepository<HoaDon, Integer> {

    @Query(value = "\n" +
            "select SUM(so_luong) from dbo.hoa_don_chi_tiet hdct\n" +
            "where id_hoa_don = :idHoaDon", nativeQuery = true)
    Integer soLuongSanPhamMua(@Param("idHoaDon") Integer idHoaDon);


    @Query(value = "\n" +
            "select SUM(spct.gia * hdct.so_luong) from dbo.hoa_don_chi_tiet hdct\n" +
            "join dbo.san_pham_chi_tiet spct on spct.id = hdct.id_san_pham_chi_tiet\n"+
            "where id_hoa_don = :idHoaDon", nativeQuery = true)
    Float tongTien(@Param("idHoaDon") Integer idHoaDon);

}
