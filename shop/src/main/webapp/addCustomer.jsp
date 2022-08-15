<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div class="container text-center">
		<div class="jumbotron">
			<h3>Customer Sign-Up</h3>
		</div>
		
		<!-- id ck form -->
		<div>
			<form class="form-inline">
				<div class="form-group" style="width : 100%;">
					<table class="table table-bordered">
						<tr>
						<td style="width : 30%;">ID CHECK</td>
						<td>
							<input type="text" name="idck" id="idck" class="form-control primary" style="width: 67%;">
							<button type="button" id="idckBtn" class="btn btn-dark">아이디중복검사</button>
						</td>
					</table>
				</div>
			</form>
		</div>
		
		<!-- 고객가입 form -->
		<div>
			<form action="<%=request.getContextPath()%>/addCustomerAction.jsp" method="get" id="customerForm">
				<table class="table table-bordered">
					<tr>
						<td style="width : 30%;">Customer_Id</td>
						<td>
							<input type="text" name="customerId" id="customerId" 
								readonly="readonly" class="form-control">
						</td>
					</tr>
					<tr>
						<td style="width : 30%;">Customer_Pw</td>
						<td>
							<input type="password" name="customerPass" id="customerPass" class="form-control">
						</td>
					</tr>
					<tr>
						<td style="width : 30%;">Customer_Name</td>
						<td>
							<input type="text" name="customerName" id="customerName" class="form-control">
						</td>
					</tr>
					<tr>
						<td style="width : 30%;">Customer_Address</td>
						<td>
							<input type="text" name="customerAddress" id="customerAddress" class="form-control">
						</td>
					</tr>
					<tr>
						<td style="width : 30%;">Customer_Telephone</td>
						<td>
							<input type="text" name="customerTelephone" id="customerTelephone" class="form-control">
						</td>
					</tr>
				</table>
				<div style="margin-bottom: 20px; position: relative; left: 270px;">
					<button type="button" id="customerBtn" class="btn btn-dark">회원가입</button>
					<a href="loginForm.jsp" type="button" class="btn btn-dark">취소</a>
				</div>
			</form>
		</div>
	</div>	
</body>
<script>

	$('#idckBtn').click(function() {
		if($('#idck').val().length < 4 || $('#idck').val().length > 13) {
			alert('ID는 4자이상 13자 이하입니다.');
		} else {
			$.ajax({
				url : '/shop/idckController',
				type : 'post',
				data : {idck : $('#idck').val()},
				success : function(json) {
					if(json == 'y') {
						alert('사용가능한 아이디 입니다.');
						$('#customerId').val($('#idck').val());
					} else {
						alert('이미 사용중인 아이디 입니다.');
						$('#customerId').val('');
					}
				}
			});
		}
	});

	$('#customerBtn').click(function() {
		if($('#customerId').val() == '') {
			alert('중복검사를 진행해주세요');
			$("#idck").focus();
		} else if($('#customerPass').val() == '') {
			alert('고객비밀번호를 입력하세요');
			$("#customerPass").focus();
		} else if($('#customerName').val() == '') {
			alert('고객이름을 입력하세요');
			$("#customerName").focus();
		} else if($('#customerAddress').val() == '') {
			alert('고객주소를 입력하세요');
			$("#customerAddress").focus();
		} else if($('#customerTelephone').val() == '') {
			alert('고객전화번호를 입력하세요');
			$("#customerTelephone").focus();
		} else {
			customerForm.submit();
		}
	});
</script>
</html>