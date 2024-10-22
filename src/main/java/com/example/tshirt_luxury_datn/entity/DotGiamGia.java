package com.example.tshirt_luxury_datn.entity;

import jakarta.persistence.*;
import lombok.*;

import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "dot_giam_gia")
public class DotGiamGia {
//    id INT PRIMARY KEY IDENTITY(1,1),
//    ma_dot_giam_gia NVARCHAR(255) NULL,
//    ten_dot_giam_gia NVARCHAR(100)  NULL,
//    mo_ta NVARCHAR(255),
//    gia_tri_giam INT NULL,
//    ngay_bat_dau DATE NOT NULL,
//    ngay_ket_thuc DATE NOT NULL,
//    trang_thai NVARCHAR(50),
//    id_danh_muc INT NULL,
//    ghi_chu NVARCHAR(255),
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "ma_dot_giam_gia")
    private String maDotGiamGia;
    @Column(name = "ten_dot_giam_gia")
    private String tenDotGiamGia;
    @Column(name = "mo_ta")
    private String moTa;
    @Column(name = "gia_tri_giam")
    private Integer giaTriGiam;
    @Column(name = "ngay_bat_dau")
    private Date ngayBatDau;
    @Column(name = "ngay_ket_thuc")
    private Date ngayKetThuc;
    @Column(name = "trang_thai")
    private String trangThai;
    @Column(name = "id_danh_muc")
    private Integer idDanhMuc;
    @Column(name = "ghi_chu")
    private String ghiChu;
}
