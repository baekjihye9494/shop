package repository;
import java.sql.*;

import service.DBUtil;
import vo.Customer;
import vo.Employee;


public class EmployeeDao {
	//로그인
	///////////////////////////////////////////////////////////////////////// selectEmployeeByIdAndPw
	// EmployeeService가 호출
	public Employee selectEmployeeByIdAndPw(Connection conn, Employee employee) throws Exception {
		// 리턴할 객체 초기화
		Employee loginEmployee = null;
		
		// 객체 초기화
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT employee_id employeeId, employee_name employeeName FROM employee WHERE employee_id = ? and employee_pass = PASSWORD(?) and active = 'Y'";
		

		stmt = conn.prepareStatement(sql);
		// stmt setter
		stmt.setString(1, employee.getEmployeeId());
		stmt.setString(2, employee.getEmployeePass());
		// 디버깅
		System.out.println("stmt : " + stmt);
		rs = stmt.executeQuery();
		
		if(rs.next()) {
			// 쿼리가 실행됐다면 객체생성
			loginEmployee = new Employee();
			loginEmployee.setEmployeeId(rs.getString("employeeId"));
			loginEmployee.setEmployeeName(rs.getString("employeeName"));
			// 디버깅
			System.out.println("employeeId : " + loginEmployee.getEmployeeId());
			System.out.println("employeeName : " + loginEmployee.getEmployeeId());
		}
		
		
		return loginEmployee;
	}

	
	
	// 탈퇴
	// CustomerService.removeCustomer(Customer paramCustomer)가 호출 
	public int deleteEmployee(Connection conn, Employee paramEmployee) throws SQLException, ClassNotFoundException {

		int row= 0;
		
		String sql = "delete from customer where customer_id = ? and customer_pass = password(?)";	
		PreparedStatement stmt = null;
		stmt = conn.prepareStatement(sql);
		
		stmt.setString(1, paramEmployee.getEmployeeId());
		stmt.setString(2, paramEmployee.getEmployeePass());

		// 디버깅
		System.out.println("stmt : " + stmt);
		//쿼리 실행
		row = stmt.executeUpdate();
		
		return row;
	}
}