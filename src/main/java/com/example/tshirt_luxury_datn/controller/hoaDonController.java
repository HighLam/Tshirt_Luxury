package com.example.tshirt_luxury_datn.controller;

import com.example.tshirt_luxury_datn.entity.*;
import com.example.tshirt_luxury_datn.repository.*;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class hoaDonController {
    @Autowired
    hoaDonRepository hoaDonRepo;
    @Autowired
    hoaDonChiTietRepository hoaDonChiTietRepo;

    @Autowired
    thongTinDonHangRepository thongTinDonHangRepo;
    @Autowired
    sanPhamChiTietAdminRepository sanPhamChiTietAdminRepo;
    @Autowired
    voucherRepository voucherRepo;

    @GetMapping("/t-shirt-luxury/admin/hoa-don")
    public String hoaDonAdmin(Model model) {
        model.addAttribute("listHoaDonTaiQuay", hoaDonRepo.getHoaDonTaiQuay());
        return "HoaDon/hoa-don-admin";
    }

    @GetMapping("/t-shirt-luxury/admin/hoa-don-online")
    public String hoaDonOnline(Model model) {
        model.addAttribute("listHoaDonOnline", hoaDonRepo.getHoaDonOnline());
        return "HoaDon/hoa-don-online";
    }

    @GetMapping("/t-shirt-luxury/admin/hoa-don-online/detail")
    public String hoaDonOnlineDetail(@RequestParam("idHoaDonOnline") Integer idHoaDon, Model model) {
        List<HoaDonChiTiet> hoaDonChiTiet = hoaDonChiTietRepo.getHoaDonChiTietByIdHoaDon(idHoaDon);
        HoaDon hoaDon = hoaDonRepo.getReferenceById(idHoaDon);
        Integer idVC = hoaDon.getVoucher().getId();
        Float tongGia = hoaDonRepo.tongGiaBanDau(idHoaDon);
        Voucher voucher = voucherRepo.getReferenceById(idVC);
        Integer phanTramGiam = voucher.getGiaTriGiam();
        Float gioiHanGiam =  voucherRepo.gioiHan(idVC);

        Float giaTriGiam = tongGia * phanTramGiam /100;

        if(giaTriGiam>gioiHanGiam){
            model.addAttribute("giaTriGiam",gioiHanGiam );
        }else {
            model.addAttribute("giaTriGiam",giaTriGiam );
        }
        model.addAttribute("voucherTrongHoaDon", hoaDonRepo.getReferenceById(idHoaDon));
        //model.addAttribute("tongTienHoaDon", hoaDonRepo.getReferenceById(idHoaDon));
        model.addAttribute("tongTien", hoaDonRepo.tongTienHoaDonOnline(idHoaDon));


        model.addAttribute("giaTienBanDau", hoaDonRepo.tongGiaBanDau(idHoaDon));

        model.addAttribute("soSanPhamMua", hoaDonRepo.getSoLuongSanPhamMua(idHoaDon));

        model.addAttribute("xacNhanHoaDonOnline", hoaDonRepo.getHoaDonTrangThai1(idHoaDon));

        model.addAttribute("hoaDonChiTietOnline", hoaDonChiTiet);
        System.out.println("fhjskdhfksjhfkjshkjfhksjdhkfjs"+hoaDonChiTiet);
        Integer idThongTinDonHang = hoaDonRepo.getThongTinDonHang(idHoaDon);
        ThongTinNhanHang thongTinNhanHang = thongTinDonHangRepo.getReferenceById(idThongTinDonHang);
        model.addAttribute("thongTinNhanHang", thongTinNhanHang);
        return "HoaDon/xac-nhan-don-hang";

    }

    @PostMapping("/t-shirt-luxury/admin/hoa-don-online/xac-nhan-don")
    public String xacNhanDon(@RequestParam("idHoaDonXacNhan") Integer idHoaDon, HttpSession session) {
        HoaDon hoaDon = hoaDonRepo.getReferenceById(idHoaDon);
        hoaDon.setId(idHoaDon);
        int trangThai = hoaDonRepo.getHoaDonTrangThai1(idHoaDon);

        int trangThaiHienTai = hoaDonRepo.getHoaDonTrangThai(idHoaDon, trangThai);

        if (trangThaiHienTai == 2) {
            hoaDon.setTrangThai(3);
            hoaDon.setNgaySua(new Date());
            hoaDonRepo.save(hoaDon);
        } else if (trangThaiHienTai == 3) {
            hoaDon.setTrangThai(4);
            hoaDon.setNgaySua(new Date());
            hoaDonRepo.save(hoaDon);
        }

        List<SanPhamChiTiet> idSPCT = sanPhamChiTietAdminRepo.findAll();
        List<HoaDonChiTiet> hoaDonChiTietSL = hoaDonChiTietRepo.selectSoLuongHoaDonChiTietOnline(idHoaDon);
        List<Integer> soLuongHDCT = hoaDonChiTietRepo.selectSoLuongOnline(idHoaDon);
        for (int i = 0; i < hoaDonChiTietSL.size(); i++) {
            HoaDonChiTiet hoaDonChiTiet = hoaDonChiTietSL.get(i);
            int soLuongCanTru = soLuongHDCT.get(i); // Lấy số lượng tương ứng từ soLuongHDCT

            // Lọc danh sách SanPhamChiTiet phù hợp với ID từ HoaDonChiTiet
            List<SanPhamChiTiet> sanPhamChiTietList = idSPCT.stream()
                    .filter(sp -> sp.getId().equals(hoaDonChiTiet.getSanPhamChiTiet().getId()))
                    .collect(Collectors.toList());

            // Trừ số lượng cho tất cả các SanPhamChiTiet phù hợp
            for (SanPhamChiTiet sanPhamChiTiet : sanPhamChiTietList) {
                sanPhamChiTiet.setSoLuong(sanPhamChiTiet.getSoLuong() - soLuongCanTru);
                sanPhamChiTiet.setId(sanPhamChiTiet.getId());
                sanPhamChiTietAdminRepo.save(sanPhamChiTiet); // Lưu lại thay đổi
            }
        }


        return "redirect:/t-shirt-luxury/admin/hoa-don-online";
    }
    @GetMapping("/t-shirt-luxury/admin/timHDO")
    public String timHoaDonOn(
            @RequestParam(value = "searchTerm", required = false) String searchTerm,
            @RequestParam(value = "trangThai", required = false) Integer trangThai,
            Model model) {

        List<HoaDon> hoaDonOnlineList;

        if (searchTerm == null && trangThai == null) {
            // Load danh sách mặc định nếu không có bộ lọc
            hoaDonOnlineList = hoaDonRepo.findAll();
        } else {
            // Lọc danh sách hóa đơn theo bộ lọc
            hoaDonOnlineList = hoaDonRepo.timHoaDonOnline(searchTerm, trangThai);
        }

        // Đưa danh sách hóa đơn vào model để hiển thị trên giao diện
        model.addAttribute("listHoaDonOnline", hoaDonOnlineList);

        // Truyền lại giá trị của searchTerm và trangThai để hiển thị lại trong form tìm kiếm
        model.addAttribute("searchTerm", searchTerm);
        model.addAttribute("trangThai", trangThai);

        return "HoaDon/hoa-don-online"; // Trả về tên file JSP
    }

}
