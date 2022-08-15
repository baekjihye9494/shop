<%@page import="vo.Employee"%>
<%@page import="service.EmployeeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 막기
	if(session.getAttribute("id") == null){
   		response.sendRedirect(request.getContextPath() + "/loginForm.jsp?errorMsg=Not logged in");
   		return;
   	} else if(session.getAttribute("id") != null && "customer".equals((String)session.getAttribute("user"))) {
   		// 관리자가 아닌경우 막기
   		response.sendRedirect(request.getContextPath() + "/index.jsp?errorMsg=No permission");
   	}

	// 받을값
	String employeeId = request.getParameter("employeeId");
	String active = request.getParameter("active");
	// 디버깅
	System.out.println("employeeId : " + employeeId);
	System.out.println("active : " + active);
	
	// 메서드 실행할 객체생성
	Employee employee = new Employee();
	EmployeeService employeeService = new EmployeeService();
	employeeService.modifyEmployeeActive(employee);
	int row = 0;
	
	// 분기
	if(row == 1){ // 성공
		System.out.println("update 성공");
		// 재요청
		response.sendRedirect(request.getContextPath() + "/admin/employeeList.jsp");
	} else { // 실패
		System.out.println("updateActive.jsp update 실패");
		// 재요청
		response.sendRedirect(request.getContextPath() + "/admin/employeeList.jsp?errorMsg=active update Fail");
	}
%>	