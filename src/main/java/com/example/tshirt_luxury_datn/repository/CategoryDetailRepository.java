package com.example.tshirt_luxury_datn.repository;

import com.example.tshirt_luxury_datn.entity.CategoryDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CategoryDetailRepository extends JpaRepository<CategoryDetail, Long> {
    List<CategoryDetail> findByCategoryId(Long categoryId);

    List<CategoryDetail> findByCategoryIdAndStatusTrue(Long categoryId);
}
