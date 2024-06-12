package com.project.basket.bo;

import lombok.Builder;
import lombok.Getter;

@Builder
@Getter
public class BasketDetail {
	private int id;
	private int userId;
	private int clothId;
	private String clothName;
	private String clothSize;
	private int clothCount;
	private int clothPrice;
	private String clothStatus;
}