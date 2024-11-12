package com.example.tshirt_luxury_datn.repository;

import com.example.tshirt_luxury_datn.entity.HoaDonChiTiet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface hoaDonChiTietRepository extends JpaRepository<HoaDonChiTiet ,Integer> {

    @Query(value = "\n" +
            "select hdct from HoaDonChiTiet hdct \n" +
            "join hdct.hoaDon \n"+
            "where hdct.hoaDon.id = :idHoaDon AND hdct.hoaDon.trangThai = 0")
    List<HoaDonChiTiet> selectHoaDonChiTiet(@Param("idHoaDon") Integer idHoaDon);

    @Query(value = "select hdct from HoaDonChiTiet hdct " +
            "where hdct.hoaDon.id = :idHoaDon AND hdct.sanPhamChiTiet.id = :idSPCT")
    HoaDonChiTiet getHoaDonChiTiet( @Param("idHoaDon") Integer idHoaDon, @Param("idSPCT") Integer idSPCT);

    @Query(value = "select hdct.sanPhamChiTiet.id from HoaDonChiTiet hdct " +
            "where hdct.hoaDon.id = :idHoaDon")
    List<Integer> getSanPhamChiTietDaCo( @Param("idHoaDon") Integer idHoaDon);
}
