package com.example.tshirt_luxury_datn.repository;

import com.example.tshirt_luxury_datn.entity.ProductDetail;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
@Repository
public  interface ProductDetailRepository extends JpaRepository<ProductDetail, Long> {
    @EntityGraph(attributePaths = { "images" })
    List<ProductDetail> findByProduct_Id(Long productId);

    Optional<ProductDetail> findByProductIdAndSizeIdAndColorId(Long productId, Long sizeId, Long colorId);

    Page<ProductDetail> findByCodeContainingIgnoreCase(String code, Pageable pageable);

    Optional<ProductDetail> findByCode(String code);

    @Query("SELECT pd FROM ProductDetail pd WHERE pd.product.code = :productCode")
    List<ProductDetail> findByProductCode(String productCode);

    List<ProductDetail> findByProductId(Long productId);

    Optional<ProductDetail> findByProductIdAndColorId(Long productId, Long colorId);

    Optional<ProductDetail> findByProductIdAndSizeId(Long productId, Long sizeId);

    List<ProductDetail> findByProductIdAndStatusTrue(Long productId);

    Optional<ProductDetail> findByProductIdAndSizeIdAndColorIdAndStatusTrue(Long productId, Long sizeId, Long colorId);
}
