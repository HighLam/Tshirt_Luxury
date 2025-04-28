package com.example.tshirt_luxury_datn.services;

import com.example.tshirt_luxury_datn.dto.ProductDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class DashboardService {
    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private UserRepository userRepository;

    public long getTotalProducts() {
        return productRepository.count();
    }

    public double getTotalRevenue() {
        return orderRepository.findAll().stream()
                .filter(order -> order.getStatus().equals(OrderStatus.SUCCESS))
                .mapToDouble(Order::getTotalAmount)
                .sum();
    }

    public long getTotalCustomers() {
        return userRepository.count();
    }

    public long getTotalOrders() {
        return orderRepository.count();
    }

    public Map<String, Long> getOrderStatusStats() {
        Map<String, Long> stats = new HashMap<>();
        stats.put("PENDING", orderRepository.countByStatus(OrderStatus.PENDING));
        stats.put("CONFIRMED", orderRepository.countByStatus(OrderStatus.CONFIRMED));
        stats.put("DELIVERING", orderRepository.countByStatus(OrderStatus.DELIVERING));
        stats.put("SUCCESS", orderRepository.countByStatus(OrderStatus.SUCCESS));
        stats.put("CANCELLED", orderRepository.countByStatus(OrderStatus.CANCELLED));
        stats.put("RETURNED", orderRepository.countByStatus(OrderStatus.RETURNED));
        return stats;
    }




    public List<Order> getRecentOrders() {
        return orderRepository.findTop5ByOrderByOrderDateDesc();
    }

    public List<ProductDTO> getBestSellingProductsSold(int limit) {
        List<Product> products = productRepository.findBestSellingProductsSimple(PageRequest.of(0, limit)).getContent();
        return products.stream().map(product -> {
            ProductDTO dto = new ProductDTO(product);
            Long totalQuantitySold = productRepository.findTotalQuantitySoldByProductId(product.getId());
            dto.setTotalQuantitySold(totalQuantitySold != null ? totalQuantitySold : 0L);
            return dto;
        }).collect(Collectors.toList());
    }

    // public List<Product> getTopSellingProducts() {
    // return productRepository.findTop5ByOrderItemsQuantity();
    // }
}


