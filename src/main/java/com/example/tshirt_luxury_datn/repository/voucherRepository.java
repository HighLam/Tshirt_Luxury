package com.example.tshirt_luxury_datn.repository;

import com.example.tshirt_luxury_datn.entity.Voucher;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Date;
import java.util.List;

public interface voucherRepository extends JpaRepository<Voucher, Integer> {
    @Query(value = "select * from dbo.voucher vc where vc.muc_chi_toi_thieu <= :tongTien", nativeQuery = true)
    List<Voucher> listVoucher(@Param("tongTien") Float tongTien);

    @Query(value = "select gia_tri_giam from voucher where id = :idVoucher\n", nativeQuery = true)
    Integer getGiaTriGiam(@Param("idVoucher")Integer idVoucher);

    @Query(value = "SELECT * FROM voucher WHERE ten_voucher LIKE %:keyWord% "
            + "AND (:trangThai IS NULL OR trang_thai = :trangThai) "
            + "AND (:ngayBatDau IS NULL OR ngay_bat_dau >= :ngayBatDau) "
            + "AND (:ngayKetThuc IS NULL OR ngay_ket_thuc <= :ngayKetThuc)", nativeQuery = true)
    List<Voucher> timKiemVoucher(
            @Param("keyWord") String keyWord,
            @Param("trangThai") Integer trangThai,
            @Param("ngayBatDau") Date ngayBatDau,
            @Param("ngayKetThuc") Date ngayKetThuc);


}
