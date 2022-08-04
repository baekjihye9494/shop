<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.CustomerLogin"%>
<%
	if(session.getAttribute("id") == null){
		response.sendRedirect(request.getContextPath() + "/theme/loginForm.jsp?errorMsg=Not logged in");
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

	<%=session.getAttribute("user")%> <!-- 테이블의 customer / employee -->
	<br>
	<%=session.getAttribute("id")%>   <!-- 로그인 아이디 -->
	<br>
	<%=session.getAttribute("name")%>   <!-- 로그인 이름 -->

	<div class="container-fluid text-center">
		<div class="jumbotron text-center">
			<h3><%=session.getAttribute("name")%> : <%=session.getAttribute("user")%>님 반갑습니다.</h3>
		</div>
		<div class="form-control">
			<p>ID : <%=session.getAttribute("id")%></p>   <!-- 로그인 아이디 -->
			<a href="./loginOne.jsp" class="btn btn-dark">회원정보</a>
			<a href="<%=request.getContextPath()%>/logout.jsp" class="btn btn-dark">로그아웃</a>
		</div>
	</div>
</body>
</html> 