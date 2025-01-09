package com.example.tshirt_luxury_datn.controller;

import com.example.tshirt_luxury_datn.entity.*;
import com.example.tshirt_luxury_datn.repository.anhSanPhamRepository;
import com.example.tshirt_luxury_datn.repository.danhMucRepository;
import com.example.tshirt_luxury_datn.repository.sanPhamRepository;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Date;
import java.util.List;

@Controller
public class sanPhamController {
    @Autowired
    sanPhamRepository sanPhamRepository;
    @Autowired
    danhMucRepository danhMucRepository;
    @Autowired
    anhSanPhamRepository anhSanPhamRepository;

//    @GetMapping("t-shirt-luxury/admin/san-pham")
//    public String sanPhamAdmin(@RequestParam(defaultValue = "0") int p, Model model) {
//        Pageable pageable = PageRequest.of(p, 5);  // Hiển thị 5 sản phẩm mỗi trang
//        Page<SanPham> sanPhamPage = sanPhamRepository.findAll(pageable);
//
//        model.addAttribute("sanPhamPage", sanPhamPage);
//        return "SanPham/san-pham-admin";
//    }

    @GetMapping("t-shirt-luxury/admin/san-pham")
    public String sanPhamAdmin(Model model) {
        model.addAttribute("listSanPham", sanPhamRepository.findAllSanPhamByNgayTaoDesc());
        return "SanPham/san-pham-admin";
    }

    @ModelAttribute("danhMuc")
    public String getDanhMuc(Model model) {
        model.addAttribute("danhMuc", danhMucRepository.findAll());
        return "SanPham/san-pham-admin";
    }

    @ModelAttribute("anhSP")
    public String getAnhSP(Model model) {
        model.addAttribute("anhSP", anhSanPhamRepository.findAll());
        return "SanPham/san-pham-admin";
    }

    boolean validate(SanPham sanPham, RedirectAttributes redirectAttributes) {
        String errorMessage = "";
        if (sanPham.getTenSanPham() == null || sanPham.getTenSanPham().isBlank()) {
            errorMessage = "Vui lòng nhập tên sản phẩm !";
            redirectAttributes.addFlashAttribute("errorMessageSanPham", errorMessage);
            redirectAttributes.addFlashAttribute("openModal", "themSanPham");
            return false;
        }
        return true;
    }

    public String generateMaSanPham() {
        // Lấy mã hóa đơn lớn nhất từ cơ sở dữ liệu
        String lastMaSanPham = sanPhamRepository.findLastSanPham(); // Giả sử phương thức này trả về "HD005"

        int nextNumber = 1; // Số bắt đầu nếu không có hóa đơn nào
        if (lastMaSanPham != null && lastMaSanPham.startsWith("SP")) {
            // Lấy phần số từ mã hóa đơn cuối cùng
            String numberPart = lastMaSanPham.substring(2); // Bỏ "HD"
            nextNumber = Integer.parseInt(numberPart) + 1;
        }

        // Format mã hóa đơn mới với 3 chữ số (HD001, HD002, ...)
        return String.format("SP%03d", nextNumber);
    }

    @PostMapping("t-shirt-luxury/admin/san-pham/add")
    public String sanPhamSave(
            @RequestParam("id_danh_muc") Integer idDanhMuc,
            @ModelAttribute("sanPham") SanPham sanPham,
            RedirectAttributes redirectAttributes
    ) {
        if (validate(sanPham, redirectAttributes)) {
            sanPham.setMaSanPham(generateMaSanPham());
            sanPham.setNgayTao(new Date());
            sanPham.setNgaySua(new Date());
            sanPham.setDanhMuc(danhMucRepository.findById(idDanhMuc).get());
            // Tạo mã barcode
            String barcodeData = generateRandomEAN13();

            // Tạo ảnh barcode và lưu
            String barcodePath = generateEAN13Barcode(barcodeData);
            sanPham.setBarcode(barcodeData); // Lưu barcode vào sản phẩm (nếu có cột barcode)
            sanPhamRepository.save(sanPham);
        }

        return "redirect:/t-shirt-luxury/admin/san-pham";
    }

    private String generateRandomEAN13() {
        // Sinh 12 chữ số ngẫu nhiên
        StringBuilder ean12 = new StringBuilder();
        for (int i = 0; i < 12; i++) {
            ean12.append((int) (Math.random() * 10));
        }
        // Tính số kiểm tra (checksum)
        String checksum = String.valueOf(calculateEAN13Checksum(ean12.toString()));
        // Trả về chuỗi hoàn chỉnh
        return ean12 + checksum;
    }

    private int calculateEAN13Checksum(String data) {
        int sum = 0;
        for (int i = 0; i < data.length(); i++) {
            int digit = Character.getNumericValue(data.charAt(i));
            sum += (i % 2 == 0) ? digit : digit * 3;
        }
        int checksum = (10 - (sum % 10)) % 10;
        return checksum;
    }
    private String generateEAN13Barcode(String data) {
        try {
            // Tạo mã barcode EAN-13
            BitMatrix bitMatrix = new com.google.zxing.MultiFormatWriter().encode(
                    data, BarcodeFormat.EAN_13, 300, 150
            );

            // Tạo thư mục barcodes nếu chưa tồn tại
            Path barcodeDir = Path.of("src/main/resources/static/barcodes");
            if (!Files.exists(barcodeDir)) {
                Files.createDirectories(barcodeDir);
            }

            // Lưu ảnh barcode
            Path barcodePath = barcodeDir.resolve(data + ".png");
            MatrixToImageWriter.writeToPath(bitMatrix, "PNG", barcodePath);

            return "/barcodes/" + data + ".png"; // Đường dẫn ảnh trong hệ thống
        } catch (WriterException | IOException e) {
            e.printStackTrace();
            return null;
        }
    }
    @GetMapping("t-shirt-luxury/admin/san-pham/delete")
    public String sanPhamDelete(@RequestParam("id") Integer id) {
        sanPhamRepository.deleteById(id);
        return "redirect:/t-shirt-luxury/admin/san-pham";
    }


    @GetMapping("t-shirt-luxury/admin/sua-san-pham/getOne")
    public String getSanPham(@RequestParam(name = "id") Integer id, Model model) {

        // Lấy đối tượng san pham theo ID
        SanPham sanPham = sanPhamRepository.getOne(id);
        model.addAttribute("sanPham", sanPham);
        return "SanPham/sua-san-pham";
    }

    @PostMapping("t-shirt-luxury/admin/updateSanPham")
    public String updateNguoiDung(@RequestParam("id") Integer id,
                                  @ModelAttribute("sanPham") SanPham sanPham,
                                  @RequestParam("tenSanPham") String tenSanPham,
                                  RedirectAttributes redirectAttributes) {
        SanPham getOne = sanPhamRepository.getReferenceById(id);

        if (getOne.getId() == id) {
            String errorMessage = "";
            if (tenSanPham == null || tenSanPham.isBlank()) {
                errorMessage = "Vui lòng nhập tên sản phẩm !";
                redirectAttributes.addFlashAttribute("errorMessageSanPham", errorMessage);
                return "redirect:/t-shirt-luxury/admin/sua-san-pham/getOne?id=" + id;
            } else {
                Date ngaySua = new Date();
                sanPham.setId(id);
                sanPham.setNgaySua(ngaySua);
                sanPham.setNgayTao(getOne.getNgayTao());
                sanPhamRepository.save(sanPham);
            }


        }

        return "redirect:/t-shirt-luxury/admin/san-pham";
    }


    @GetMapping("t-shirt-luxury/admin/timSP")
    public String timSP(Model model,
                             @RequestParam(value = "timKiemSanPham", required = false) String timKiemSanPham,
                             @RequestParam(value = "trangThai", required = false) Integer trangThai) {

        List<SanPham> ketQua;

        if (timKiemSanPham == null && trangThai == null) {
            ketQua = sanPhamRepository.findAll();
        } else {
            ketQua = sanPhamRepository.timKiemSP(timKiemSanPham, trangThai);
        }

        model.addAttribute("listSanPham", ketQua);
        model.addAttribute("timKiemSanPham", timKiemSanPham);
        model.addAttribute("trangThai", trangThai);

        return "SanPham/san-pham-admin";
    }


    @GetMapping("t-shirt-luxury/xem-them")
    public String xemThem(Model model) {
        model.addAttribute("allSanPham", sanPhamRepository.getAllXemThem());
        return "Other/xem-them";
    }



}
