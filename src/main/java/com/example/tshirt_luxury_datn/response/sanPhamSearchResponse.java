package com.example.tshirt_luxury_datn.response;

import lombok.*;

@ToString
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor

public class sanPhamSearchResponse {
    private Integer id;
    private String tenSanPham;
    private Double gia;

    // Constructor phù hợp với các trường trong query
}
