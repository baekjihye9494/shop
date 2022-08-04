package service;

import java.sql.Connection;
import java.sql.SQLException;

import repository.CustomerDao;
import repository.OutIdDao;
import vo.Customer;
import vo.CustomerLogin;

public class CustomerService {
	
	//회원 로그인 메서두
	public Customer getCustomerByIdAndPw(Customer paramCustomer) throws Exception {
		// 객체 초기화
		Connection conn = null;
		Customer customer = null;
		
		try {
			// conn 메서드실행할 객체생성
			DBUtil dbUtil = new DBUtil();
			conn = dbUtil.getConnection();
			
			CustomerDao customerDao = new CustomerDao();
			customer = customerDao.selectCustomerByIdAndPw(conn, paramCustomer);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return customer;
	}

		
		
	// 회원탈퇴 메서드
	public boolean removeCustomer(Customer paramCustomer) {
		
		Connection conn = null;
		try {
			conn = new DBUtil().getConnection();
			conn.setAutoCommit(false); // executeUpdate()실행시 자동커밋막기
			
			CustomerDao customerDao = new CustomerDao();
			if(customerDao.deleteCustomer(conn, paramCustomer) !=1) {
				throw new Exception();
			}
			OutIdDao OutIdDao = new OutIdDao();
			if(OutIdDao.insertOutId(conn, paramCustomer.getCustomerId()) != 1) {
				throw new Exception(); // 일부로 예외처리를 발생시킴 
			}
			conn.commit();
		} catch (Exception e) {
			e.printStackTrace(); // console에 예외메세지 출력
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			return false; // 탈퇴 실패
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return true; // 탈퇴 성공
	}
}