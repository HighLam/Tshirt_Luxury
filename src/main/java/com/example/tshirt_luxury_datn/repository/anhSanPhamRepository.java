package com.example.tshirt_luxury_datn.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface anhSanPhamRepository extends JpaRepository<AnhSanPham, Integer> {
    @Query(value = "select id from anh_san_pham where ten_anh_san_pham = :tenAnh",nativeQuery = true)
    Integer getIdAnh(@Param("tenAnh") String tenAnh);

    // Phân trang ảnh
    @Query(value = "select a from AnhSanPham a")
    Page<AnhSanPham> findAllWithPagination(Pageable pageable);
}
