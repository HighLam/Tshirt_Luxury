package com.example.tshirt_luxury_datn.dto;

import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

@Getter
@Setter
public class OrderItemDTO {
  private Long id;
  private Long productDetailId;
  private String productName;
  private String sizeName;
  private String colorName;
  private String colorCode;
  private String productImage;
  private Integer quantity;
  private BigDecimal price;
  private BigDecimal totalPrice;

}
