package com.example.tshirt_luxury_datn.controller;


import com.example.tshirt_luxury_datn.repository.*;
import com.example.tshirt_luxury_datn.response.SanPhamHomeResponse;
import com.example.tshirt_luxury_datn.response.sanPhamSearchResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Date;
import java.util.List;

@Controller
public class trangChuController {

    @Autowired
    sanPhamRepository sanPhamRepo;

    @Autowired
    sanPhamChiTietRepository sanPhamChiTietRepo;
    @Autowired
    gioHangRepository gioHangRepo;

    @Autowired
    sanPhamChiTietAdminRepository sanPhamChiTietAdminRepo;

    @Autowired
    gioHangChiTietRepository gioHangChiTietRepo;


    public GioHang createGioHang(HttpSession session) {
        GioHang gioHang = new GioHang();
        gioHang.setNgaySua(new Date());
        gioHang.setNgayTao(new Date());
        gioHang.setTrangThai(0);
        gioHangRepo.save(gioHang);
        session.setAttribute("idGioHang", gioHang.getId());
        return gioHang;
    }


    @GetMapping("/t-shirt-luxury/trang-chu")
    public String trangChu(Model model) {
        Pageable pageable = PageRequest.of(0, 4); // Lấy 4 sản phẩm mới nhất
        List<SanPhamHomeResponse> sanPhamList = sanPhamRepo.findTop4NewestSanPhamForHome(pageable);
        System.out.println(sanPhamList);

        model.addAttribute("sanPhamList", sanPhamList);

        return "BanHang/trang-chu";
    }


    @GetMapping("/t-shirt-luxury/san-pham-chi-tiet-detail")
    public String sanPhamChiTietDetail(@RequestParam("idSPDetail") Integer id, Model model, HttpSession session) {
        session.setAttribute("idSPDetail", id);
        model.addAttribute("spDetail", sanPhamRepo.getReferenceById(id));
        model.addAttribute("imageDataList", sanPhamRepo.getImageDataListFromIdSanPham(id));
        model.addAttribute("mauSac", sanPhamChiTietRepo.findMauSacBySanPhamId(id));
        model.addAttribute("size", sanPhamChiTietRepo.findSizesBySanPhamId(id));
        model.addAttribute("notiOnl", session.getAttribute("notiOnl"));
        model.addAttribute("quaSoLuong", session.getAttribute("quaSoLuong"));
        if (sanPhamRepo.findMaxGiaBySanPhamId(id).equals(sanPhamRepo.findMinGiaBySanPhamId(id))) {
            model.addAttribute("giaMax", sanPhamRepo.findMaxGiaBySanPhamId(id));
        } else {
            model.addAttribute("giaMax", sanPhamRepo.findMaxGiaBySanPhamId(id));
            model.addAttribute("giaMin", sanPhamRepo.findMinGiaBySanPhamId(id));
            model.addAttribute("ok", "₫" + "-");
        }


        if (gioHangRepo.trangThaiGioHang() == 1) {
            createGioHang(session);
        }


        if (gioHangRepo.trangThaiGioHang() == 1) {
            if (gioHangRepo.trangThaiGioHang() != 0) {
                createGioHang(session);
            }

        }

        session.setAttribute("idSPDetail", id);
        return "SanPhamChiTiet/san-pham-chi-tiet";
    }


    @GetMapping("/san-pham/anh")
    public ModelAndView showSanPhamImages(HttpSession session) {
        Integer idSP = (Integer) session.getAttribute("idSPDetail");

        // Lấy danh sách ảnh dưới dạng byte[] từ DB
        List<byte[]> imageDataList = sanPhamChiTietRepo.findAnhSanPhamByIdSanPham(idSP);

        // Kiểm tra nếu không có ảnh
        if (imageDataList == null || imageDataList.isEmpty()) {
            return new ModelAndView("error");  // Trả về trang lỗi nếu không có ảnh
        }

        ModelAndView modelAndView = new ModelAndView("SanPhamChiTiet/san-pham-chi-tiet");
        modelAndView.addObject("imageDataList", imageDataList);  // Thêm danh sách byte[] vào model
        return modelAndView;
    }


    @PostMapping("/t-shirt-luxury/san-pham-chi-tiet/add-cart")
    public String addCart(@RequestParam(value = "idSPDetail") Integer idSanPham,
                          @RequestParam(value = "mauSac", defaultValue = "") Integer idMauSac,
                          @RequestParam(value = "size", defaultValue = "") Integer idSize,
                          @RequestParam("soLuong") Integer soLuong,
                          RedirectAttributes redirectAttributes,
                          HttpSession session) {


        Integer getSoLuongSpct = sanPhamChiTietAdminRepo.getSoLuong(idMauSac, idSize, idSanPham);

        if (idMauSac == null) {
            redirectAttributes.addFlashAttribute("errorMessage", "Vui lòng chọn màu sắc!");
            return "redirect:/t-shirt-luxury/san-pham-chi-tiet-detail?idSPDetail=" + idSanPham;
        }

        // Kiểm tra kích thước
        if (idSize == null) {
            redirectAttributes.addFlashAttribute("errorMessage", "Vui lòng chọn kích thước!");
            return "redirect:/t-shirt-luxury/san-pham-chi-tiet-detail?idSPDetail=" + idSanPham;
        } else {

            if (soLuong <= getSoLuongSpct) {
                SanPhamChiTiet sanPhamChiTiet = sanPhamChiTietAdminRepo.getSanPhamChiTiet(idMauSac, idSize, idSanPham);

                Integer idGioHang = (Integer) session.getAttribute("idGioHang");
                GioHang gioHang = gioHangRepo.getReferenceById(idGioHang);
                Integer soLuongTrongGio = gioHangChiTietRepo.findSoLuongById(idGioHang);
                if (soLuongTrongGio == null) {
                    soLuongTrongGio = 0;
                }

                if (soLuongTrongGio + soLuong <= getSoLuongSpct) {
                    List<Integer> idSPCTExistList = gioHangChiTietRepo.findIdSanPhamChiTietByIdGioHang(idGioHang);
                    boolean idExist = false;
                    for (Integer idSPCT : idSPCTExistList) {
                        if (idSPCT.equals(sanPhamChiTiet.getId())) {
                            idExist = true;
                            break;
                        }
                    }
                    if (idExist) {
                        GioHangChiTiet gioHangChiTiet = gioHangChiTietRepo.getGHCTByIdSPCT(sanPhamChiTiet.getId());
                        gioHangChiTiet.setSoLuong(gioHangChiTiet.getSoLuong() + soLuong);
                        gioHangChiTietRepo.save(gioHangChiTiet);
                    } else {
                        GioHangChiTiet gioHangChiTiet = new GioHangChiTiet();
                        gioHangChiTiet.setGioHang(gioHang);
                        gioHangChiTiet.setSoLuong(soLuong);
                        gioHangChiTiet.setNgayTao(new Date());
                        gioHangChiTiet.setNgaySua(new Date());
                        gioHangChiTiet.setSanPhamChiTiet(sanPhamChiTiet);
                        // Lưu bản ghi mới
                        gioHangChiTietRepo.save(gioHangChiTiet);
                        String gioHangNull = "";
                        session.setAttribute("gioHangNull", gioHangNull);
                        String quaSoLuong = "";
                        session.setAttribute("quaSoLuong", quaSoLuong);
                    }

                } else {
                    redirectAttributes.addFlashAttribute("errorMessage", "Quá số lượng");
                    return "redirect:/t-shirt-luxury/san-pham-chi-tiet-detail?idSPDetail=" + idSanPham;
                }
                String quaSoLuong = "";
                session.setAttribute("quaSoLuong", quaSoLuong);
            } else {
                String quaSoLuong = "Số lượng không được vượt quá " + getSoLuongSpct;
                session.setAttribute("quaSoLuong", quaSoLuong);
            }
        }
        return "redirect:/t-shirt-luxury/san-pham-chi-tiet-detail?idSPDetail=" + idSanPham;
    }


    @GetMapping("/t-shirt-luxury/tim-san-pham")
    public String timSanPham(Model model, @RequestParam("timKiemSanPham") String timKiemSanPham) {

        List<sanPhamSearchResponse> results = sanPhamRepo.sanPhamSearch(timKiemSanPham);
        model.addAttribute("sanPhamSearch", results);

        return "Other/tim-kiem-san-pham";
    }


}
