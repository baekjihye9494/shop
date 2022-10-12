package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import service.DBUtil;
import vo.CustomerLogin;
import vo.EmployeeLogin;

public class LoginDto {
	public CustomerLogin customerLogin(CustomerLogin login) throws ClassNotFoundException, SQLException{
		CustomerLogin customer = null;
		
		String sql = "SELECT customer_id customerId, customer_name customerName FROM customer WHERE customer_id = ? AND customer_pass = PASSWORD(?)";
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			DBUtil dbUtil = new DBUtil();
			conn = dbUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, login.getCustomerId());
			stmt.setString(2, login.getCustomerPass());
			rs = stmt.executeQuery();
			if(rs.next()) {
				customer = new CustomerLogin();
				customer.setCustomerId(rs.getString("customerId"));
				customer.setCustomerName(rs.getString("customerName"));
			}
		}finally {
			if(rs!=null)   {
				rs.close();
			}
			if(stmt!=null) {
				stmt.close();
			}
			if(conn!=null) {
				conn.close();
			}
		}
		
		return customer;	
	}
	
	public EmployeeLogin employeeLogin(EmployeeLogin login) throws ClassNotFoundException, SQLException{
		EmployeeLogin employee = null;
		
		String sql = "SELECT employee_id employeeId, employee_name employeeName FROM employee WHERE employee_id = ? AND employee_pass = PASSWORD(?)";
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			DBUtil dbUtil = new DBUtil();
			conn = dbUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, login.getEmployeeId());
			stmt.setString(2, login.getEmployeePass());
			rs = stmt.executeQuery();
			if(rs.next()) {
				employee = new EmployeeLogin();
				employee.setEmployeeId(rs.getString("employeeId"));
				employee.setEmployeeName(rs.getString("employeeName"));
			}
		}finally {
			if(rs!=null)   {
				rs.close();
			}
			if(stmt!=null) {
				stmt.close();
			}
			if(conn!=null) {
				conn.close();
			}
		}
		
		return employee;	
	}
}