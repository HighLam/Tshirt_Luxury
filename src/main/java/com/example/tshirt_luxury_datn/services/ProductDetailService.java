package com.example.tshirt_luxury_datn.services;

import com.example.tshirt_luxury_datn.dto.ProductDetailDTO;
import com.example.tshirt_luxury_datn.entity.ProductDetail;
import com.example.tshirt_luxury_datn.repository.ProductDetailRepository;
import com.example.tshirt_luxury_datn.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class ProductDetailService {
    @Autowired
    private ProductDetailRepository productDetailRepository;

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private SizeRepository sizeRepository;

    @Autowired
    private ColorRepository colorRepository;

    @Autowired
    private ImageService imageService;
    public List<ProductDetailDTO> getProductDetailsByProductCode(String productCode) {
        List<ProductDetail> productDetails = productDetailRepository.findByProductCode(productCode);
        return productDetails.stream()
                .map(ProductDetailDTO::new)
                .collect(Collectors.toList());
    }

    public List<ProductDetail> findByProductId(Long productId) {
        return productDetailRepository.findByProductIdAndStatusTrue(productId);
    }

    public List<ProductDetail> getProductDetailByProductId(Long productId) {
        List<ProductDetail> details = productDetailRepository.findByProduct_Id(productId);

        if (details.isEmpty()) {
            throw new RuntimeException("Không tìm thấy ProductDetail cho product_id = " + productId);
        }
        return details;
    }

    public List<ProductDetail> getProductDetailsByProductId(Long productId) {
        return productDetailRepository.findByProductId(productId);
    }

    public Page<ProductDetail> getAllProductDetail(Pageable pageable) {
        try {
            return productDetailRepository.findAll(pageable);
        } catch (Exception e) {
            throw new RuntimeException("ERROR WHEN GET ALL PRODUCT DETAIL: " + e.getMessage());
        }
    }

    public Page<ProductDetail> searchProductDetail(String code, Pageable pageable) {
        try {
            return productDetailRepository.findByCodeContainingIgnoreCase(code, pageable);
        } catch (Exception e) {
            throw new RuntimeException("ERROR WHEN SEARCH PRODUCT DETAIL: " + e.getMessage());
        }
    }

}
