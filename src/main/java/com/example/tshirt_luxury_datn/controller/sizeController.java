package com.example.tshirt_luxury_datn.controller;

import com.example.tshirt_luxury_datn.repository.sizeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Date;

@Controller
public class sizeController {

    @Autowired
    sizeRepository sizeRepository;

    public String generateMaSize() {
        // Lấy mã hóa đơn lớn nhất từ cơ sở dữ liệu
        String lastMaSize = sizeRepository.findLastMaSize(); // Giả sử phương thức này trả về "HD005"

        int nextNumber = 1; // Số bắt đầu nếu không có hóa đơn nào
        if (lastMaSize != null && lastMaSize.startsWith("S")) {
            // Lấy phần số từ mã hóa đơn cuối cùng
            String numberPart = lastMaSize.substring(2); // Bỏ "HD"
            nextNumber = Integer.parseInt(numberPart) + 1;
        }

        // Format mã hóa đơn mới với 3 chữ số (HD001, HD002, ...)
        return String.format("S%03d", nextNumber);
    }

    boolean validateAdd( Size size, RedirectAttributes redirectAttributes) {

        if (size.getTenSize() == null || size.getTenSize().isEmpty()) {
            String message = "Vui lòng nhập tên size !";
            redirectAttributes.addFlashAttribute("errorTenSize", message);
            redirectAttributes.addFlashAttribute("openModal", "themSize");
            return false;
        } else {
            redirectAttributes.addFlashAttribute("tenSize", size.getTenSize());
        }
        return true;
    }

    @GetMapping("t-shirt-luxury/admin/size")
    public String sizeHienThi(Model model) {
        model.addAttribute("size", sizeRepository.findAll());
        return "size/size";
    }

    @GetMapping("t-shirt-luxury/admin/size/delete")
    public String sizeDelete(@RequestParam("id") Integer id) {
        sizeRepository.deleteById(id);
        return "redirect:/t-shirt-luxury/admin/size";
    }

    @PostMapping("t-shirt-luxury/admin/size/add")
    public String sizeAdd(@ModelAttribute("size") Size size, RedirectAttributes redirectAttributes) {
        if(validateAdd(size, redirectAttributes)) {
            size.setMaSize(generateMaSize());
            size.setNgayTao(new Date());
            size.setNgaySua(new Date());
            sizeRepository.save(size);
        }
        return "redirect:/t-shirt-luxury/admin/size";
    }

    @GetMapping("t-shirt-luxury/admin/size/getOne")
    public String getOneSize(@RequestParam(name = "id") Integer id, Model model) {

        Size size = sizeRepository.getOne(id);
        model.addAttribute("size", size);
        return "size/sua-size";
    }


    @PostMapping("t-shirt-luxury/admin/size/update")
    public String updateSize(@RequestParam("id") Integer id,
                             @RequestParam("tenSize") String tenSize,
                             @ModelAttribute("size") Size size, RedirectAttributes redirectAttributes) {
        Size getOne = sizeRepository.getReferenceById(id);
        if (getOne.getId() == id) {
        if(tenSize == null || tenSize.isEmpty()) {

            String message = "Vui lòng nhập tên size !";
            redirectAttributes.addFlashAttribute("errorTenSize", message);
            return "redirect:/t-shirt-luxury/admin/size/getOne?id=" + id;
        }else {

                Date ngaySua = new Date();
                size.setId(id);
                size.setNgaySua(ngaySua);
                size.setNgayTao(getOne.getNgayTao());
                sizeRepository.save(size);
            }
        }

        return "redirect:/t-shirt-luxury/admin/size";
    }
}
