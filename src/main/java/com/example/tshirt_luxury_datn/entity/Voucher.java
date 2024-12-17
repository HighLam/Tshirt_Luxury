package com.example.tshirt_luxury_datn.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "voucher")
public class Voucher {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "ma_voucher")
    private String maVoucher;

    @Column(name = "ten_voucher")
    private String tenVoucher;

    @Column(name = "mo_ta")
    private String moTa;

    @Column(name = "gia_tri_giam")
    private Integer giaTriGiam;

    @Temporal(TemporalType.DATE)
    @Column(name = "ngay_bat_dau")
    private Date ngayBatDau;

    @Column(name = "gioi_han")
    private Integer gioiHan;

    @Temporal(TemporalType.DATE)
    @Column(name = "ngay_ket_thuc")
    private Date ngayKetThuc;

    @Column(name = "so_luong")
    private Integer soLuong;

    @Column(name = "trang_thai")
    private String trangThai;

    @Column(name = "dieu_kien_ap_dung")
    private String dieuKienApDung;

    @Column(name = "muc_chi_toi_thieu")
    private Double mucChiToiThieu;

    @Column(name = "ghi_chu")
    private String ghiChu;

}
