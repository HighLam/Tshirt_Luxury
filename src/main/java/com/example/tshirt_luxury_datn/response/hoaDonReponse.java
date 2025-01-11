package com.example.tshirt_luxury_datn.response;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class hoaDonReponse {

    private Integer soLuongHoaDon;
    private Double tongDoanhThu;

    public hoaDonReponse(Long soLuongHoaDon, Double tongDoanhThu) {
        this.soLuongHoaDon = soLuongHoaDon.intValue(); // Nếu muốn chuyển Long thành Integer
        this.tongDoanhThu = tongDoanhThu;
    }
}
