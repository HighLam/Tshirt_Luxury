package com.example.tshirt_luxury_datn.entity;

import jakarta.persistence.*;
import lombok.*;

import java.util.ArrayList;
import java.util.List;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Table(name = "users")
public class User {
<<<<<<< HEAD
=======

>>>>>>> ab554ba1bd4150e4eedff920d98c81474fcf9d0a
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String username;

    @Column(nullable = false)
    private String password;

    @Column(nullable = false)
    private String email;

    @Column(nullable = false)
    private String role; // USER, ADMIN

    @Column(nullable = false, columnDefinition = "BIT DEFAULT 1")
    private Boolean status = true;

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<UserProfile> profiles = new ArrayList<>();
<<<<<<< HEAD
=======


>>>>>>> ab554ba1bd4150e4eedff920d98c81474fcf9d0a
}
