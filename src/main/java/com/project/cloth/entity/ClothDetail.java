package com.project.cloth.entity;

import lombok.Builder;
import lombok.Getter;

@Builder
@Getter
public class ClothDetail {
	private int id;
	private String clothName; // 상품명
	private String clothImageUrl;
	private int clothId; // primary key
	private int clothPrice; // 상품 가격
	private String clothCategory;
}
