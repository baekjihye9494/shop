<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="service.*"%>
<%@ page import="vo.*"%>
<%	
	
	//페이징값
	int currentPage = 1;
	if (request.getParameter("currentPage") != null) {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	final int ROW_PER_PAGE = 10;
	
	EmployeeService employeeService = new EmployeeService();
	List<Employee> list = new ArrayList<Employee>();
	list = employeeService.getEmployeeList(ROW_PER_PAGE, currentPage);
	
	int lastPage = employeeService.getEmployeeLastPage(ROW_PER_PAGE);
	System.out.print("lastPage : " + lastPage);
	
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
<style>
	ul li {list-style-type: none; margin-bottom: 50px; margin-top: 50px;}
</style>
</head>
<body>
	<div class="container text-center">
		<div class="jumbotron text-center">
			<h1><%=session.getAttribute("user")%></h1>
			<h3>EMPLOYEE</h3>
		</div>
		<div style="margin-bottom: 20px; position: relative; left: 450px;">
			<a href="<%=request.getContextPath()%>/index.jsp" class="btn btn-dark">BACK</a>
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

					<li><a href="<%=request.getContextPath()%>/admin/adminOrdersList.jsp" class="btn btn-dark">주문관리</a></li>
					<!-- 주문목록 / 수정 -->

					<li><a href="<%=request.getContextPath()%>/admin/adminNoticeList.jsp" class="btn btn-dark">공지관리</a></li>
					<!-- 공지 CRUD -->
				</ul>
			</div>
			<div class="col-sm-10">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>EMPLOYEEID</th>
							<th>EMPLOYEENAME</th>
							<th>CREATEDATE</th>
							<th>EMPLOYEEACTIVE</th>
						</tr>
					</thead>
					<tbody>
					<%
						for(Employee e : list) {
					%>
							<tr>
								<td><%=e.getEmployeeId()%></td>
								<td><%=e.getEmployeeName()%></td>
								<td><%=e.getCreateDate()%></td>
								<td>
									<form action="<%=request.getContextPath()%>/admin/updateEmployeeActiveAction.jsp" method="post">
										<input type="hidden" name="employeeId" value="<%=e.getEmployeeId()%>">
										<select name="active">
											<%
												if(e.getActive().equals("N")) {
											%>
													<option value="Y">Y</option>
													<option value="N" selected="selected">N</option>
											<%
												} else {
											%>
													<option value="Y" selected="selected">Y</option>
													<option value="N">N</option>
											<%
												}
											%>
										</select>
									<button type="submit" class="btn btn-dark">권한변경</button>
									</form>
								</td>
							</tr>
					<%	
						}
					%>
				</table>
			</div>
		</div>
		<!-- 페이지 -->
		<div>
			<%
				if(currentPage > 1) {
			%>	
					<a href="<%=request.getContextPath()%>/admin/adminIndex.jsp?currentPage=<%=currentPage-1%>" class="btn btn-dark">이전</a>
			<%
				}
				if(currentPage < lastPage) {
			%>	
					<a href="<%=request.getContextPath()%>/admin/adminIndex.jsp?currentPage=<%=currentPage+1%>" class="btn btn-dark">다음</a>
			<%
				}
			%>
		</div>
		<!-- 페이지 -->
	</div>
</body>
</html> 