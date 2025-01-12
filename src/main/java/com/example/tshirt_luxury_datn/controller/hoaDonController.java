package com.example.tshirt_luxury_datn.controller;

import com.example.tshirt_luxury_datn.entity.*;
import com.example.tshirt_luxury_datn.repository.*;
import com.itextpdf.text.*;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfWriter;

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

//    @GetMapping("/t-shirt-luxury/admin/hoa-don-online/detail")
//    public String hoaDonOnlineDetail(@RequestParam("idHoaDonOnline") Integer idHoaDon, Model model) {
//        List<HoaDonChiTiet> hoaDonChiTiet = hoaDonChiTietRepo.getHoaDonChiTietByIdHoaDon(idHoaDon);
//        HoaDon hoaDon = hoaDonRepo.getReferenceById(idHoaDon);
//        Integer idVC = hoaDon.getVoucher().getId();
//        Float tongGia = hoaDonRepo.tongGiaBanDau(idHoaDon);
//        Voucher voucher = voucherRepo.getReferenceById(idVC);
//        Integer phanTramGiam = voucher.getGiaTriGiam();
//        Float gioiHanGiam =  voucherRepo.gioiHan(idVC);
//
//        Float giaTriGiam = tongGia * phanTramGiam /100;
//
//        if(giaTriGiam>gioiHanGiam){
//            model.addAttribute("giaTriGiam",gioiHanGiam );
//        }else {
//            model.addAttribute("giaTriGiam",giaTriGiam );
//        }
//        model.addAttribute("voucherTrongHoaDon", hoaDonRepo.getReferenceById(idHoaDon));
//        //model.addAttribute("tongTienHoaDon", hoaDonRepo.getReferenceById(idHoaDon));
//        model.addAttribute("tongTien", hoaDonRepo.tongTienHoaDonOnline(idHoaDon));
//
//
//        model.addAttribute("giaTienBanDau", hoaDonRepo.tongGiaBanDau(idHoaDon));
//
//        model.addAttribute("soSanPhamMua", hoaDonRepo.getSoLuongSanPhamMua(idHoaDon));
//
//        model.addAttribute("xacNhanHoaDonOnline", hoaDonRepo.getHoaDonTrangThai1(idHoaDon));
//
//        model.addAttribute("hoaDonChiTietOnline", hoaDonChiTiet);
//        System.out.println("fhjskdhfksjhfkjshkjfhksjdhkfjs"+hoaDonChiTiet);
//        Integer idThongTinDonHang = hoaDonRepo.getThongTinDonHang(idHoaDon);
//        ThongTinNhanHang thongTinNhanHang = thongTinDonHangRepo.getReferenceById(idThongTinDonHang);
//        model.addAttribute("thongTinNhanHang", thongTinNhanHang);
//        return "HoaDon/xac-nhan-don-hang";
//
//    }

    @GetMapping("/t-shirt-luxury/admin/hoa-don-online/detail")
    public String hoaDonOnlineDetail(@RequestParam("idHoaDonOnline") Integer idHoaDon, Model model) {
        // Lấy danh sách chi tiết hóa đơn
        List<HoaDonChiTiet> hoaDonChiTiet = hoaDonChiTietRepo.getHoaDonChiTietByIdHoaDon(idHoaDon);

        // Lấy thông tin hóa đơn
        HoaDon hoaDon = hoaDonRepo.getReferenceById(idHoaDon);

        // Kiểm tra nếu voucher là null
        Voucher voucher = null;
        Integer idVC = null;
        if (hoaDon.getVoucher() != null) {
            idVC = hoaDon.getVoucher().getId();
            voucher = voucherRepo.getReferenceById(idVC);
        }

        // Tính tổng giá ban đầu của hóa đơn
        Float tongGia = hoaDonRepo.tongGiaBanDau(idHoaDon);

        // Kiểm tra voucher và tính toán giá trị giảm
        Integer phanTramGiam = 0;
        Float gioiHanGiam = 0.0f;
        Float giaTriGiam = 0.0f;

        if (voucher != null) {
            phanTramGiam = voucher.getGiaTriGiam();
            gioiHanGiam = voucherRepo.gioiHan(idVC);
            giaTriGiam = tongGia * phanTramGiam / 100;
        }

        // Kiểm tra và áp dụng giới hạn giảm giá
        if (giaTriGiam > gioiHanGiam) {
            model.addAttribute("giaTriGiam", gioiHanGiam);
        } else {
            model.addAttribute("giaTriGiam", giaTriGiam);
        }

        // Thêm các thuộc tính vào model
        model.addAttribute("voucherTrongHoaDon", hoaDon);
        model.addAttribute("tongTien", hoaDonRepo.tongTienHoaDonOnline(idHoaDon));
        model.addAttribute("giaTienBanDau", hoaDonRepo.tongGiaBanDau(idHoaDon));
        model.addAttribute("soSanPhamMua", hoaDonRepo.getSoLuongSanPhamMua(idHoaDon));
        model.addAttribute("xacNhanHoaDonOnline", hoaDonRepo.getHoaDonTrangThai1(idHoaDon));
        model.addAttribute("hoaDonChiTietOnline", hoaDonChiTiet);

        // Lấy thông tin đơn hàng
        Integer idThongTinDonHang = hoaDonRepo.getThongTinDonHang(idHoaDon);
        ThongTinNhanHang thongTinNhanHang = thongTinDonHangRepo.getReferenceById(idThongTinDonHang);
        model.addAttribute("thongTinNhanHang", thongTinNhanHang);

        // Trả về trang xác nhận đơn hàng
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

    @GetMapping("/t-shirt-luxury/admin/timHDTQ")
    public String timHoaDonTaiQ(
            @RequestParam(value = "searchName", required = false) String searchName,
            @RequestParam(value = "trangThai", required = false) Integer trangThai,
            Model model) {

        List<HoaDon> listHoaDonTaiQuay;

        if (searchName == null && trangThai == null) {

            listHoaDonTaiQuay = hoaDonRepo.timHoaDonTaiQuay1(searchName);
        } else {
            listHoaDonTaiQuay = hoaDonRepo.timHoaDonTaiQuay(searchName, trangThai);
        }
        model.addAttribute("listHoaDonTaiQuay", listHoaDonTaiQuay);
        model.addAttribute("searchName", searchName);
        model.addAttribute("trangThai", trangThai);

        return "HoaDon/hoa-don-admin"; // Trả về tên file JSP
    }

    @GetMapping("/t-shirt-luxury/admin/hoa-don/pdf")
    public void exportToPDF(@RequestParam Integer idHoaDon, HttpServletResponse response) throws IOException, DocumentException {
        HoaDon hoaDon = hoaDonRepo.findById(idHoaDon).orElseThrow(() -> new IllegalArgumentException("Hóa đơn không tồn tại"));
        List<HoaDonChiTiet> hoaDonChiTietList = hoaDonChiTietRepo.getHDCTByIdHD(idHoaDon);

        response.setContentType("application/pdf");
        String headerKey = "Content-Disposition";
        String headerValue = "attachment; filename=hoa-don-" + idHoaDon + ".pdf";
        response.setHeader(headerKey, headerValue);

        Document pdfDoc = new Document(PageSize.A4);
        PdfWriter writer = PdfWriter.getInstance(pdfDoc, response.getOutputStream());
        pdfDoc.open();

        // Thêm logo công ty
        Image logo = Image.getInstance("D:\\FPT POLYTECHNIC\\DATN\\T-Shirt Luxury.png");
        logo.scaleToFit(100, 100);
        logo.setAlignment(Element.ALIGN_LEFT);
        pdfDoc.add(logo);



        // Thêm tiêu đề hóa đơn
        Paragraph title = new Paragraph("INVOICE", FontFactory.getFont(FontFactory.HELVETICA_BOLD, 24, BaseColor.BLUE));
        title.setAlignment(Element.ALIGN_CENTER);
        pdfDoc.add(title);

        pdfDoc.add(new Paragraph("Invoice ID: " + hoaDon.getId() + "\nDate: " + hoaDon.getNgayTao(), FontFactory.getFont(FontFactory.HELVETICA, 12)));
        pdfDoc.add(new Paragraph("Customer: " + hoaDon.getNguoiDung().getTenNguoiDung(), FontFactory.getFont(FontFactory.HELVETICA, 12)));
        pdfDoc.add(new Paragraph(" "));

        float[] columnWidths = {1, 5, 2, 3};
        PdfPTable table = new PdfPTable(columnWidths);
        table.setWidthPercentage(100);
        table.setSpacingBefore(10f);
        table.setSpacingAfter(10f);

        // Header bảng
        table.addCell(createStyledCell("No.", true, BaseColor.LIGHT_GRAY));
        table.addCell(createStyledCell("Product Name", true, BaseColor.LIGHT_GRAY));
        table.addCell(createStyledCell("Quantity", true, BaseColor.LIGHT_GRAY));
        table.addCell(createStyledCell("Price", true, BaseColor.LIGHT_GRAY));

        // Dữ liệu bảng
        int stt = 1;
        for (HoaDonChiTiet chiTiet : hoaDonChiTietList) {
            table.addCell(createStyledCell(String.valueOf(stt++), false, BaseColor.WHITE));
            table.addCell(createStyledCell(chiTiet.getSanPhamChiTiet().getSanPham().getTenSanPham(), false, BaseColor.WHITE));
            table.addCell(createStyledCell(String.valueOf(chiTiet.getSoLuong()), false, BaseColor.WHITE));
            table.addCell(createStyledCell(String.format("%,.0f VND", chiTiet.getSanPhamChiTiet().getGia()), false, BaseColor.WHITE));
        }

        double tongTien = hoaDonChiTietList.stream().mapToDouble(chiTiet -> chiTiet.getSanPhamChiTiet().getGia() * chiTiet.getSoLuong()).sum();
        PdfPCell emptyCell = new PdfPCell(new Phrase(""));
        emptyCell.setColspan(2);
        emptyCell.setBorder(Rectangle.NO_BORDER);
        table.addCell(emptyCell);
        table.addCell(createStyledCell("Total", true, BaseColor.YELLOW));
        table.addCell(createStyledCell(String.format("%,.0f VND", tongTien), true, BaseColor.YELLOW));

        pdfDoc.add(table);
        pdfDoc.close();
    }

    private PdfPCell createStyledCell(String text, boolean isBold, BaseColor bgColor) {
        Font font = isBold ? FontFactory.getFont(FontFactory.HELVETICA_BOLD) : FontFactory.getFont(FontFactory.HELVETICA);
        PdfPCell cell = new PdfPCell(new Phrase(text, font));
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
        cell.setBackgroundColor(bgColor);
        cell.setPadding(5);
        return cell;
    }






}
