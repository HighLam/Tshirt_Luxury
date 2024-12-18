package com.example.tshirt_luxury_datn.controller;

import com.example.tshirt_luxury_datn.entity.*;
import com.example.tshirt_luxury_datn.repository.anhSanPhamRepository;
import com.example.tshirt_luxury_datn.repository.danhMucRepository;
import com.example.tshirt_luxury_datn.repository.sanPhamRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

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

    public String generateMaSanPham() {
        // Lấy mã hóa đơn lớn nhất từ cơ sở dữ liệu
        String lastMaSanPham = sanPhamRepository.findLastMaSanPham(); // Giả sử phương thức này trả về "HD005"

        int nextNumber = 1; // Số bắt đầu nếu không có hóa đơn nào
        if (lastMaSanPham != null && lastMaSanPham.startsWith("SP")) {
            // Lấy phần số từ mã hóa đơn cuối cùng
            String numberPart = lastMaSanPham.substring(2); // Bỏ "HD"
            nextNumber = Integer.parseInt(numberPart) + 1;
        }

        // Format mã hóa đơn mới với 3 chữ số (HD001, HD002, ...)
        return String.format("SP%03d", nextNumber);
    }

    @GetMapping("t-shirt-luxury/admin/san-pham")
    public String sanPhamAdmin(@RequestParam(defaultValue = "0") int p, Model model) {
        Pageable pageable = PageRequest.of(p, 5);  // Hiển thị 5 sản phẩm mỗi trang
        Page<SanPham> sanPhamPage = sanPhamRepository.findAll(pageable);

        model.addAttribute("sanPhamPage", sanPhamPage);

        return "SanPham/san-pham-admin";
    }

    @ModelAttribute("danhMuc")
    public String getDanhMuc(Model model) {
        model.addAttribute("danhMuc",danhMucRepository.findAll());
        return "SanPham/san-pham-admin";
    }
    @ModelAttribute("anhSP")
    public String getAnhSP(Model model) {
        model.addAttribute("anhSP",anhSanPhamRepository.findAll());
        return "SanPham/san-pham-admin";
    }

    @PostMapping("t-shirt-luxury/admin/san-pham/add")
    public String sanPhamSave(
            @RequestParam("id_danh_muc") Integer idDanhMuc,
            @ModelAttribute("sanPham") SanPham sanPham){

        sanPham.setMaSanPham(generateMaSanPham());
        sanPham.setNgayTao(new Date());
        sanPham.setNgaySua(new Date());
        sanPham.setDanhMuc(danhMucRepository.findById(idDanhMuc).get());
        sanPhamRepository.save(sanPham);
        return "redirect:/t-shirt-luxury/admin/san-pham";
    }

    @GetMapping("t-shirt-luxury/admin/san-pham/delete")
    public String sanPhamDelete(@RequestParam("id") Integer id){
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
    public String updateNguoiDung(@RequestParam("id") Integer id, @ModelAttribute("sanPham") SanPham sanPham) {
        SanPham getOne = sanPhamRepository.getReferenceById(id);
        if (getOne.getId() == id) {
            Date ngaySua = new Date();
            sanPham.setId(id);
            sanPham.setNgaySua(ngaySua);
            sanPham.setNgayTao(getOne.getNgayTao());
            sanPhamRepository.save(sanPham);
        }
        return "redirect:/t-shirt-luxury/admin/san-pham";
    }


    @GetMapping("t-shirt-luxury/admin/timSP")
    public String timSanPham(Model model,
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
//    @GetMapping("t-shirt-luxury/admin/san-pham")
//    public String phanTrang(
//            @RequestParam(defaultValue = "0") int p,
//            Model model){
//        Pageable pageable = PageRequest.of(p, 5);
//        model.addAttribute("page", sanPhamRepository.findAll(pageable));
//        return "/SanPham/san-pham-admin";
//    }





}
