<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul>
		<li><a href="<%=request.getContextPath()%>/admin/adminIndex.jsp">사원관리</a></li>
		<li><a href="<%=request.getContextPath()%>/admin/adminGoodsList.jsp">상품관리</a></li><!-- 상품목록/등록/수정(품절)/삭제(장바구니, 주무니없는 경우) -->
		<li><a href="<%=request.getContextPath()%>/adminIndex.jsp">주문관리</a></li><!-- 주문목록 수정 -->
		<li><a href="<%=request.getContextPath()%>/adminIndex.jsp">고객관리</a></li><!-- 고객목록/강제탈퇴/비밀번호수정(전달구현x)-->
		<li><a href="<%=request.getContextPath()%>/adminIndex.jsp">공지관리</a></li><!-- 공지 CRUD -->
	
	</ul>
</body>
</html>