package com.example.tshirt_luxury_datn.controller;

import com.example.tshirt_luxury_datn.entity.ChucVu;
import com.example.tshirt_luxury_datn.entity.NguoiDung;
import com.example.tshirt_luxury_datn.repository.chucVuRepository;
import com.example.tshirt_luxury_datn.repository.nguoiDungRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

@RequestMapping("/t-shirt-luxury/admin")
@Controller
public class nguoiDungController {
    @Autowired
    nguoiDungRepository nguoiDungRepository;
    @Autowired
    chucVuRepository cvuRepository;

    public String generateMaNguoiDung() {
        // Lấy mã hóa đơn lớn nhất từ cơ sở dữ liệu
        String lastMaNguoiDung = nguoiDungRepository.findLastMaNguoiDung(); // Giả sử phương thức này trả về "HD005"

        int nextNumber = 1; // Số bắt đầu nếu không có hóa đơn nào
        if (lastMaNguoiDung != null && lastMaNguoiDung.startsWith("ND")) {
            // Lấy phần số từ mã hóa đơn cuối cùng
            String numberPart = lastMaNguoiDung.substring(2); // Bỏ "HD"
            nextNumber = Integer.parseInt(numberPart) + 1;
        }

        // Format mã hóa đơn mới với 3 chữ số (HD001, HD002, ...)
        return String.format("ND%03d", nextNumber);
    }

    @ModelAttribute("listChucVu")
    public List<ChucVu> getListChucVu() {
        return cvuRepository.findAll();
    }

    @GetMapping("/nguoi-dung")
    public String nguoiDung(Model model, HttpSession session) {
        model.addAttribute("listNguoiDung", nguoiDungRepository.getNguoiDungNgayTao());
        return "NguoiDung/nguoi-dung-admin";
    }

    @PostMapping("/taoNguoiDung")
    public String addNguoiDung(NguoiDung nguoiDung) {
        nguoiDung.setMaNguoiDung(generateMaNguoiDung());
        nguoiDung.setNgayTao(new Date());
        nguoiDung.setNgaySua(new Date());

        nguoiDungRepository.save(nguoiDung);
        return "redirect:/t-shirt-luxury/admin/nguoi-dung";
    }

    @GetMapping("/xoaNguoiDung/{id}")
    public String deleteNguoiDung(@PathVariable(value = "id") Integer id) {
        nguoiDungRepository.deleteById(id);
        return "redirect:/t-shirt-luxury/admin/nguoi-dung";
    }

    @GetMapping("/getOne")
    public String getOneNguoiDung(@RequestParam(name = "id") Integer id, Model model) {

        // Lấy đối tượng người dùng theo ID
        NguoiDung nguoiDung = nguoiDungRepository.getOne(id);
        model.addAttribute("nguoiDung", nguoiDung);
        return "NguoiDung/sua-nguoi-dung";
    }

    @PostMapping("/updateNguoiDung")
    public String updateNguoiDung(@RequestParam("id") Integer id, @ModelAttribute("nguoiDung") NguoiDung nguoiDung) {
        NguoiDung getOne = nguoiDungRepository.getReferenceById(id);
        if (getOne.getId() == id) {
            Date ngaySua = new Date();
            nguoiDung.setId(id);
            nguoiDung.setNgaySua(ngaySua);
            nguoiDung.setNgayTao(getOne.getNgayTao());
            nguoiDungRepository.save(nguoiDung);
        }
        return "redirect:/t-shirt-luxury/admin/nguoi-dung";
    }
    @GetMapping("/timNguoiDung")
    public String timKiemNguoiDung(Model model,
                                   @RequestParam(value = "timKiemNguoiDung", required = false) String timKiemNguoiDung,
                                   @RequestParam(value = "idChucVu", required = false) Integer idChucVu) {
        List<NguoiDung> nguoiDungList;
        if (timKiemNguoiDung == null && idChucVu == null) {
            nguoiDungList = nguoiDungRepository.findAll();
        } else {
            nguoiDungList = nguoiDungRepository.timKiemND(timKiemNguoiDung, idChucVu);
        }
        model.addAttribute("listNguoiDung", nguoiDungList);
        return "NguoiDung/nguoi-dung-admin";
    }
}
