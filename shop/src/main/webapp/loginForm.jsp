<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
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
	<div class="container-fluid text-center">
		<div class="jumbotron">
			<h3>LOGIN</h3>
		</div>
		<div class="row">
		<div class="col-lg-6">
			<form action="<%=request.getContextPath()%>/customerloginAction.jsp" method="post" id="customerForm" class="form-control">
				<h4>회원전용</h4>
					<table class="table table-primary table-striped">
						<tr>
							<td>ID</td>
							<td><input type="text" name="customerId" id="customerId" class="form-control"></td>
						</tr>
						<tr>
							<td>PW</td>
							<td><input type="password" name="customerPass" id="customerPass" class="form-control"></td>
						</tr>
					</table>
					<button type="button" id="customerBtn" class="btn btn-dark">고객 로그인</button>
					<a type="button" class="btn btn-dark">고객회원가입</a>
			</form>
		</div>
			
		<div class="col-lg-6">
			<form action="<%=request.getContextPath()%>/employeeloginAction.jsp" method="post" id="employeeForm" class="form-control">
				<h4>직원전용</h4>
					<table class="table table-primary table-striped">
						<tr>
							<td>ID</td>
							<td><input type="text" name="employeeId" id="employeeId" class="form-control"></td>
						</tr>
						<tr>
							<td>PW</td>
							<td><input type="password" name="employeePass" id="employeePass" class="form-control"></td>
						</tr>
					</table>
					<button type="button" id="employeeBtn" class="btn btn-dark">스텝 로그인</button>
					<a type="button" class="btn btn-dark">직원회원가입</a>
			</form>
		</div>
		</div>
	</div>
</body>
<script>
	$('#customerBtn').click(function() {
		if($('#customerId').val() == '') {
			alert('고객아이디를 입력하세요');
		} else if($('#customerPass').val() == '') {
			alert('고객비밀번호를 입력하세요');
		} else {
			customerForm.submit();
		}
	});
	
	$('#employeeBtn').click(function() {
		if($('#employeeId').val() == '') {
			alert('스텝아이디를 입력하세요');
		} else if($('#employeePass').val() == '') {
			alert('스텝비밀번호를 입력하세요');
		} else {
			employeeForm.submit();
		}
	});
</script>
</html>