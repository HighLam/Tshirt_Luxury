package com.example.tshirt_luxury_datn.dto;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Setter
@Getter
public class DiscountDTO {

    private Long id;
    private String code;

    private Double percentage;
    private LocalDateTime startDate;
    private LocalDateTime endDate;

    private Boolean status = true;

}
