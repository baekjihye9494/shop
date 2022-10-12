<%@page import="service.SignService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String ckId = request.getParameter("ckId");


	SignService signserviace = new SignService();
	boolean result = signserviace.idCheck(ckId);
	
	//SERVICE 의 리턴값이 FALSE
	if(result) {
		

		response.sendRedirect(request.getContextPath()+"/addCustomer.jsp?ckId="+ckId);
        
      
				
	}else{

		response.sendRedirect(request.getContextPath()+"/addCustomer.jsp?errorMsg=bad ID");
		
	}
	
	
%>