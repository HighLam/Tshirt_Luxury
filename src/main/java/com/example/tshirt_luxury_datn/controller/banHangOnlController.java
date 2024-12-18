package com.example.tshirt_luxury_datn.controller;

import com.example.tshirt_luxury_datn.entity.*;
import com.example.tshirt_luxury_datn.repository.*;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Date;
import java.util.List;

@Controller
public class banHangOnlController {
    @Autowired
    thongTinDonHangRepository thongTinDonHangRepo;
    @Autowired
    gioHangChiTietRepository gioHangChiTietRepo;
    @Autowired
    voucherRepository voucherRepo;
    @Autowired
    gioHangRepository gioHangRepo;
    @Autowired
    hoaDonRepository hoaDonRepo;
    @Autowired
    sanPhamChiTietRepository sanPhamChiTietRepo;
    @Autowired
    hoaDonChiTietRepository hoaDonChiTietRepo;

    boolean checkTTNH(ThongTinNhanHang thongTinNhanHang, RedirectAttributes redirectAttributes) {
        if (thongTinNhanHang.getHoVaTen().isEmpty() || thongTinNhanHang.getHoVaTen() == null) {
            String validHoTen = "Họ và tên không được để trống";
            redirectAttributes.addFlashAttribute("errorName", validHoTen);
            return false;
        } else {
            redirectAttributes.addFlashAttribute("hoVaTen", thongTinNhanHang.getHoVaTen());
        }
        if (thongTinNhanHang.getSoDienThoai().isEmpty() || thongTinNhanHang.getSoDienThoai() == null) {
            String validSDT = "Số điện thoại không được để trống";
            redirectAttributes.addFlashAttribute("errorNumber", validSDT);
            return false;
        } else {
            redirectAttributes.addFlashAttribute("soDienThoai", thongTinNhanHang.getSoDienThoai());
        }
        if (thongTinNhanHang.getDiaChiNhanHang().isEmpty() || thongTinNhanHang.getDiaChiNhanHang() == null) {
            String valiAddess = "Địa chỉ không được để trống";
            redirectAttributes.addFlashAttribute("errorAddess", valiAddess);
            return false;
        } else {
            redirectAttributes.addFlashAttribute("diaChiNhanHang", thongTinNhanHang.getDiaChiNhanHang());
        }

        return true;

    }

    public String generateMaHoaDon() {
        // Lấy mã hóa đơn lớn nhất từ cơ sở dữ liệu
        String lastMaHoaDon = hoaDonRepo.findLastMaHoaDon(); // Giả sử phương thức này trả về "HD005"

        int nextNumber = 1; // Số bắt đầu nếu không có hóa đơn nào
        if (lastMaHoaDon != null && lastMaHoaDon.startsWith("HD")) {
            // Lấy phần số từ mã hóa đơn cuối cùng
            String numberPart = lastMaHoaDon.substring(2); // Bỏ "HD"
            nextNumber = Integer.parseInt(numberPart) + 1;
        }

        // Format mã hóa đơn mới với 3 chữ số (HD001, HD002, ...)
        return String.format("HD%03d", nextNumber);
    }

    @GetMapping("/t-shirt-luxury/ban-hang-onl")
    public String banHangOnl(Model model, HttpSession session) {
        Integer idGioHang = (Integer) session.getAttribute("idGioHang");
        List<GioHangChiTiet> gioHangChiTiets = gioHangChiTietRepo.gioHangChiTietByID(idGioHang);
        Float tongGia = gioHangChiTietRepo.tinhTongGia(idGioHang);
        model.addAttribute("voucher", voucherRepo.listVoucher(tongGia));
        model.addAttribute("tongTienGioHang", gioHangChiTietRepo.tinhTongGia(idGioHang));
        model.addAttribute("banHang", gioHangChiTiets);
        model.addAttribute("giaTriGiam", session.getAttribute("giaTriGiam"));

        return "BanHang/ban-hang-onl";
    }

    @GetMapping("/t-shirt-luxury/ban-hang-onl/getVoucher")
    public String getVoucher(@RequestParam("idVoucher") Integer idVC, HttpSession session) {
        Integer idGioHang = (Integer) session.getAttribute("idGioHang");
        Integer giaTriGiam = voucherRepo.getGiaTriGiam(idVC);
        Float tongTien =  gioHangChiTietRepo.tinhTongGia(idGioHang);
        Float giamGia = tongTien * giaTriGiam / 100;
        Voucher voucher = voucherRepo.getReferenceById(idVC);
        if(voucher.getGioiHan()<=giamGia){
            session.setAttribute("giaTriGiam", voucher.getGioiHan());
            voucher.setSoLuong(voucher.getSoLuong()-1);
            voucherRepo.save(voucher);
            session.setAttribute("voucher", voucher);
        }else {
            session.setAttribute("giaTriGiam", giamGia);
            voucher.setSoLuong(voucher.getSoLuong()-1);
            voucherRepo.save(voucher);
            session.setAttribute("voucher", voucher);
        }
        return "redirect:/t-shirt-luxury/ban-hang-onl";
    }


    @GetMapping("/t-shirt-luxury/ban-hang-onl/plus")
    public String plusSLGHCTBanHang(@RequestParam("id") Integer id, HttpSession session) {
        GioHangChiTiet gioHangChiTiet = gioHangChiTietRepo.getReferenceById(id);

        gioHangChiTiet.setId(id);
        gioHangChiTiet.setSoLuong(gioHangChiTiet.getSoLuong() + 1);
        gioHangChiTietRepo.save(gioHangChiTiet);


        return "redirect:/t-shirt-luxury/ban-hang-onl";
    }

    @GetMapping("/t-shirt-luxury/ban-hang-onl/subtract")
    public String subtractSLGHCTBanHang(@RequestParam("id") Integer id) {
        GioHangChiTiet gioHangChiTiet = gioHangChiTietRepo.getReferenceById(id);
        if (gioHangChiTiet.getSoLuong() > 1) {
            gioHangChiTiet.setId(id);
            gioHangChiTiet.setSoLuong(gioHangChiTiet.getSoLuong() - 1);
            gioHangChiTietRepo.save(gioHangChiTiet);
        } else {
            gioHangChiTiet.setId(id);
            gioHangChiTiet.setSoLuong(gioHangChiTiet.getSoLuong());
            gioHangChiTietRepo.save(gioHangChiTiet);
        }
        return "redirect:/t-shirt-luxury/ban-hang-onl";
    }

    @PostMapping("/t-shirt-luxury/ban-hang-onl/createHD")
    public String createHD(HttpSession session, ThongTinNhanHang thongTinNhanHang,
                           RedirectAttributes redirectAttributes
    ) {

        if (checkTTNH(thongTinNhanHang, redirectAttributes)) {
            thongTinDonHangRepo.save(thongTinNhanHang);
            Voucher voucher = voucherRepo.getReferenceById(1);
            HoaDon hoaDon = new HoaDon();
            hoaDon.setNgaySua(new Date());
            hoaDon.setNgayTao(new Date());
            hoaDon.setTrangThai(0);
            hoaDon.setLoaiHoaDon(1);
            hoaDon.setVoucher(voucher);
            hoaDon.setThongTinNhanHang(thongTinNhanHang);
            hoaDonRepo.save(hoaDon);

            session.setAttribute("hoaDonOnl", hoaDon);
            session.setAttribute("idHoaDonOnline", hoaDon.getId());

        }


        return "redirect:/t-shirt-luxury/ban-hang-onl";
    }


    @PostMapping("/t-shirt-luxury/ban-hang-onl/doneHD")
    public String addSPCT(@RequestParam("tongTienHoaDonOnl") String tongTien , HttpSession session){

        // Xóa dấu phẩy nếu có
        tongTien = tongTien.replace(".", "");
        // Chuyển đổi sang Float
        float tongTienParsed = Float.parseFloat(tongTien);


        HoaDonChiTiet hoaDonChiTiet = new HoaDonChiTiet();
        HoaDon hoaDon = (HoaDon) session.getAttribute("hoaDonOnl");
        if (hoaDon == null || hoaDon.getThongTinNhanHang() == null || hoaDon.getThongTinNhanHang().getId() == null) {
            String TTGHNull = "Chưa có thông tin giao hàng";
            session.setAttribute("TTGHNull", TTGHNull);
            return "redirect:/t-shirt-luxury/ban-hang-onl";
        }
        else {

            hoaDon.setMaHoaDon(generateMaHoaDon());
            hoaDon.setVoucher((Voucher) session.getAttribute("voucher"));
            hoaDon.setTongTien(tongTienParsed);
            hoaDon.setTrangThai(2);
            hoaDonRepo.save(hoaDon);
            Integer idGioHang = (Integer) session.getAttribute("idGioHang");
            GioHang gioHang = gioHangRepo.getReferenceById(idGioHang);
            gioHang.setNgaySua(new Date());
            gioHang.setNgayTao(new Date());
            gioHang.setTrangThai(1);
            gioHangRepo.save(gioHang);


            List<GioHangChiTiet> gioHangChiTiets = gioHangChiTietRepo.gioHangChiTietByID(idGioHang);
            List<Integer> listIDSPCT = gioHangChiTietRepo.findIdSanPhamChiTietByIdGioHang(idGioHang);

            for (Integer idSPCT : listIDSPCT) {
                SanPhamChiTiet sanPhamChiTiet = sanPhamChiTietRepo.getReferenceById(idSPCT);

                HoaDonChiTiet hoaDonChiTietOnl = new HoaDonChiTiet();
                hoaDonChiTietOnl.setHoaDon(hoaDon);
                hoaDonChiTietOnl.setNgayTao(new Date());
                hoaDonChiTietOnl.setNgaySua(new Date());
                hoaDonChiTietOnl.setTrangThai(1);
                hoaDonChiTietOnl.setSanPhamChiTiet(sanPhamChiTiet);

                for (GioHangChiTiet gioHangChiTiet : gioHangChiTiets) {
                    hoaDonChiTietOnl.setSoLuong(gioHangChiTiet.getSoLuong());
                }

                hoaDonChiTietRepo.save(hoaDonChiTietOnl);

            }


            session.setAttribute("giaTriGiam", 0);

            gioHangChiTietRepo.deleteByIdGioHang(idGioHang);
        }
        return "redirect:/t-shirt-luxury/trang-chu";
    }


    @PostMapping("/t-shirt-luxury/ban-hang-onl/update-quantity")
    @ResponseBody // Trả về JSON khi được gọi bằng AJAX
    public ResponseEntity<String> updateQuantity(@RequestParam("idGioHangChiTiet") Integer idGioHangChiTiet,
                                                 @RequestParam("soLuong") Integer soLuong) {
        try {
            GioHangChiTiet gioHangChiTiet = gioHangChiTietRepo.findById(idGioHangChiTiet)
                    .orElseThrow(() -> new IllegalArgumentException("Chi tiết giỏ hàng không tồn tại"));

            gioHangChiTiet.setSoLuong(soLuong);
            gioHangChiTietRepo.save(gioHangChiTiet);
            System.out.println(idGioHangChiTiet);

            return ResponseEntity.ok("Cập nhật thành công!");
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("Cập nhật thất bại!"+idGioHangChiTiet);

        }
    }


}
