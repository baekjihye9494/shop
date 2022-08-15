<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="service.*" %>
<%
	int goodsNo = Integer.parseInt(request.getParameter("goodsNo"));
	String soldOut = request.getParameter("soldOut");
	
	System.out.println(goodsNo);
	System.out.println(soldOut);
	
	Goods goods = new Goods();
	GoodsService goodsService = new GoodsService();
	
	goods.setGoodsNo(goodsNo);
	goods.setSoldOut(soldOut);
	
	boolean result = goodsService.modifyGoodsSoldOut(goods);
	
	if(result) {
		response.sendRedirect(request.getContextPath() + "/admin/adminGoodsList.jsp");
		System.out.println("성공");
	} else {
		response.sendRedirect(request.getContextPath() + "/admin/adminGoodsList.jsp");
		System.out.println("실패");
	}
%>