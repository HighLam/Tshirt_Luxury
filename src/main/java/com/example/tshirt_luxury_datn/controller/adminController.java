package com.example.tshirt_luxury_datn.controller;

import com.example.tshirt_luxury_datn.entity.*;
import com.example.tshirt_luxury_datn.repository.*;
import com.example.tshirt_luxury_datn.response.MauSacReponse;
import com.example.tshirt_luxury_datn.response.SizeReponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.*;
import java.util.stream.Collectors;

@Controller
public class adminController {
    @Autowired
    sanPhamChiTietAdminRepository sanPhamChiTietAdminRepo;

    @Autowired
    hoaDonChiTietRepository hoaDonChiTietRepo;

    @Autowired
    hoaDonRepository hoaDonRepo;

    @Autowired
    sanPhamRepository sanPhamRepo;

    @Autowired
    mauSacRepository mauSacRepo;

    @Autowired
    sizeRepository sizeRepository;

    @Autowired
    voucherRepository voucherRepo;


    public HoaDon createHoaDon(HttpSession session) {
        HoaDon hoaDon = new HoaDon();

        if (hoaDonRepo.getTrangThaiDaThanhToan() == 1) {
            hoaDon.setNgaySua(new Date());
            hoaDon.setNgayTao(new Date());
            hoaDon.setTrangThai(0);
            hoaDonRepo.save(hoaDon);
        }else {

        }
        session.setAttribute("hoaDon", hoaDon);
        session.setAttribute("idHoaDon", hoaDon.getId());
        return hoaDon;
    }


    @GetMapping("t-shirt-luxury/admin")
    public String getSanPhamChiTiet(Model model, HttpSession session) {
        Float tongTien = hoaDonRepo.tongTien((Integer) session.getAttribute("idHoaDon"));
        model.addAttribute("voucher", voucherRepo.listVoucher(tongTien));
        model.addAttribute("SP", sanPhamRepo.findAll());
        model.addAttribute("HDCT", hoaDonChiTietRepo.selectHoaDonChiTiet((Integer) session.getAttribute("idHoaDon")));
        model.addAttribute("soLuongSanPhamMua", hoaDonRepo.soLuongSanPhamMua((Integer) session.getAttribute("idHoaDon")));
        model.addAttribute("tongTien", hoaDonRepo.tongTien((Integer) session.getAttribute("idHoaDon")));
        model.addAttribute("giamHoaDon", hoaDonRepo.giamHoaDon((Integer) session.getAttribute("idHoaDon")));
        return "admin/admin";
    }

    @GetMapping("/t-shirt-luxury/admin/getMauAndSize")
    @ResponseBody
    public Map<String, Object> getProductById(@RequestParam(name = "idRequest") Integer idSanPham) {
        Map<String, Object> response = new HashMap<>();
        SanPham sanPham = sanPhamRepo.getReferenceById(idSanPham);
        // Xử lý dữ liệu dựa trên idTEST (ví dụ: lấy thông tin từ CSDL)
        // Đây chỉ là ví dụ trả về ID sản phẩm, có thể thêm thông tin khác nếu cần
        response.put("id", idSanPham);
        response.put("tenSanPham", sanPham.getTenSanPham());

        //Lấy màu sắc của từng sản phẩm
        List<Integer> listIdMauSac = sanPhamChiTietAdminRepo.getIdMauSac(idSanPham);
        List<MauSacReponse> listMauSacReponse = listIdMauSac.stream()
                .map(idMS -> {
                    MauSac mauSac = mauSacRepo.getReferenceById(idMS);
                    return new MauSacReponse(mauSac.getId(), mauSac.getTenMauSac());
                })
                .collect(Collectors.toList());


        response.put("listMauSac", listMauSacReponse);

        //Lấy size của từng sản phẩm
        List<Integer> listIdSize = sanPhamChiTietAdminRepo.getIdSize(idSanPham);
        List<SizeReponse> listSizeReponse = listIdSize.stream()
                .map(idSize -> {
                    Size size = sizeRepository.getReferenceById(idSize);
                    return new SizeReponse(size.getId(), size.getTenSize());
                })
                .collect(Collectors.toList());
        response.put("listSize", listSizeReponse);

        return response;
    }

    @PostMapping("/t-shirt-luxury/admin/getIdMau")
    public String getidMau(
            @RequestParam(name = "idMau") Integer idMau,
            @RequestParam(name = "idSize") Integer idSize,
            @RequestParam(name = "soLuong") Integer soLuong,
            HttpSession session

    ) {
        if (hoaDonRepo.getTrangThaiDaThanhToan() == 1) {
            createHoaDon(session);
        }


        SanPhamChiTiet sanPhamChiTiet1 = sanPhamChiTietAdminRepo.getSanPhamChiTiet(idMau, idSize);
        HoaDonChiTiet hoaDonChiTiet = new HoaDonChiTiet();
        HoaDon hoaDon1 = (HoaDon) session.getAttribute("hoaDon");
        if (hoaDon1.getTrangThai() == 0) {
            hoaDonChiTiet.setHoaDon(hoaDon1);
        }
        hoaDonChiTiet.setSoLuong(soLuong);
        hoaDonChiTiet.setSanPhamChiTiet(sanPhamChiTiet1);
        hoaDonChiTietRepo.save(hoaDonChiTiet);
        System.out.println(sanPhamChiTiet1);

        return "redirect:/t-shirt-luxury/admin";
    }

    @GetMapping("/t-shirt-luxury/admin/delete-hdct")
    public String deleteHoaDon(@RequestParam("id") Integer id) {
        hoaDonChiTietRepo.deleteById(id);
        return "redirect:/t-shirt-luxury/admin";
    }

    @PostMapping("/t-shirt-luxury/admin/ap-dung-voucher")
    public String apDungVoucher(@RequestParam("idVc") Integer idVc, HttpSession session, Model model) {
        //model.addAttribute("tongTien", hoaDonRepo.tongTien((Integer) session.getAttribute("idHoaDon")));
        int idHoaDon = (Integer) session.getAttribute("idHoaDon");
        model.addAttribute("giamHoaDon", hoaDonRepo.giamHoaDon((Integer) session.getAttribute("idHoaDon")));
        HoaDon hoaDon12 = hoaDonRepo.getReferenceById((Integer) session.getAttribute("idHoaDon"));
        Voucher voucher = voucherRepo.getReferenceById(idVc);
        hoaDon12.setId((Integer) session.getAttribute("idHoaDon"));
        hoaDon12.setTongTien(hoaDonRepo.tongTien(idHoaDon));
        hoaDon12.setVoucher(voucher);
        hoaDonRepo.save(hoaDon12);
        session.setAttribute("hoaDon12", hoaDon12);
        return "redirect:/t-shirt-luxury/admin";
    }

    //    @RequestParam(name = "tongTienHoaDon") Float tongTien,
    @PostMapping("/t-shirt-luxury/admin/thanh-toan")
    public String thanhToanHoaDon(
            HttpSession session) {
        int idHoaDon = (Integer) session.getAttribute("idHoaDon");
        HoaDon hoaDon1 = (HoaDon) session.getAttribute("hoaDon12");
        HoaDon hoaDon = (HoaDon) session.getAttribute("hoaDon");
        hoaDon.setVoucher(hoaDon1.getVoucher());
        hoaDon.setId(idHoaDon);
        hoaDon.setTongTien(hoaDonRepo.tongTien(idHoaDon));
        hoaDon.setTrangThai(1);
        hoaDonRepo.save(hoaDon);
        return "redirect:/t-shirt-luxury/admin";
    }


}
