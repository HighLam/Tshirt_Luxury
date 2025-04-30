package com.example.tshirt_luxury_datn.controller;

import com.example.tshirt_luxury_datn.repository.hoaDonRepository;
import com.example.tshirt_luxury_datn.response.hoaDonReponse;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import java.util.List;

@Controller
public class thongKeController {

    @Autowired
    hoaDonRepository hoaDonRepo;

    @GetMapping("t-shirt-luxury/admin/thong-ke")
    public String thongKe(Model model) throws ParseException {
        model.addAttribute("hoaDonList", hoaDonRepo.getAllBill());
        model.addAttribute("soLuongHoaDon", hoaDonRepo.getSoLuongHoaDon());
        model.addAttribute("tongDoanhThu", hoaDonRepo.getTongDoanhThu());
        Date ngayBatDau = new SimpleDateFormat("yyyy-MM-dd").parse("2000-01-01");
        Date ngayKetThuc = new Date();
        Integer tongSoLuong = hoaDonRepo.tinhTongSoLuong(ngayBatDau, ngayKetThuc);
        model.addAttribute("tongSoLuong", tongSoLuong != null ? tongSoLuong : 0);
        return "Other/thong-ke";
    }



    @PostMapping("t-shirt-luxury/admin/thong-ke/loc")
    public String locThongKe(
            @RequestParam(value = "ngayBatDau", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date ngayBatDau,
            @RequestParam(value = "ngayKetThuc", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date ngayKetThuc,
            Model model) throws ParseException {

        // Nếu ngày bắt đầu hoặc ngày kết thúc null thì thay thế bằng ngày hiện tại hoặc giá trị mặc định khác
        if (ngayBatDau == null) {
            ngayBatDau = new SimpleDateFormat("yyyy-MM-dd").parse("2000-01-01");
        }

        if (ngayKetThuc == null) {
            ngayKetThuc = new Date();
        }

        hoaDonReponse response = hoaDonRepo.locTheoNgayTao(ngayBatDau, ngayKetThuc);

        if (response != null) {
            model.addAttribute("soLuongHoaDon", response.getSoLuongHoaDon());
            model.addAttribute("tongDoanhThu", response.getTongDoanhThu());
        } else {
            model.addAttribute("soLuongHoaDon", 0);
            model.addAttribute("tongDoanhThu", 0.0);
        }

        // Lấy danh sách hóa đơn
        List<HoaDon> hoaDonList = hoaDonRepo.locHoaDonTheoNgay(ngayBatDau, ngayKetThuc);
        model.addAttribute("hoaDonList", hoaDonList);

        // Gọi repository để tính tổng số lượng từ bảng HoaDonChiTiet
        Integer tongSoLuong = hoaDonRepo.tinhTongSoLuong(ngayBatDau, ngayKetThuc);
        model.addAttribute("tongSoLuong", tongSoLuong != null ? tongSoLuong : 0);

        model.addAttribute("ngayBatDau", ngayBatDau);
        model.addAttribute("ngayKetThuc", ngayKetThuc);

        return "Other/thong-ke";
    }



    @PostMapping("t-shirt-luxury/admin/thong-ke/loc-theo-so-ngay")
    public String locThongKeSoTheoNgay(
            @RequestParam(value = "locTheoSoNgay", required = false) Integer locTheoSoNgay,
            Model model, HttpServletResponse responseCokie) throws ParseException {

        Cookie cookie = new Cookie("locTheoSoNgay", locTheoSoNgay.toString());
        cookie.setMaxAge(60 * 60 * 24); // Cookie tồn tại 1 ngày
        responseCokie.addCookie(cookie);

        // Ngày hiện tại
        Date ngayKetThuc = new Date(); // Lấy ngày hiện tại
        Date ngayBatDau = null;

        // Xử lý lọc theo số ngày
        if (locTheoSoNgay != null) {
            switch (locTheoSoNgay) {
                case 7:
                    // Lọc theo 7 ngày
                    ngayBatDau = tinhNgayTru(7);
                    break;
                case 28:
                    // Lọc theo 28 ngày
                    ngayBatDau = tinhNgayTru(28);
                    break;
                case 365:
                    // Lọc theo 1 năm
                    ngayBatDau = tinhNgayTru(365);
                    break;
                default:
                    // Nếu không chọn thì lấy tất cả, ngày mặc định từ 2000-01-01
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    ngayBatDau = sdf.parse("2000-01-01");
            }
        } else {
            // Trường hợp không chọn gì thì lấy tất cả
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            ngayBatDau = sdf.parse("2000-01-01");
        }

        // Gọi repository để lọc theo ngày
        hoaDonReponse response = hoaDonRepo.locTheoNgayTao(ngayBatDau, ngayKetThuc);

        model.addAttribute("soLuongHoaDon", response.getSoLuongHoaDon());
        model.addAttribute("tongDoanhThu", response.getTongDoanhThu());

        // Lấy danh sách hóa đơn
        List<HoaDon> hoaDonList = hoaDonRepo.locHoaDonTheoNgay(ngayBatDau, ngayKetThuc);
        model.addAttribute("hoaDonList", hoaDonList);

        // Gọi repository để tính tổng số lượng từ bảng HoaDonChiTiet
        Integer tongSoLuong = hoaDonRepo.tinhTongSoLuong(ngayBatDau, ngayKetThuc);
        model.addAttribute("tongSoLuong", tongSoLuong != null ? tongSoLuong : 0);

        return "Other/thong-ke";
    }

    // Hàm tính ngày trừ
    private Date tinhNgayTru(int soNgay) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(new Date()); // Ngày hiện tại
        calendar.add(Calendar.DAY_OF_YEAR, -soNgay); // Trừ đi số ngày
        return calendar.getTime();
    }




}
