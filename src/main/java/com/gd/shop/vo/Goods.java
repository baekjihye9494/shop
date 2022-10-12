package com.gd.shop.vo;

import lombok.Data;

@Data
public class Goods { //상품관련
	
	
	private int goodsNo;
	private String goodsName;
	private int goodsPrice;
	private String createDate;
	private String updateDate;
	private String soldOut;
	

}
