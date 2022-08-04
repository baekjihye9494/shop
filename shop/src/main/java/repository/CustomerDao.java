package repository;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import service.DBUtil;
import vo.Customer;

public class CustomerDao {
	// 탈퇴
	// CustomerService.removeCustomer(Customer paramCustomer)가 호출 
	public int deleteCustomer(Connection conn, Customer paramCustomer) throws SQLException, ClassNotFoundException {

		int row= 0;
		
		String sql = "delete from customer where customer_id = ? and customer_pass = password(?)";	
		PreparedStatement stmt = null;
		stmt = conn.prepareStatement(sql);
		
		stmt.setString(1, paramCustomer.getCustomerId());
		stmt.setString(2, paramCustomer.getCustomerPass());
		
		row = stmt.executeUpdate();
		
		return row;
	}
}