package com.example.tshirt_luxury_datn.services;

import com.example.tshirt_luxury_datn.entity.Product;
import com.example.tshirt_luxury_datn.repository.ProductDetailRepository;
import com.example.tshirt_luxury_datn.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductService {
    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private CategoryRepository categoryRepository;

    @Autowired
    private CategoryDetailRepository categoryDetailRepository;

    @Autowired
    private ProductDetailRepository productDetailRepository;
    public Product getProductById(Long id) {
        return productRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Không tìm thấy sản phẩm với ID: " + id));
    }

    public static String generateCode() {
        String randomPart;
        do {
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < 5; i++) {
                int randomIndex = random.nextInt(CHARACTERS.length());
                sb.append(CHARACTERS.charAt(randomIndex));
            }
            randomPart = sb.toString();
        } while (generatedCodes.contains(CODE_PREFIX + randomPart));

        String uniqueCode = CODE_PREFIX + randomPart;
        generatedCodes.add(uniqueCode);
        return uniqueCode;
    }
}
