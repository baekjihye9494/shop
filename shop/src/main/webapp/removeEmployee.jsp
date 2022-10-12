<%@page import="service.EmployeeService"%>
<%@page import="vo.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
    
 	String employeeId = request.getParameter("employeeId");
	String employeePass = request.getParameter("employeePass");
 
 	Employee employee = new Employee();
 	employee.setEmployeeId(employeeId);
 	employee.setEmployeePass(employeePass);
 	
 	EmployeeService employeeservice = new EmployeeService();
 	employeeservice.removeEmployee(employee);
    
    response.sendRedirect(request.getContextPath()+"/loginForm.jsp") ;
%>