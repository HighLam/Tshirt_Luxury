package com.example.tshirt_luxury_datn.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface mauSacRepository extends JpaRepository<MauSac, Integer> {

    @Query(value = "SELECT TOP 1 ma_mau_sac FROM mau_sac ORDER BY ma_mau_sac DESC", nativeQuery = true)
    String findLastMaMauSac();
}
