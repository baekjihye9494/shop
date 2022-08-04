package repository;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;



public class OutIdDao {
	// 탈퇴 회원의 아이디를 입력
	// CustomerService.removeCustomer(Customer paramCustomer)가 호출 
	public int insertOutId(Connection conn, String customerId)  throws SQLException, ClassNotFoundException {

		int row = 0;
		
		String sql = "insert into outid (out_id, out_date) values (?, now())";
		PreparedStatement stmt = null;
		
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, customerId);
		row = stmt.executeUpdate();
		
		return row;
	}
}