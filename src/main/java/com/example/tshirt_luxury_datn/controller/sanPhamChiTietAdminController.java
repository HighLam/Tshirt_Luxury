package com.example.tshirt_luxury_datn.controller;

import com.example.tshirt_luxury_datn.entity.AnhSanPham;
import com.example.tshirt_luxury_datn.entity.SanPham;
import com.example.tshirt_luxury_datn.entity.SanPhamChiTiet;
import com.example.tshirt_luxury_datn.entity.Size;
import com.example.tshirt_luxury_datn.repository.*;
import com.example.tshirt_luxury_datn.response.sanPhamChiTietAdminRespone;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class sanPhamChiTietAdminController {
    @Autowired
    sizeRepository sizeRepo;
    @Autowired
    anhSanPhamRepository anhSanPhamRepo;
    @Autowired
    chatLieuRepository chatLieuRepo;
    @Autowired
    mauSacRepository mauSacRepo;
    @Autowired
    sanPhamChiTietAdminRepository sanPhamChiTietAdminRepo;
    @Autowired
    sanPhamRepository sanPhamRepo;

    @ModelAttribute("anhSanPham")
    public String getAllAnhSanPham(
            @RequestParam(value = "page", defaultValue = "0") int page,
            @RequestParam(value = "size", defaultValue = "8") int size,
            Model model) {
        Pageable pageable = PageRequest.of(page, size);
        Page<AnhSanPham> pageAnhSanPham = anhSanPhamRepo.findAllWithPagination(pageable);

        model.addAttribute("listAnh", pageAnhSanPham.getContent());
        model.addAttribute("currentPage", pageAnhSanPham.getNumber());
        model.addAttribute("totalPages", pageAnhSanPham.getTotalPages());

        return "SanPhamChiTiet/san-pham-chi-tiet-admin";
    }

    @ModelAttribute("sanPham")
    public Integer getSanPham(Model model, @RequestParam(name = "id") Integer id) {
        SanPham sanPham = sanPhamRepo.getReferenceById(id);
        Integer sanPhamId = sanPham.getId();
        model.addAttribute("SanPham", sanPhamId);
        return sanPhamId;
    }
//    @ModelAttribute("sanPham")
//    public String getSanPham(Model model) {
//        SanPham sanPham = sanPhamRepo.findAll().get(0);
//        model.addAttribute("SanPham", sanPham.getId());
//        return "SanPhamChiTiet/san-pham-chi-tiet-admin";
//    }

    @ModelAttribute("size")
    public String getSize(Model model) {
        model.addAttribute("size", sizeRepo.findAll());
        return "SanPhamChiTiet/san-pham-chi-tiet-admin";
    }

    @ModelAttribute("anhSanPham")
    public String getAnhSanPham(Model model) {
        model.addAttribute("anhSanPham", anhSanPhamRepo.findAll());
        return "SanPhamChiTiet/san-pham-chi-tiet-admin";
    }


    @ModelAttribute("chatLieu")
    public String getchatLieu(Model model) {
        model.addAttribute("chatLieu", chatLieuRepo.findAll());
        return "SanPhamChiTiet/san-pham-chi-tiet-admin";
    }


    @ModelAttribute("mauSac")
    public String getMauSac(Model model) {
        model.addAttribute("mauSac", mauSacRepo.findAll());
        return "SanPhamChiTiet/san-pham-chi-tiet-admin";
    }

    @GetMapping("t-shirt-luxury/admin/san-pham-chi-tiet")
    public String sanPhamChiTietAdmin(
            @RequestParam("id") Integer id,
            @RequestParam(value = "page", defaultValue = "0") int page,
            Model model,
            HttpSession session) {
        Pageable pageable = PageRequest.of(page, 5); // Số sản phẩm mỗi trang = 5
        Page<SanPhamChiTiet> pageResult = sanPhamChiTietAdminRepo.findBySanPhamId(id, pageable);

        model.addAttribute("spct", pageResult.getContent()); // Truyền danh sách
        model.addAttribute("totalPages", pageResult.getTotalPages());
        model.addAttribute("currentPage", page);
        model.addAttribute("pageResult", pageResult); // Truyền đối tượng Page nếu cần
        session.setAttribute("idSanPham", id);

        return "SanPhamChiTiet/san-pham-chi-tiet-admin";
    }




    @PostMapping("t-shirt-luxury/admin/san-pham-chi-tiet/add")
    public String sanPhamChiTietSave(
            @RequestParam(value = "id", required = true) Integer id,
            @RequestParam(value = "soLuong", required = true) Integer soLuong,
            @RequestParam(value = "giaTien", required = true) Double giaTien,
            @RequestParam(value = "khoiLuongSanPham", required = true) Double khoiLuongSanPham,
            @RequestParam(value = "id_size", required = false) Integer idSize,
            @RequestParam(value = "id_chat_lieu", required = false) Integer idChatLieu,
            @RequestParam(value = "id_mau_sac", required = false) Integer idMauSac,
            @RequestParam(value = "anhSanPham", required = false) MultipartFile anhSanPham,
            RedirectAttributes redirectAttributes) {

        try {
            // Kiểm tra sản phẩm chi tiết đã tồn tại
            SanPhamChiTiet existingSanPhamChiTiet = sanPhamChiTietAdminRepo.getSanPhamChiTiet(idMauSac, idSize, id);
            if (existingSanPhamChiTiet != null) {
                redirectAttributes.addFlashAttribute("error", "Sản phẩm chi tiết này đã tồn tại.");
                return "redirect:/t-shirt-luxury/admin/san-pham-chi-tiet?id=" + id;
            }

            // Lấy thông tin sản phẩm
            SanPham sanPhamAdd = sanPhamRepo.getReferenceById(id);
            SanPhamChiTiet sanPhamChiTiet = new SanPhamChiTiet();
            sanPhamChiTiet.setSanPham(sanPhamAdd);
            sanPhamChiTiet.setNgayTao(new Date());
            sanPhamChiTiet.setNgaySua(new Date());

            // Thiết lập các thông tin cơ bản
            sanPhamChiTiet.setSize(sizeRepo.findById(idSize).orElse(null));
            sanPhamChiTiet.setChatLieu(chatLieuRepo.findById(idChatLieu).orElse(null));
            sanPhamChiTiet.setMauSac(mauSacRepo.findById(idMauSac).orElse(null));
            sanPhamChiTiet.setSoLuong(soLuong);
            sanPhamChiTiet.setGia(giaTien);
            sanPhamChiTiet.setKhoiLuongSanPham(khoiLuongSanPham);
            sanPhamChiTiet.setTrangThai(1);

            // Xử lý ảnh sản phẩm
            if (anhSanPham != null && !anhSanPham.isEmpty()) {
                String uploadDir = "uploads/";
                String fileName = anhSanPham.getOriginalFilename();
                Path filePath = Paths.get(uploadDir + fileName);

                Files.createDirectories(filePath.getParent());
                Files.copy(anhSanPham.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);

                // Tạo hoặc tìm đối tượng AnhSanPham
                AnhSanPham anh = new AnhSanPham();
                anh.setTenAnhSanPham(fileName);
                anh = anhSanPhamRepo.save(anh); // Lưu đối tượng vào database

                sanPhamChiTiet.setAnhSanPham(anh); // Gắn đối tượng AnhSanPham
            }

            // Lưu sản phẩm chi tiết
            sanPhamChiTietAdminRepo.save(sanPhamChiTiet);
            redirectAttributes.addFlashAttribute("success", "Thêm sản phẩm chi tiết thành công.");
        } catch (IOException e) {
            redirectAttributes.addFlashAttribute("error", "Có lỗi xảy ra khi xử lý ảnh.");
            e.printStackTrace();
        }

        return "redirect:/t-shirt-luxury/admin/san-pham-chi-tiet?id=" + id;
    }


    @GetMapping("t-shirt-luxury/admin/san-pham-chi-tiet/delete")
    public String sanPhamChiTietDelete(@RequestParam("id") Integer id, HttpSession session) {
        sanPhamChiTietAdminRepo.deleteById(id);
        return "redirect:/t-shirt-luxury/admin/san-pham-chi-tiet?id=" + (Integer) session.getAttribute("idSanPham");
    }

    @GetMapping("t-shirt-luxury/admin/sua-san-pham-chi-tiet/getOne")
    public String getSanPham(@RequestParam(name = "id") Integer id, Model model) {

        // Lấy đối tượng san pham theo ID
        SanPhamChiTiet sanPhamChiTiet = sanPhamChiTietAdminRepo.getOne(id);
        model.addAttribute("SPCT", sanPhamChiTiet);
        return "SanPhamChiTiet/sua-san-pham-chi-tiet";
    }

    @PostMapping("t-shirt-luxury/admin/updateSanPhamChiTiet")
    public String updateChiTietSanPham(@RequestParam("id") Integer id, @ModelAttribute SanPhamChiTiet sanPhamChiTiet) {
        // Lấy thông tin sản phẩm chi tiết từ cơ sở dữ liệu
        SanPhamChiTiet getOne = sanPhamChiTietAdminRepo.findById(id).orElse(null);
        if (getOne != null) {
            // Cập nhật thông tin
            getOne.setSoLuong(sanPhamChiTiet.getSoLuong());
            getOne.setTrangThai(sanPhamChiTiet.getTrangThai());
            getOne.setNgaySua(new Date()); // Cập nhật ngày sửa

            // Lưu vào cơ sở dữ liệu
            sanPhamChiTietAdminRepo.save(getOne);
        }
        return "redirect:/t-shirt-luxury/admin/san-pham-chi-tiet?id=" + id;
    }

}
