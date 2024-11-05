package com.example.tshirt_luxury_datn.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "gio_hang")
public class GioHang {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @OneToOne
    @JoinColumn(name ="id_nguoi_dung")
    private NguoiDung nguoiDung;


    @Column(name ="so_luong_spct")
    private Integer soLuongSpct;
    @Column(name = "don_gia")
    private Double donGia;

}
