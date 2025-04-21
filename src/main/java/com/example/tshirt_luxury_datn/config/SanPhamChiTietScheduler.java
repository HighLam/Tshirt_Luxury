package com.example.tshirt_luxury_datn.config;

import com.example.tshirt_luxury_datn.entity.SanPhamChiTiet;
import com.example.tshirt_luxury_datn.repository.sanPhamChiTietAdminRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class SanPhamChiTietScheduler {
    @Autowired
    private sanPhamChiTietAdminRepository sanPhamChiTietAdminRepo;

    // Chạy mỗi 6s
    @Scheduled(fixedRate = 5000)
    public void updateSanPhamChiTietStatus() {
        // Lấy danh sách tất cả sản phẩm chi tiết
        List<SanPhamChiTiet> sanPhamChiTietList = sanPhamChiTietAdminRepo.findAll();

        for (SanPhamChiTiet sp : sanPhamChiTietList) {
            if (sp.getSoLuong() == 0) {
                sp.setTrangThai(0); // Cập nhật trạng thái về 0
                sanPhamChiTietAdminRepo.save(sp); // Lưu thay đổi
            }
        }
    }
}
