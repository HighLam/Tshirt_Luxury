package com.example.tshirt_luxury_datn.repository;

import com.example.tshirt_luxury_datn.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
@Repository
public interface UserRepository extends JpaRepository<User, Long> {


    Optional<User> findByUsername(String username);

    Optional<User> findByEmail(String email);

    Optional<User> findByUsernameOrEmail(String username, String email);

    List<User> findByUsernameIgnoreCaseContainingOrEmailIgnoreCaseContaining(String username, String email);

}
