package com.example.tshirt_luxury_datn.repository;

import com.example.tshirt_luxury_datn.entity.NguoiDung;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import org.springframework.stereotype.Repository;

@Repository
public interface nguoiDungRepository extends JpaRepository<NguoiDung, Integer> {

    @Query(value ="select * from nguoi_dung where ten_dang_nhap = :tenDangNhap\n" , nativeQuery = true)
    NguoiDung getNguoiDung(@Param("tenDangNhap") String tenDangNhap);


}
