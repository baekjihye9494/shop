package com.gd.shop.vo;

import lombok.Data;

@Data
public class Orders { //주문
	
	private int orderNo; 
	private int goodsNo;
	private String customerId;
	private int orderQuantity;
	private int orderPrice;
	private String orderAddress;
	private String orderState;
	private int createDate;
	private int updataDate;
	

}
