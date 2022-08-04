
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.Customer"%>
<%	
	
	if (session.getAttribute("loginCustomer") == null && session.getAttribute("loginEmployee") == null) {
		response.sendRedirect(request.getContextPath() + "/loginForm.jsp");
		System.out.println("없음");
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
			<p>ID : <%=session.getAttribute("id")%> </p>   <!-- 로그인 아이디 -->
		</div>
		<div class="container-fluid text-center">	
			<form method="post" action="<%=request.getContextPath()%>/removeCustomer.jsp">
				<table>	
					<tr>
						<td>비밀번호</td>
						<td><input type="hidden" name="id" value="<%=session.getAttribute("id")%>" readonly="readonly">
						<td><input type="password" name="pw" value =""></td>
					</tr>
				</table>
				<button type= "submit" class="btn btn-dark">회원탈퇴</button>
			</form>			
		</div>
	</div>
</body>
</html> 