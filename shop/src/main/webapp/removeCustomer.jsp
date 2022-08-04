<%@page import="service.CustomerService"%>
<%@page import="vo.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
    
 	String customerId = request.getParameter("customerId");
	String customerPass = request.getParameter("customerPass");
 
 	Customer customer = new Customer();
 	customer.setCustomerId(customerId);
 	customer.setCustomerPass(customerPass);
 	
    CustomerService customerService = new CustomerService();
    customerService.removeCustomer(customer);
    
    response.sendRedirect(request.getContextPath()+"/loginForm.jsp") ;
%>