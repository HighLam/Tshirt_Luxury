package com.example.tshirt_luxury_datn.repository;

import com.example.tshirt_luxury_datn.entity.SanPhamChiTiet;
import com.example.tshirt_luxury_datn.response.sanPhamChiTietAdminRespone;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface sanPhamChiTietAdminRepository extends JpaRepository<SanPhamChiTiet,Integer> {
    @Query("""
        SELECT new com.example.tshirt_luxury_datn.response.sanPhamChiTietAdminRespone(
                    spct.sanPham.tenSanPham,
                    spct.anhSanPham.tenAnhSanPham,
                    spct.size.tenSize,
                    spct.chatLieu.tenChatLieu,
                    spct.mauSac.tenMauSac,
                    spct.soLuong,
                    spct.trangThai,
                    spct.khoiLuongSanPham,
                    spct.moTa
                    

            )
        FROM SanPhamChiTiet spct WHERE spct.sanPham.id = :id
    """)
        sanPhamChiTietAdminRespone getSanPhamChiTietByIdSanPham(@Param("id") Integer id);
}
