<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.CustomerLogin" %>
<%@ page import="model.LoginDto" %>
<%
	request.setCharacterEncoding("utf-8");
	
	String customerId = request.getParameter("customerId");
	String customerPass = request.getParameter("customerPass");
	System.out.println(customerId + " <-- id");
	System.out.println(customerPass + " <-- pw");
	
	CustomerLogin login = new CustomerLogin();
	LoginDto loginDto = new LoginDto();
	login.setCustomerId(customerId);
	login.setCustomerPass(customerPass);
	
	CustomerLogin customerLogin = new CustomerLogin();
	customerLogin = loginDto.customerLogin(login);
	
	session.setAttribute("loginCustomer", customerLogin);
	
	if(session.getAttribute("loginCustomer") == null) {
		response.sendRedirect(request.getContextPath() + "/loginForm.jsp?errorMsg=fail");
	} else {
		session.setAttribute("user", "고객");
		session.setAttribute("id", customerLogin.getCustomerId());
		session.setAttribute("name", customerLogin.getCustomerName());
		response.sendRedirect(request.getContextPath() + "/index.jsp");
	}
%> 