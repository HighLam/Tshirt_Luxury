package com.example.tshirt_luxury_datn.controller;

import com.example.tshirt_luxury_datn.entity.GioHangChiTiet;
import com.example.tshirt_luxury_datn.repository.gioHangChiTietRepository;
import com.example.tshirt_luxury_datn.repository.gioHangRepository;
import com.example.tshirt_luxury_datn.repository.sanPhamChiTietAdminRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class gioHangController {

    @Autowired
    gioHangChiTietRepository gioHangChiTietRepo;

    @Autowired
    gioHangRepository gioHangRepo;
    @Autowired
    sanPhamChiTietAdminRepository sanPhamChiTietAdminRepo;

    @GetMapping("/t-shirt-luxury/gio-hang-chi-tiet")
    public String gioHangCanvas(HttpSession session, Model model) {
        Integer idGioHang = (Integer) session.getAttribute("idGioHang");
        List<GioHangChiTiet> gioHangChiTiets =  gioHangChiTietRepo.gioHangChiTietByID(idGioHang);
        model.addAttribute("tongTienGioHang",gioHangChiTietRepo.tinhTongGia(idGioHang));

        model.addAttribute("soLuongSanPhamMuaOnline", gioHangRepo.getSoLuongMuaOnline(idGioHang));
        System.out.println("sjjdfhghjdk"+gioHangChiTietRepo.tinhTongGia(idGioHang));
        model.addAttribute("GHCT", gioHangChiTiets);
        model.addAttribute("gioHangNull",session.getAttribute("gioHangNull"));
        model.addAttribute("quaSL",session.getAttribute("quaSL"));
        return "DanhMuc/gio-hang-chi-tiet";

    }
    @GetMapping("/t-shirt-luxury/gio-hang-chi-tiet/delete")
    public String deleteGioHangChiTiet(@RequestParam("id") Integer id){
        gioHangChiTietRepo.deleteById(id);
        return "redirect:/t-shirt-luxury/gio-hang-chi-tiet";
    }
    @GetMapping("/t-shirt-luxury/gio-hang-chi-tiet/plus")
    public String plusSLGioHangChiTiet(@RequestParam("id") Integer id,HttpSession session){

        GioHangChiTiet gioHangChiTiet = gioHangChiTietRepo.getReferenceById(id);

        Integer soLuongSP = gioHangChiTiet.getSanPhamChiTiet().getSoLuong();
        Integer soLuongGHCT = gioHangChiTiet.getSoLuong();
        if(soLuongGHCT<= soLuongSP-1){
            gioHangChiTiet.setId(id);
            gioHangChiTiet.setSoLuong(gioHangChiTiet.getSoLuong()+1);
            gioHangChiTietRepo.save(gioHangChiTiet);
            String quaSL = "";
            session.setAttribute("quaSL",quaSL);
            return "redirect:/t-shirt-luxury/gio-hang-chi-tiet";
        }else {
            String quaSL = "Số lượng không được quá " + soLuongSP;
            session.setAttribute("quaSL",quaSL);
            return "redirect:/t-shirt-luxury/gio-hang-chi-tiet";
        }

    }
    @GetMapping("/t-shirt-luxury/gio-hang-chi-tiet/subtract")
    public String subtractSLGioHangChiTiet(@RequestParam("id") Integer id ,HttpSession session){

        GioHangChiTiet gioHangChiTiet = gioHangChiTietRepo.getReferenceById(id);
        if (gioHangChiTiet.getSoLuong()>1){
            gioHangChiTiet.setId(id);
            gioHangChiTiet.setSoLuong(gioHangChiTiet.getSoLuong()-1);
            gioHangChiTietRepo.save(gioHangChiTiet);
            String quaSL ="";
            session.setAttribute("quaSL",quaSL);
        }else {
            gioHangChiTiet.setId(id);
            gioHangChiTiet.setSoLuong(gioHangChiTiet.getSoLuong());
            gioHangChiTietRepo.save(gioHangChiTiet);
            String quaSL ="Số lượng không được nhỏ hơn 1";
            session.setAttribute("quaSL",quaSL);
        }

        return "redirect:/t-shirt-luxury/gio-hang-chi-tiet";
    }

    @PostMapping("/t-shirt-luxury/gio-hang-chi-tiet/update-quantity")
    @ResponseBody // Trả về JSON khi được gọi bằng AJAX
    public ResponseEntity<String> updateQuantity(@RequestParam("idGioHangChiTiet") Integer idGioHangChiTiet,
                                                 @RequestParam("soLuong") Integer soLuong,
                                                 HttpSession session) {



            GioHangChiTiet gioHangChiTiet = gioHangChiTietRepo.findById(idGioHangChiTiet)
                    .orElseThrow(() -> new IllegalArgumentException("Chi tiết giỏ hàng không tồn tại"));
            Integer soLuongSP = gioHangChiTiet.getSanPhamChiTiet().getSoLuong();
            if(soLuong<=soLuongSP){
                gioHangChiTiet.setSoLuong(soLuong);
                gioHangChiTietRepo.save(gioHangChiTiet);

                return ResponseEntity.ok("Cập nhật thành công!");

            }else {

                gioHangChiTiet.setSoLuong(gioHangChiTiet.getSoLuong());
                gioHangChiTietRepo.save(gioHangChiTiet);
                return ResponseEntity.badRequest().body("Số lượng không  được  quá "+soLuongSP);

            }

    }



}
