package com.example.tshirt_luxury_datn.repository;

import com.example.tshirt_luxury_datn.entity.Voucher;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface voucherRepository extends JpaRepository<Voucher, Integer> {
    @Query(value = "select * from dbo.voucher vc where vc.muc_chi_toi_thieu <= :tongTien", nativeQuery = true)
    List<Voucher> listVoucher(@Param("tongTien") Float tongTien);

    @Query(value = "select gia_tri_giam from voucher where id = :idVoucher\n", nativeQuery = true)
    Integer getGiaTriGiam(@Param("idVoucher")Integer idVoucher);


    @Query(value = "SELECT TOP 1 ma_voucher FROM voucher ORDER BY ma_voucher DESC", nativeQuery = true)
    String findLastMaVoucher();




}
