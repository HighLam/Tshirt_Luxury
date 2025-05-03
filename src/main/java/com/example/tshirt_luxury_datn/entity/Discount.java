package com.example.tshirt_luxury_datn.entity;

import jakarta.persistence.*;
<<<<<<< HEAD
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
=======
import lombok.*;
>>>>>>> 73bd821021711de7ab3940a2fbe9fc20455ff7fb

import java.sql.Timestamp;
import java.util.List;

<<<<<<< HEAD
=======
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

>>>>>>> 73bd821021711de7ab3940a2fbe9fc20455ff7fb
@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "discounts")
public class Discount {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true)
    private String code;

    @Column(nullable = false)
    private Double percentage;

    @Column(nullable = false)
    private Timestamp startDate;

    @Column(nullable = false)
    private Timestamp endDate;

    @Column(nullable = false)
    private Boolean status;

    @CreationTimestamp
    @Column(nullable = false, updatable = false)
    private Timestamp createdAt;

    @UpdateTimestamp
    @Column(nullable = false)
    private Timestamp updatedAt;

    @OneToMany(mappedBy = "discount")
    private List<Order> orders;
}