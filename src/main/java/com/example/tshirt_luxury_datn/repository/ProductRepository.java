package com.example.tshirt_luxury_datn.repository;

import com.example.tshirt_luxury_datn.entity.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
    @Query("SELECT p FROM Product p WHERE " +
            "(:timKiemSanPham IS NULL OR LOWER(p.name) LIKE LOWER(CONCAT('%', :timKiemSanPham, '%'))) AND "
            +
            "(:trangThai IS NULL OR p.status = :trangThai)")
    Page<Product> searchProducts(@Param("timKiemSanPham") String timKiemSanPham,
                                 @Param("trangThai") Boolean trangThai, Pageable pageable);

    List<Product> findTop4ByOrderByCreatedAtDesc();

    List<Product> findByNameContainingIgnoreCase(String name);

    List<Product> findByCategoryDetailId(Long categoryDetailId);

    List<Product> findByCategoryDetail_CategoryId(Long categoryId);


}
