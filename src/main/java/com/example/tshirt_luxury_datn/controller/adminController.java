package com.example.tshirt_luxury_datn.controller;

import com.example.tshirt_luxury_datn.entity.*;
import com.example.tshirt_luxury_datn.repository.*;
import com.example.tshirt_luxury_datn.response.MauSacReponse;
import com.example.tshirt_luxury_datn.response.SizeReponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
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
            Voucher voucher = voucherRepo.getReferenceById(1);
            hoaDon.setVoucher(voucher);
            hoaDonRepo.save(hoaDon);
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
        model.addAttribute("chietKhau", session.getAttribute("giaTriGiamVoucher"));
        model.addAttribute("idVoucher", session.getAttribute("idVoucher"));
        model.addAttribute("noti", session.getAttribute("noti"));
        return "admin/admin";
    }

    @GetMapping("t-shirt-luxury/admin/timSanPham")
    public String timSanPham(Model model, @RequestParam("timKiemSanPham") String timKiemSanPham) {
        model.addAttribute("SP", sanPhamRepo.timKiem(timKiemSanPham));
        return "admin/admin";
    }

    @GetMapping("/t-shirt-luxury/admin/getMauAndSize")
    @ResponseBody
    public Map<String, Object> getProductById(@RequestParam(name = "idRequest") Integer idSanPham, HttpSession session) {
        Map<String, Object> response = new HashMap<>();
        SanPham sanPham = sanPhamRepo.getReferenceById(idSanPham);
        // Xử lý dữ liệu dựa trên idTEST (ví dụ: lấy thông tin từ CSDL)
        // Đây chỉ là ví dụ trả về ID sản phẩm, có thể thêm thông tin khác nếu cần
        response.put("id", idSanPham);
        response.put("tenSanPham", sanPham.getTenSanPham());

        session.setAttribute("idSanPham", sanPham.getId());

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
        String noti = "";
        session.setAttribute("noti", noti);
        if (hoaDonRepo.getTrangThaiDaThanhToan() == 1) {
            createHoaDon(session);
        }

        Integer idSanPham = (Integer) session.getAttribute("idSanPham");
        SanPhamChiTiet sanPhamChiTiet1 = sanPhamChiTietAdminRepo.getSanPhamChiTiet(idMau, idSize, idSanPham);


        HoaDon hoaDon1 = (HoaDon) session.getAttribute("hoaDon");

        if (hoaDon1.getTrangThai() == 0) {
            List<Integer> idSPCTDaCo = hoaDonChiTietRepo.getSanPhamChiTietDaCo((Integer) session.getAttribute("idHoaDon"));
            HoaDonChiTiet hoaDonChiTiet1 = hoaDonChiTietRepo.getHoaDonChiTiet((Integer) session.getAttribute("idHoaDon"), sanPhamChiTiet1.getId());
            boolean check = false;
            for (Integer x : idSPCTDaCo) {
                if (sanPhamChiTiet1.getId().equals(x)) {
                    check = true;
                    break;
                }
            }
            if (check) {
                hoaDonChiTiet1.setSoLuong(hoaDonChiTiet1.getSoLuong() + soLuong);
                hoaDonChiTietRepo.save(hoaDonChiTiet1);
            } else {

                HoaDonChiTiet hoaDonChiTiet = new HoaDonChiTiet();
                hoaDonChiTiet.setHoaDon(hoaDon1);
                hoaDonChiTiet.setSoLuong(soLuong);
                hoaDonChiTiet.setSanPhamChiTiet(sanPhamChiTiet1);
                hoaDonChiTietRepo.save(hoaDonChiTiet);
            }
        }

        return "redirect:/t-shirt-luxury/admin";
    }

    @GetMapping("/t-shirt-luxury/admin/delete-hdct")
    public String deleteHoaDon(@RequestParam("id") Integer id, HttpSession session) {
        hoaDonChiTietRepo.deleteById(id);
        HoaDon hoaDon = (HoaDon) session.getAttribute("hoaDon");
        Voucher voucher = voucherRepo.getReferenceById(4);
        hoaDon.setVoucher(voucher);
        hoaDon.setId(hoaDon.getId());
        hoaDonRepo.save(hoaDon);
        return "redirect:/t-shirt-luxury/admin";
    }

    @PostMapping("/t-shirt-luxury/admin/ap-dung-voucher")
    public String apDungVoucher(@RequestParam("idVc") Integer idVc, HttpSession session, Model model) {
        model.addAttribute("giamHoaDon", hoaDonRepo.giamHoaDon((Integer) session.getAttribute("idHoaDon")));
        HoaDon hoaDon12 = hoaDonRepo.getReferenceById((Integer) session.getAttribute("idHoaDon"));
        Voucher voucher = voucherRepo.getReferenceById(idVc);
        hoaDon12.setId((Integer) session.getAttribute("idHoaDon"));
        hoaDon12.setVoucher(voucher);
        hoaDonRepo.save(hoaDon12);
        session.setAttribute("hoaDon12", hoaDon12);
        Integer giaTriGiam = voucherRepo.getGiaTriGiam(idVc);
        session.setAttribute("idVoucher", idVc);
        session.setAttribute("giaTriGiamVoucher", giaTriGiam);

        return "redirect:/t-shirt-luxury/admin";
    }


    @PostMapping("/t-shirt-luxury/admin/thanh-toan")
    public String thanhToanHoaDon(
            HttpSession session, Model model) {

        if (hoaDonRepo.getTrangThaiDaThanhToan() == 1 || hoaDonChiTietRepo.selectHoaDonChiTiet((Integer) session.getAttribute("idHoaDon")).isEmpty()) {
            String noti = "Vui lòng chọn sản phẩm";
            session.setAttribute("noti", noti);
        } else {


            int idHoaDon = (Integer) session.getAttribute("idHoaDon");
            HoaDon hoaDon1 = (HoaDon) session.getAttribute("hoaDon12");
            HoaDon hoaDon = (HoaDon) session.getAttribute("hoaDon");
            List<SanPhamChiTiet> idSPCT = sanPhamChiTietAdminRepo.findAll();
            List<HoaDonChiTiet> hoaDonChiTietSL = hoaDonChiTietRepo.selectSoLuongHoaDonChiTiet(idHoaDon);
            Integer soLuongHDCT = hoaDonChiTietRepo.selectSoLuong(idHoaDon);
            Voucher voucherKhongGiam = voucherRepo.getReferenceById(1);

            if (hoaDon1 == null) {
                hoaDon.setVoucher(voucherKhongGiam);
            } else {
                hoaDon.setVoucher(hoaDon1.getVoucher());
            }


            for (HoaDonChiTiet hoaDonChiTiet : hoaDonChiTietSL) {
                for (SanPhamChiTiet sanPhamChiTiet : idSPCT) {
                    if (sanPhamChiTiet.getId().equals(hoaDonChiTiet.getSanPhamChiTiet().getId())) {
                        sanPhamChiTiet.setSoLuong(sanPhamChiTiet.getSoLuong() - soLuongHDCT);
                        sanPhamChiTietAdminRepo.save(sanPhamChiTiet);
                    }
                }

            }

            hoaDon.setId(idHoaDon);
            hoaDon.setTongTien(hoaDonRepo.tongTien(idHoaDon));
            hoaDon.setTrangThai(1);
            hoaDonRepo.save(hoaDon);
        }

        return "redirect:/t-shirt-luxury/admin";
    }


    @GetMapping("/t-shirt-luxury/admin/huy-hoa-don")
    public String huyHoaDon(@RequestParam(value = "idHoaDon", defaultValue = "") Integer idHoaDon, HttpSession session, Model model) {
        if (hoaDonRepo.getTrangThaiDaThanhToan() == 1 || idHoaDon.equals("")) {
            String noti = "Không Có Hóa Dơn Để Hủy";
            session.setAttribute("noti", noti);
        } else {

            hoaDonRepo.deleteById((Integer) session.getAttribute("idHoaDon"));
            System.out.println("ID Hóa Đơn: " + idHoaDon);
        }
        return "redirect:/t-shirt-luxury/admin";


    }

    // Quét Barcode
    @GetMapping("/scan-barcode")
    public String handleBarcodeScan(@RequestParam("barcode") String barcode, Model model) {
        // In mã vạch ra console
        System.out.println("Barcode received: " + barcode);
        SanPham sanPham = sanPhamRepo.findSanPhamByBarcode(barcode);
            List<SanPham> sanPhamList = new ArrayList<>();
            sanPhamList.add(sanPham);
            model.addAttribute("SP", sanPhamList);
        return "admin/barcode-result";
    }

}
