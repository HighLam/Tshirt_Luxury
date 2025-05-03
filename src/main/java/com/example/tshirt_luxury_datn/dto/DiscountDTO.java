package com.example.tshirt_luxury_datn.dto;

<<<<<<< HEAD
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

=======
import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;

>>>>>>> 73bd821021711de7ab3940a2fbe9fc20455ff7fb
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
