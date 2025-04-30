package com.example.tshirt_luxury_datn.repository;

import com.example.tshirt_luxury_datn.entity.ProductImage;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductImageRepository extends JpaRepository<ProductImage, Long> {
    List<ProductImage> findByProductDetailId(Long productDetailId);
    List<ProductImage> findByProductDetail_Product_Id(Long productId);
}
