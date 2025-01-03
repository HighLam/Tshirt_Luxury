package com.example.tshirt_luxury_datn.repository;

import com.example.tshirt_luxury_datn.entity.ChatLieu;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface chatLieuRepository extends JpaRepository<ChatLieu, Integer> {

    @Query(value = "SELECT TOP 1 ma_chat_lieu FROM chat_lieu ORDER BY ma_chat_lieu DESC", nativeQuery = true)
    String findLastMaChatLieu();
}
