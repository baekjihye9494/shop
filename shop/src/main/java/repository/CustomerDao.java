package repository;
import java.sql.*;
import service.DBUtil;
import vo.Customer;

public class CustomerDao {
	//로그인
	
	public Customer selectCustomerByIdAndPw(Connection conn, Customer customer) throws Exception {
		// 리턴할 객체 초기화
		Customer loginCustomer = null;
		
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT customer_id customerId, customer_name customerName FROM customer WHERE customer_id = ? and customer_pass = PASSWORD(?)";
		
		
		stmt = conn.prepareStatement(sql);
		// stmt setter
		stmt.setString(1, customer.getCustomerId());
		stmt.setString(2, customer.getCustomerPass());
		// 디버깅
		System.out.println("loginCustomer method stmt : " + stmt);
		rs = stmt.executeQuery();
		
		if(rs.next()) {
			// 쿼리가 실행됐다면 객체생성
			loginCustomer = new Customer();
			loginCustomer.setCustomerId(rs.getString("customerId"));
			loginCustomer.setCustomerName(rs.getString("customerName"));
			// 디버깅
			System.out.println("loginCustomer method customerId : " + loginCustomer.getCustomerId());
			System.out.println("loginCustomer method customerName : " + loginCustomer.getCustomerName());
		}
		
		return loginCustomer;
	}

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