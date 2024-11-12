package com.example.tshirt_luxury_datn.repository;

import com.example.tshirt_luxury_datn.entity.HoaDon;
import com.example.tshirt_luxury_datn.entity.HoaDonChiTiet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface hoaDonRepository extends JpaRepository<HoaDon, Integer> {

    @Query(value = "\n" +
            "\n" +
            "select SUM(so_luong) from dbo.hoa_don_chi_tiet hdct \n" +
            "join hoa_don hd on hd.id = hdct.id_hoa_don\n" +
            "            where hd.id = :idHoaDon AND hd.trang_thai = 0", nativeQuery = true)
    Integer soLuongSanPhamMua(@Param("idHoaDon") Integer idHoaDon);


    @Query(value = "\n" +
            "select SUM(spct.gia * hdct.so_luong) from dbo.hoa_don_chi_tiet hdct\n" +
            "join dbo.san_pham_chi_tiet spct on spct.id = hdct.id_san_pham_chi_tiet\n"+
            "join  hoa_don hd on hd.id = hdct.id_hoa_don\n"+
            "where id_hoa_don = :idHoaDon AND hd.trang_thai = 0", nativeQuery = true)
    Float tongTien(@Param("idHoaDon") Integer idHoaDon);

    @Query(value = "\n" +
            "select * from dbo.hoa_don hd \n" +
            " order by hd.ngay_tao desc",nativeQuery = true)
    List<HoaDon> selectHoaDon();



    @Query(value = "select " +

            "(hd.tong_tien - (hd.tong_tien * vc.gia_tri_giam / 100)) \n" +
            "    FROM\n" +
            "    dbo.hoa_don hd\n" +
            "    JOIN\n" +
            "    dbo.voucher vc ON hd.id_voucher = vc.id\n" +
            "            WHERE\n" +
            "    hd.id = :idHD",nativeQuery = true)
    Float giamHoaDon( @Param("idHD")Integer idHD);

    @Query(value = "\n" +
            "SELECT TOP 1 trang_thai\n" +
            "FROM dbo.hoa_don \n" +
            "ORDER BY ngay_tao DESC;\n\n", nativeQuery = true)
    Integer getTrangThaiDaThanhToan();


    @Query(value = "DELETE FROM hoa_don_chi_tiet WHERE id_hoa_don = :idHoaDon", nativeQuery = true)
    Integer huyHoaDon(@Param("idHoaDon") Integer idHoaDon);
}