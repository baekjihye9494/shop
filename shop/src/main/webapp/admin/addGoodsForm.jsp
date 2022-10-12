<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<style>
	ul li {list-style-type: none; margin-bottom: 50px; margin-top: 50px;}
</style>
</head>
<body>
	<div class="container text-center">
		<div class="jumbotron text-center">
			<h1><%=session.getAttribute("user")%></h1>
			<h3>GOODS</h3>
		</div>
		<div style="margin-bottom: 20px; position: relative; left: 450px;">
			<a href="<%=request.getContextPath()%>/index.jsp" class="btn btn-dark">HOME</a>
			<a href="<%=request.getContextPath()%>/logout.jsp" class="btn btn-dark">LOGOUT</a>
		</div>
		<div class="row">
			<div class="col-sm-2">
				<ul>
					<li><a href="<%=request.getContextPath()%>/admin/adminIndex.jsp" class="btn btn-dark">사원관리</a></li>

					<li><a href="<%=request.getContextPath()%>/admin/adminGoodsList.jsp" class="btn btn-dark">상품관리</a></li>
					<!-- 상품목록 / 동록 / 수정(품절) / 삭제(장바구니, 주문이 없는 경우) -->

					<li><a href="<%=request.getContextPath()%>/admin/adminCustomerList.jsp" class="btn btn-dark">고객관리</a></li>
					<!-- 고객목록 / 강제탈퇴 / 비번수정(전달구현 x) -->

					<li><a href="<%=request.getContextPath()%>/admin/adminOrderList.jsp" class="btn btn-dark">주문관리</a></li>
					<!-- 주문목록 / 수정 -->

					<li><a href="<%=request.getContextPath()%>/admin/adminNoticeList.jsp" class="btn btn-dark">공지관리</a></li>
					<!-- 공지 CRUD -->
				</ul>
			</div>		
			<div class="col-sm-10">
				<form action="<%=request.getContextPath()%>/admin/addGoodsAction.jsp" 
		 			  method="post" enctype="multipart/form-data">
					<table class="table table-bordered">
						<tr>
							<th>NAME</th>
							<td>
								<input type="text" name="goodsName" class="form-control">
							</td>
						</tr>
						<tr>
							<th>PRICE (원)</th>
							<td><input type="text" name="goodsPrice" class="form-control"></td>
						</tr>
						<tr>
							<th>SOLDOUT</th>
							<td>
								<select name="soldOut">
									<option value="N">N</option>
									<option value="Y">Y</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>IMAGE</th>
							<td>
								<div class="custom-file">
									<input type="file" name="imgFile" class="file-input">
								</div>
							</td>
						</tr>
					</table>
					<div style="margin-bottom: 20px; position: relative; left: 350px;">
						<button type="submit" class="btn btn-dark">UPDATE</button>
						<a href="<%=request.getContextPath()%>/admin/adminGoodsList.jsp" class="btn btn-dark">CANCEL</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html> 