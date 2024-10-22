package com.example.tshirt_luxury_datn.entity;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;
import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "hoa_don")
public class HoaDon {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "ma_hoa_don")
    private String maHoaDon;
    @OneToMany
    @JoinColumn(name = "id_hoa_don_chi_tiet")
    private List<HoaDonChiTiet> hoaDonChiTiet;
    @ManyToOne
    @JoinColumn(name = "id_nguoi_dung")
    private NguoiDung nguoiDung;

    @Column(name = "trang_thai")
    private Integer trangThai;

    @Column(name = "ngay_tao")
    private Date ngayTao;

    @Column(name = "ngay_sua")
    private Date ngaySua;

    @Column(name = "mo_ta")
    private String moTa;

    @Column(name = "tong_tien")
    private Double tongTien;
    @ManyToOne
    @JoinColumn(name = "id_thong_tin_nhan_hang")
    private ThongTinNhanHang thongTinNhanHang;
    @OneToOne
    @JoinColumn(name = "id_voucher")
    private Voucher voucher;
}
