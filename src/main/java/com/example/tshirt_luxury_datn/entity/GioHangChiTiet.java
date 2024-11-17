package com.example.tshirt_luxury_datn.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity
public class GioHangChiTiet {

    @Id
    @Column(name = "id")
    private int id;

    @OneToOne
    @JoinColumn(name = "id_san_pham_chi_tiet")
    private SanPhamChiTiet sanPhamChiTiet;

    @ManyToOne
    @JoinColumn(name = "id_gio_hang")
    private GioHang gioHang;
    @Id
    @Column(name = "trang_thai")
    private int trangThai;

    @Id
    @Column(name = "mo_ta")
    private String moTa;
}
