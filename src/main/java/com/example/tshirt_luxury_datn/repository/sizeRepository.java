package com.example.tshirt_luxury_datn.repository;

import com.example.tshirt_luxury_datn.entity.Size;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface sizeRepository extends JpaRepository<Size, Integer> {

    @Query(value = "SELECT TOP 1 ma_size FROM size ORDER BY ma_size DESC", nativeQuery = true)
    String findLastMaSize();
}
