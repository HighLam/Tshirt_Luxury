package com.example.tshirt_luxury_datn.repository;

import com.example.tshirt_luxury_datn.entity.MauSac;
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

    @Query(value = "\n" +
            "select id_mau_sac from dbo.san_pham_chi_tiet spct\n" +
            "where id_san_pham = :idSanPham group by id_mau_sac", nativeQuery = true)
    List<Integer> getIdMauSac(@Param("idSanPham") Integer idSanPham);

    @Query(value = "\n" +
            "select id_size from dbo.san_pham_chi_tiet spct\n" +
            "where id_san_pham = :idSanPham group by id_size", nativeQuery = true)
    List<Integer> getIdSize(@Param("idSanPham") Integer idSanPham);






}
