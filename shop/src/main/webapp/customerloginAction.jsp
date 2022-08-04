<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="repository.*" %>
<%@ page import="vo.*" %>
<%@ page import="service.CustomerService"%>
<%
	// 받아올 값 선언
	String customerId = request.getParameter("customerId");
	String customerPass = request.getParameter("customerPass");
	
	// 디버깅
	System.out.println("coutomerId : " + customerId);
	System.out.println("customerPass : " + customerPass);
	
		
	// 객체생성한곳에 setter 로 값 저장하기 
	Customer customer = new Customer();
	customer.setCustomerId(customerId);
	customer.setCustomerPass(customerPass);
	
	// 메서드 실행 객체생성
	CustomerService customerService = new CustomerService();
	Customer loginCustomer = new Customer();
	loginCustomer = customerService.getCustomerByIdAndPw(customer);
	
	
	// 디버깅
	if(loginCustomer == null){ // 로그인 실패
		System.out.println("login 실패");
	
		response.sendRedirect(request.getContextPath() + "/loginForm.jsp?errorMsg=fail");
	} else { // 로그인 성공
		// 세션에 setter로 로그인 한 정보 담기
		session.setAttribute("user", "고객");
		session.setAttribute("id", loginCustomer.getCustomerId());
		session.setAttribute("name", loginCustomer.getCustomerName());
		System.out.println("customer login 성공");		
		
		response.sendRedirect(request.getContextPath() + "/index.jsp");
	}
%>