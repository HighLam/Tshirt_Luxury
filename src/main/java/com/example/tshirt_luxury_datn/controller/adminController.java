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

    @Autowired
    nguoiDungChiTietRepository nguoiDungChiTietRepo;


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

    public String generateMaNguoiDung() {
        // Lấy mã hóa đơn lớn nhất từ cơ sở dữ liệu
        String lastMaNguoiDung = nguoiDungRepo.findLastMaNguoiDung(); // Giả sử phương thức này trả về "HD005"

        int nextNumber = 1; // Số bắt đầu nếu không có hóa đơn nào
        if (lastMaNguoiDung != null && lastMaNguoiDung.startsWith("ND")) {
            // Lấy phần số từ mã hóa đơn cuối cùng
            String numberPart = lastMaNguoiDung.substring(2); // Bỏ "HD"
            nextNumber = Integer.parseInt(numberPart) + 1;
        }

        // Format mã hóa đơn mới với 3 chữ số (HD001, HD002, ...)
        return String.format("ND%03d", nextNumber);
    }

    private NguoiDung createNguoiDungForGuest() {
        NguoiDung nguoiDung = new NguoiDung();
        nguoiDung.setMaNguoiDung(generateMaNguoiDung());
        nguoiDung.setNgaySua(new Date());
        nguoiDung.setNgayTao(new Date());
        nguoiDung.setEmail("N/A");

        ChucVu chucVu = new ChucVu();
        chucVu.setId(3); // ID vai trò cho khách vãng lai
        nguoiDung.setChucVu(chucVu);

        nguoiDung.setTrangThai(1);
        nguoiDung.setMoTa("Khách chưa cung cấp thông tin");
        nguoiDung.setTenNguoiDung("Khách vãng lai");
        return nguoiDung;
    }

    private NguoiDung createNguoiDung(String hoVaTenKhachHang) {
        NguoiDung nguoiDung = new NguoiDung();
        nguoiDung.setMaNguoiDung(generateMaNguoiDung());
        nguoiDung.setNgaySua(new Date());
        nguoiDung.setNgayTao(new Date());
        nguoiDung.setEmail("N/A");

        ChucVu chucVu = new ChucVu();
        chucVu.setId(3); // ID vai trò mặc định
        nguoiDung.setChucVu(chucVu);

        nguoiDung.setTrangThai(1);
        nguoiDung.setTenNguoiDung(hoVaTenKhachHang);
        return nguoiDung;
    }


    private NguoiDungChiTiet createNguoiDungChiTiet(NguoiDung nguoiDung, String hoVaTenKhachHang, String soDienThoai) {
        NguoiDungChiTiet nguoiDungChiTiet = new NguoiDungChiTiet();

        // Tách họ, tên đệm và tên từ hoVaTenKhachHang
        String[] nameParts = hoVaTenKhachHang.trim().split("\\s+");
        String ho = nameParts[0];
        String ten = nameParts[nameParts.length - 1];
        String tenDem = String.join(" ", Arrays.copyOfRange(nameParts, 1, nameParts.length - 1));

        nguoiDungChiTiet.setMaNguoiDungChiTiet("NDCT" + nguoiDung.getId());
        nguoiDungChiTiet.setHo(ho);
        nguoiDungChiTiet.setTenDem(tenDem);
        nguoiDungChiTiet.setTen(ten);
        nguoiDungChiTiet.setGioiTinh("Không rõ");
        nguoiDungChiTiet.setSoDienThoai(soDienThoai);
        nguoiDungChiTiet.setNgayTao(new Date());
        nguoiDungChiTiet.setNgaySua(new Date());
        nguoiDungChiTiet.setTrangThai(1);
        nguoiDungChiTiet.setNguoiDung(nguoiDung);
        nguoiDungChiTiet.setMoTa("Thông tin chi tiết được thêm mới");
        return nguoiDungChiTiet;
    }



    @GetMapping("t-shirt-luxury/admin")
    public String getSanPhamChiTiet(Model model, HttpSession session) {
        List<SanPham> sanPhamList = (List<SanPham>) session.getAttribute("SP");
        if(sanPhamList == null) {
            model.addAttribute("SP", sanPhamRepo.SanPham());
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
        model.addAttribute("errorSL",session.getAttribute("errorSL"));
        session.setAttribute("listVoucher",voucherRepo.listVoucher(tongTien));
        return "admin/admin";
    }

    @GetMapping("t-shirt-luxury/admin/timSanPham")
    public String timSanPham(Model model, @RequestParam("timKiemSanPham") String timKiemSanPham, HttpSession session) {
//        model.addAttribute("SP", sanPhamRepo.timKiem(timKiemSanPham));
        session.setAttribute("SP",sanPhamRepo.timKiem(timKiemSanPham));
        return "redirect:/t-shirt-luxury/admin";
    }


    @GetMapping("/t-shirt-luxury/admin/timKhachHang")
    public String searchKhachHang(RedirectAttributes redirectAttributes, @RequestParam("searchSoDienThoai") String timKhachHang) {
        String hoVaTen = hoaDonRepo.getHoVaTenKhachHang(timKhachHang);

        String soDienThoai = hoaDonRepo.getSoDienThoai(timKhachHang);
        redirectAttributes.addFlashAttribute("soDienThoaiKhachHang", soDienThoai);

        if (hoVaTen != null) {
            hoVaTen = hoVaTen.replace(",", " ");
            redirectAttributes.addFlashAttribute("timKiemKhachHang", hoVaTen);
        }else {
            redirectAttributes.addFlashAttribute("khongTimThay", "Không tìm thấy khách hàng !");
        }



        System.out.println("Tên khách hàng: " + hoVaTen);
        return "redirect:/t-shirt-luxury/admin";
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

                // Kiểm tra sản phẩm chi tiết đã tồn tại hay chưa
                boolean sanPhamDaTonTai = idSPCTDaCo.contains(sanPhamChiTiet1.getId());
                Integer idHDCT = (Integer) session.getAttribute("idHDCT");
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
                } else {
                    // Nếu sản phẩm chưa tồn tại, thêm mới
                    if (soLuong <= soLuongSpct) {


                        HoaDonChiTiet hoaDonChiTiet = new HoaDonChiTiet();
                        hoaDonChiTiet.setHoaDon(hoaDon1);
                        hoaDonChiTiet.setSoLuong(soLuong);
                        hoaDonChiTiet.setNgaySua(new Date());
                        hoaDonChiTiet.setNgayTao(new Date());
                        hoaDonChiTiet.setSanPhamChiTiet(sanPhamChiTiet1);
                        hoaDonChiTietRepo.save(hoaDonChiTiet);
                        session.setAttribute("hoaDonChiTiet", hoaDonChiTiet);
                        session.setAttribute("idHDCT", hoaDonChiTiet.getId());

                        redirectAttributes.addFlashAttribute("successMessage", "Thêm mới thành công.");
                    } else {
                        redirectAttributes.addFlashAttribute("errorMessage", "Số lượng không được vượt quá " + soLuongSpct);
                    }
                }
            }
        }
            return "redirect:/t-shirt-luxury/admin";
        }


    @GetMapping("/t-shirt-luxury/admin/delete-hdct")
    public String deleteHoaDon(@RequestParam("id") Integer id, HttpSession session) {


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
            HttpSession session, Model model, @RequestParam("hoVaTenKhachHang") String hoVaTenKhachHang,
            @RequestParam("soDienThoai") String soDienThoaiKhachHang) {

        if (hoaDonRepo.getTrangThaiDaThanhToan() == 1 || hoaDonChiTietRepo.selectHoaDonChiTiet((Integer) session.getAttribute("idHoaDon")).isEmpty()) {
            String noti = "Vui lòng chọn sản phẩm";
            session.setAttribute("noti", noti);
        } else {


            int idHoaDon = (Integer) session.getAttribute("idHoaDon");
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
//            Float voucherGiam = (Float) session.getAttribute("giaTriGiamVoucher");
//            hoaDon.setTongTien(hoaDonRepo.tongTien(idHoaDon)-voucherGiam);

            Object voucherGiamObj = session.getAttribute("giaTriGiamVoucher");
            Float voucherGiam = null;
            if (voucherGiamObj instanceof String) {
                try {
                    voucherGiam = Float.parseFloat((String) voucherGiamObj);
                } catch (NumberFormatException e) {
                    voucherGiam = null; // Handle this gracefully, e.g., set to null or default value
                    System.err.println("Invalid voucher value: " + voucherGiamObj);
                }
            } else if (voucherGiamObj instanceof Float) {
                voucherGiam = (Float) voucherGiamObj;
            }

            Float tongTien = hoaDonRepo.tongTien((Integer) session.getAttribute("idHoaDon"));

            if (voucherGiam == null || voucherGiam.isNaN()) {
                hoaDon.setTongTien(tongTien);
            } else {
                hoaDon.setTongTien(tongTien - voucherGiam);
            }

            hoaDon.setTrangThai(1);
            NguoiDung nguoiDung = new NguoiDung();
            NguoiDungChiTiet nguoiDungChiTiet1 = new NguoiDungChiTiet();


                if (hoVaTenKhachHang == null || hoVaTenKhachHang.trim().isEmpty()) {
                    // Tạo người dùng mới cho khách vãng lai
                    nguoiDung = createNguoiDungForGuest();

                    nguoiDungRepo.save(nguoiDung);

                    nguoiDungChiTiet1 = createNguoiDungChiTiet(nguoiDung, "Khách vãng lai", soDienThoaiKhachHang);
                    nguoiDungChiTietRepo.save(nguoiDungChiTiet1);

                } else {
                    // Lấy ID người dùng dựa trên số điện thoại
                    Integer idNguoiDung = hoaDonRepo.getIdNguoiDung(soDienThoaiKhachHang);

                    if (idNguoiDung != null) {
                        // Kiểm tra xem người dùng có tồn tại không
                        Optional<NguoiDung> existingNguoiDung = nguoiDungRepo.findById(idNguoiDung);

                        if (existingNguoiDung.isPresent()) {
                            // Nếu tồn tại, cập nhật thông tin
                            nguoiDung = existingNguoiDung.get();
                        } else {
                            // Nếu không tồn tại, tạo mới
                            nguoiDung = createNguoiDung(hoVaTenKhachHang);
                            nguoiDung.setId(idNguoiDung);
                            NguoiDungChiTiet nguoiDungChiTiet = createNguoiDungChiTiet(nguoiDung, hoVaTenKhachHang, soDienThoaiKhachHang);
                            nguoiDungChiTietRepo.save(nguoiDungChiTiet);
                        }
                    } else {
                        // Trường hợp không tìm thấy ID người dùng, tạo mới cả người dùng và chi tiết
                        nguoiDung = createNguoiDung(hoVaTenKhachHang);
                        nguoiDungRepo.save(nguoiDung);

                        // Tạo người dùng chi tiết tương ứng
                        NguoiDungChiTiet nguoiDungChiTiet = createNguoiDungChiTiet(nguoiDung, hoVaTenKhachHang, soDienThoaiKhachHang);
                        nguoiDungChiTietRepo.save(nguoiDungChiTiet);
                    }
                }



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
