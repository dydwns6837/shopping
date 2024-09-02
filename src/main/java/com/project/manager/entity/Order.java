package com.project.manager.entity;

import lombok.Builder;
import lombok.Getter;

@Builder
@Getter
public class Order {
	private int id;
	private String userName;
	private String clothName;
	private String clothSize;
	private int clothCount;
	private String userAddress;
	private String clothStatus;
}
