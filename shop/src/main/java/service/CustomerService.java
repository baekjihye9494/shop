package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import repository.CustomerDao;
import repository.OutIdDao;
import vo.Customer;

public class CustomerService {
	// Action.jsp에서 service를 호출하고 service에서 각 Dao에 있는 메서드를 호출
	// 회원가입 리스트
	
	
	// Action.jsp에서 service를 호출하고 service에서 각 Dao에 있는 메서드를 호출
	
		// insert
		public boolean addCustomer(Customer paramCustomer) {
			boolean result = true;
			Connection conn = null;
			
			try {
				conn = new DBUtil().getConnection();
				conn.setAutoCommit(false); // executeUpdate() 실행 시 자동 커밋을 막음
				
				CustomerDao customerDao = new CustomerDao(); 
				if(customerDao.insertCustomer(conn, paramCustomer) != 1) { // 쿼리문이 정상적으로 적용되었는지 확인 후 아닐 시 예외처리
					result = false;
					throw new Exception();
				}			
				conn.commit();		
			} catch (Exception e) {
				e.printStackTrace(); // console에 예외메세지 출력
				try {
					conn.rollback(); // 예외를 던지지말고 감싸야함
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			} finally {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			return result;
		}
		
		// delete
		public void removeCustomer(Customer paramCustomer) {		
			Connection conn = null;
			try {
				conn = new DBUtil().getConnection();
				conn.setAutoCommit(false); // executeUpdate() 실행 시 자동 커밋을 막음
				
				CustomerDao customerDao = new CustomerDao(); 
				if(customerDao.deleteCustomer(conn, paramCustomer) != 1) { // 쿼리문이 정상적으로 적용되었는지 확인 후 아닐 시 예외처리
					throw new Exception();
				}			
				
				OutIdDao outIdDao = new OutIdDao();
				if(outIdDao.insertOutId(conn, paramCustomer.getCustomerId()) != 1) { // 쿼리문이 정상적으로 적용되었는지 확인 후 아닐 시 예외처리
					throw new Exception();
				}
				
				conn.commit();		
			} catch (Exception e) {
				e.printStackTrace(); // console에 예외메세지 출력
				try {
					conn.rollback(); // 예외를 던지지말고 감싸야함
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			} finally {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		// login
		public Customer getCustomerByIdAndPw(Customer paramCustomer) {
			Connection conn = null;
			Customer customer = null;
			try {
				conn = new DBUtil().getConnection();
				conn.setAutoCommit(false); 
				// executeUpdate() 실행 시 자동 커밋을 막음
				
				CustomerDao customerDao = new CustomerDao();
				customer = customerDao.selectCustomerByIdAndPw(conn, paramCustomer);
				if(customer == null) { // 쿼리문이 정상적으로 적용되었는지 확인 후 아닐 시 예외처리
					throw new Exception();
				}
				customer = customerDao.selectCustomerByIdAndPw(conn, paramCustomer);
				
				conn.commit();		
			} catch (Exception e) {
				e.printStackTrace(); // console에 예외메세지 출력
				try {
					conn.rollback();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			} finally {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			return customer;		
		}
	}