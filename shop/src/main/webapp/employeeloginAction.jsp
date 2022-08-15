<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="repository.*" %>
<%@ page import="service.EmployeeService"%>
<%@ page import="vo.*" %>
<%
	// 받아올 값
	String employeeId = request.getParameter("employeeId");
	String employeePass = request.getParameter("employeePass");
	
	// 디버깅
	System.out.println("employeeId : " + employeeId);
	System.out.println("employeePass : " + employeePass);
	
		
	// 객체생성한곳에 setter 로 값 저장하기
	Employee employee = new Employee();
	employee.setEmployeeId(employeeId);
	employee.setEmployeePass(employeePass);
	
	// 메서드 실행 객체생성
	EmployeeService employeeService = new EmployeeService();
	Employee loginEmployee = new Employee();
	loginEmployee = employeeService.getEmployeeByIdAndPw(employee);
	
	
	// 디버깅
	if(loginEmployee == null){ // 로그인 실패
		System.out.println("login 실패");
		response.sendRedirect(request.getContextPath() + "/loginForm.jsp?errorMsg=Fail");
	} else { // 로그인 성공
		session.setAttribute("user", "직원");
		session.setAttribute("id", loginEmployee.getEmployeeId());
		session.setAttribute("name", loginEmployee.getEmployeeName());
		System.out.println("employee login 성공");
		response.sendRedirect(request.getContextPath() + "/admin/adminIndex.jsp");
	}
%>