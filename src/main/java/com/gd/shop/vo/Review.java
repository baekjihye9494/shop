package com.gd.shop.vo;

import lombok.Data;

@Data
public class Review { //리뷰

	private int reviewNo;
	private int orderNo;
	private String reviewContent;
	private int reviewLevel;
	private String createDate;
	
	
	
}
