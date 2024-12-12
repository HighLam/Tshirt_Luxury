package com.example.tshirt_luxury_datn.repository;

import com.example.tshirt_luxury_datn.entity.NguoiDung;
import com.example.tshirt_luxury_datn.entity.NguoiDungChiTiet;
import com.example.tshirt_luxury_datn.entity.SanPham;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface nguoiDungRepository extends JpaRepository<NguoiDung, Integer> {
//
//    @Query(value = "SELECT ho, ten_dem, ten FROM nguoi_dung_chi_tiet \n" +
//            "JOIN nguoi_dung ON nguoi_dung_chi_tiet.id_nguoi_dung = nguoi_dung.id WHERE so_dien_thoai LIKE  %:keyWord% ", nativeQuery = true)
//    List<NguoiDungChiTiet> searchKhachHang(@Param("keyWord") String keyWord);
}
