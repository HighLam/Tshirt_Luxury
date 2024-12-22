package com.example.tshirt_luxury_datn.repository;

import com.example.tshirt_luxury_datn.entity.AnhSanPham;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface anhSanPhamRepository extends JpaRepository<AnhSanPham, Integer> {
    @Query(value = "select id from anh_san_pham where ten_anh_san_pham = :tenAnh",nativeQuery = true)
    Integer getIdAnh(@Param("tenAnh") String tenAnh);
}
