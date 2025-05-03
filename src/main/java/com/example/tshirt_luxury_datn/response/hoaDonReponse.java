package com.example.tshirt_luxury_datn.response;
import com.example.tshirt_luxury_datn.entity.ThongTinNhanHang;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class hoaDonReponse {
    private Integer id;
    private String maHoaDon;
    private Integer thongTinId;
    private String hoVaTen;
    private String diaChiNhanHang;
    private ThongTinNhanHang thongTinNhanHang;
    private Integer trangThai;
    private Integer soLuongHoaDon;
    private Double tongDoanhThu;

    public hoaDonReponse(Long soLuongHoaDon, Double tongDoanhThu) {
        this.soLuongHoaDon = soLuongHoaDon.intValue(); // Nếu muốn chuyển Long thành Integer
        this.tongDoanhThu = tongDoanhThu;
    }
    public hoaDonReponse(Integer id, String maHoaDon, Integer thongTinId, String hoVaTen, String diaChiNhanHang, Integer trangThai) {
        this.id = id;
        this.maHoaDon = maHoaDon;
        this.thongTinId = thongTinId;
        this.hoVaTen = hoVaTen;
        this.diaChiNhanHang = diaChiNhanHang;
        this.trangThai = trangThai;
    }
}
