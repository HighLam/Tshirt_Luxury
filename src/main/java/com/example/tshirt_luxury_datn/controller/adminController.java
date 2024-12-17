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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

    @Autowired
    nguoiDungRepository nguoiDungRepo;


    public HoaDon createHoaDon(HttpSession session) {
        HoaDon hoaDon = new HoaDon();

        if (hoaDonRepo.getTrangThaiDaThanhToan() !=0) {
            hoaDon.setNgaySua(new Date());
            hoaDon.setNgayTao(new Date());
            hoaDon.setTrangThai(0);
            hoaDon.setLoaiHoaDon(0);
            Voucher voucher = voucherRepo.getReferenceById(1);
            hoaDon.setVoucher(voucher);
            hoaDonRepo.save(hoaDon);
        }
        session.setAttribute("hoaDon", hoaDon);
        session.setAttribute("idHoaDon", hoaDon.getId());
        return hoaDon;
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


    @GetMapping("t-shirt-luxury/admin")
    public String getSanPhamChiTiet(Model model, HttpSession session) {
        List<SanPham> sanPhamList = (List<SanPham>) session.getAttribute("SP");
        if(sanPhamList == null) {
            model.addAttribute("SP", sanPhamRepo.findAll());
        }
        else{
            model.addAttribute("SP", session.getAttribute("SP"));
        }
        Float tongTien = hoaDonRepo.tongTien((Integer) session.getAttribute("idHoaDon"));
        model.addAttribute("voucher", voucherRepo.listVoucher(tongTien));
        model.addAttribute("HDCT", hoaDonChiTietRepo.selectHoaDonChiTiet((Integer) session.getAttribute("idHoaDon")));
        model.addAttribute("soLuongSanPhamMua", hoaDonRepo.soLuongSanPhamMua((Integer) session.getAttribute("idHoaDon")));
        model.addAttribute("tongTien", hoaDonRepo.tongTien((Integer) session.getAttribute("idHoaDon")));
        model.addAttribute("chietKhau", session.getAttribute("giaTriGiamVoucher"));
        model.addAttribute("idVoucher", session.getAttribute("idVoucher"));
        model.addAttribute("noti", session.getAttribute("noti"));
        model.addAttribute("notiVC", session.getAttribute("notiVC"));
        session.setAttribute("listVoucher",voucherRepo.listVoucher(tongTien));
        return "admin/admin";
    }

    @GetMapping("t-shirt-luxury/admin/timSanPham")
    public String timSanPham(Model model, @RequestParam("timKiemSanPham") String timKiemSanPham, HttpSession session) {
//        model.addAttribute("SP", sanPhamRepo.timKiem(timKiemSanPham));
        session.setAttribute("SP",sanPhamRepo.timKiem(timKiemSanPham));
        return "redirect:/t-shirt-luxury/admin";
    }

//    @GetMapping("t-shirt-luxury/admin/timKhachHang")
//    public String searchKhachHang(Model model, @RequestParam("searchSoDienThoai") String timKhachHang) {
//        model.addAttribute("KH", nguoiDungRepo.searchKhachHang(timKhachHang));
//        return "admin/admin";
//    }

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
            HttpSession session,
            RedirectAttributes redirectAttributes
    ) {
        // Khởi tạo thông báo
        String noti = "";
        session.setAttribute("noti", noti);

        // Kiểm tra trạng thái hóa đơn
        if (hoaDonRepo.getTrangThaiDaThanhToan() != 0) {
            createHoaDon(session);
        }

        Integer idSanPham = (Integer) session.getAttribute("idSanPham");
        Integer soLuongSpct = sanPhamChiTietAdminRepo.getSoLuong(idMau, idSize, idSanPham);
        SanPhamChiTiet sanPhamChiTiet1 = sanPhamChiTietAdminRepo.getSanPhamChiTiet(idMau, idSize, idSanPham);

        HoaDon hoaDon1 = (HoaDon) session.getAttribute("hoaDon");

        if (hoaDon1.getTrangThai() == 0) {
            List<Integer> idSPCTDaCo = hoaDonChiTietRepo.getSanPhamChiTietDaCo((Integer) session.getAttribute("idHoaDon"));
            HoaDonChiTiet hoaDonChiTiet1 = hoaDonChiTietRepo.getHoaDonChiTiet((Integer) session.getAttribute("idHoaDon"), sanPhamChiTiet1.getId());

            // Kiểm tra sản phẩm chi tiết đã tồn tại hay chưa
            boolean sanPhamDaTonTai = idSPCTDaCo.contains(sanPhamChiTiet1.getId());
            Integer idHDCT =(Integer) session.getAttribute("idHDCT");
            Integer soLuongHDCT = hoaDonChiTietRepo.findSoLuongHDCTById(idHDCT);
            if (sanPhamDaTonTai) {
                // Nếu sản phẩm đã tồn tại, cập nhật số lượng
                if (hoaDonChiTiet1 != null && soLuong + soLuongHDCT <= soLuongSpct) {
                    hoaDonChiTiet1.setSoLuong(hoaDonChiTiet1.getSoLuong() + soLuong);
                    hoaDonChiTietRepo.save(hoaDonChiTiet1);
                    redirectAttributes.addFlashAttribute("successMessage", "Cập nhật số lượng thành công.");
                } else {
                    redirectAttributes.addFlashAttribute("errorMessage", "Số lượng không được vượt quá " + soLuongSpct);
                }
            }

            else {
                // Nếu sản phẩm chưa tồn tại, thêm mới
                if (soLuong <= soLuongSpct) {
                    HoaDonChiTiet hoaDonChiTiet = new HoaDonChiTiet();
                    hoaDonChiTiet.setHoaDon(hoaDon1);
                    hoaDonChiTiet.setSoLuong(soLuong);
                    hoaDonChiTiet.setSanPhamChiTiet(sanPhamChiTiet1);
                    hoaDonChiTietRepo.save(hoaDonChiTiet);
                    session.setAttribute("hoaDonChiTiet", hoaDonChiTiet);
                    session.setAttribute("idHDCT", hoaDonChiTiet.getId());
                    String notiVC = "";
                    session.setAttribute("notiVC", notiVC);
                    redirectAttributes.addFlashAttribute("successMessage", "Thêm mới thành công.");
                } else {
                    redirectAttributes.addFlashAttribute("errorMessage", "Số lượng không được vượt quá " + soLuongSpct);
                }
            }
        }

        return "redirect:/t-shirt-luxury/admin";
    }


    @GetMapping("/t-shirt-luxury/admin/delete-hdct")
    public String deleteHoaDon(@RequestParam("id") Integer id, HttpSession session ) {
        hoaDonChiTietRepo.deleteById(id);
        HoaDon hoaDon = (HoaDon) session.getAttribute("hoaDon");
        Voucher voucher = voucherRepo.getReferenceById(1);
        hoaDon.setVoucher(voucher);
        hoaDon.setId(hoaDon.getId());
        hoaDonRepo.save(hoaDon);
        session.setAttribute("giaTriGiamVoucher", "");
        return "redirect:/t-shirt-luxury/admin";
    }

    @PostMapping("/t-shirt-luxury/admin/ap-dung-voucher")
    public String apDungVoucher(@RequestParam(value = "idVc",defaultValue = "") Integer idVc, HttpSession session, Model model) {

        if (idVc==null){
            String notiVC = "Chưa có voucher";
            session.setAttribute("notiVC", notiVC);
        }else {
            model.addAttribute("giamHoaDon", hoaDonRepo.giamHoaDon((Integer) session.getAttribute("idHoaDon")));
            HoaDon hoaDon12 = hoaDonRepo.getReferenceById((Integer) session.getAttribute("idHoaDon"));
            Voucher voucher = voucherRepo.getReferenceById(idVc);
            hoaDon12.setId((Integer) session.getAttribute("idHoaDon"));

            hoaDon12.setVoucher(voucher);
            hoaDonRepo.save(hoaDon12);

            session.setAttribute("hoaDon12", hoaDon12);
            Float tongTien = hoaDonRepo.tongTien((Integer) session.getAttribute("idHoaDon"));
            Integer giaTriGiam = voucherRepo.getGiaTriGiam(idVc);
            Float trietKhau = tongTien * giaTriGiam / 100;
            Float gioiHan = voucherRepo.gioiHan(idVc);
            Float tienGiam = trietKhau;
            boolean checkGioiHan = trietKhau > gioiHan;
            if (checkGioiHan) {
                tienGiam = gioiHan;
            }
            session.setAttribute("idVoucher", idVc);
            session.setAttribute("giaTriGiamVoucher", tienGiam);
            String notiVC = "";
            session.setAttribute("notiVC", notiVC);
        }
        return "redirect:/t-shirt-luxury/admin";
    }


    @PostMapping("/t-shirt-luxury/admin/thanh-toan")
    public String thanhToanHoaDon(
            HttpSession session, Model model) {
            Integer idHoaDon = (Integer) session.getAttribute("idHoaDon");

        if (hoaDonRepo.getTrangThaiDaThanhToan() == 1 || hoaDonChiTietRepo.selectHoaDonChiTiet((Integer) session.getAttribute("idHoaDon")).isEmpty()) {
            String noti = "Vui lòng chọn sản phẩm";
            session.setAttribute("noti", noti);
        } else {



            HoaDon hoaDon1 = (HoaDon) session.getAttribute("hoaDon12");
            HoaDon hoaDon = (HoaDon) session.getAttribute("hoaDon");

            List<SanPhamChiTiet> idSPCT = sanPhamChiTietAdminRepo.findAll();
            List<HoaDonChiTiet> hoaDonChiTietSL = hoaDonChiTietRepo.selectSoLuongHoaDonChiTiet(idHoaDon);
            List<Integer> soLuongHDCT = hoaDonChiTietRepo.selectSoLuong(idHoaDon);
            Voucher voucherKhongGiam = voucherRepo.getReferenceById(1);

            if (hoaDon1 == null) {
                hoaDon.setVoucher(voucherKhongGiam);
            } else {
                hoaDon.setVoucher(hoaDon1.getVoucher());
            }


            for (int i = 0; i < hoaDonChiTietSL.size(); i++) {
                HoaDonChiTiet hoaDonChiTiet = hoaDonChiTietSL.get(i);
                for (SanPhamChiTiet sanPhamChiTiet : idSPCT) {
                    if (sanPhamChiTiet.getId().equals(hoaDonChiTiet.getSanPhamChiTiet().getId())) {
                        // Trừ số lượng tương ứng theo chỉ số của hoaDonChiTietSL
                        int soLuongCanTru = soLuongHDCT.get(i); // Lấy số lượng tương ứng từ soLuongHDCT
                        sanPhamChiTiet.setSoLuong(sanPhamChiTiet.getSoLuong() - soLuongCanTru);
                        sanPhamChiTietAdminRepo.save(sanPhamChiTiet);
                        break; // Thoát vòng lặp nếu đã tìm thấy sản phẩm cần cập nhật
                    }
                }
            }


            hoaDon.setId(idHoaDon);
            hoaDon.setMaHoaDon(generateMaHoaDon());
            Float voucherGiam = (Float) session.getAttribute("giaTriGiamVoucher");
            hoaDon.setTongTien(hoaDonRepo.tongTien(idHoaDon)-voucherGiam);

            hoaDon.setTrangThai(1);
            NguoiDung nguoiDung = new NguoiDung();
            nguoiDung.setTenNguoiDung("Khach vang lai");
            nguoiDungRepo.save(nguoiDung);

            hoaDon.setNguoiDung(nguoiDung);
            hoaDonRepo.save(hoaDon);
            Integer idVc = hoaDon.getVoucher().getId();
            Voucher voucher = voucherRepo.getReferenceById(idVc);
            voucher.setSoLuong(voucher.getSoLuong()-1);
            voucherRepo.save(voucher);
            session.setAttribute("giaTriGiamVoucher", "");
        }

        return "redirect:/t-shirt-luxury/admin";
    }


    @GetMapping("/t-shirt-luxury/admin/huy-hoa-don")
    public String huyHoaDon(@RequestParam(value = "idHoaDon", defaultValue = "") Integer idHoaDon, HttpSession session, Model model) {
        if (hoaDonRepo.getTrangThaiDaThanhToan() == 1 || idHoaDon.equals("")) {
            String noti = "Không Có Hóa Đơn Để Hủy";
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
