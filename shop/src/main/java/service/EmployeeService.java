package service;

import java.sql.*;
import repository.*;
import vo.*;

public class EmployeeService {
	
	
	// 직원 로그인
	
	public Employee getEmployeeByIdAndPw(Employee paramEmployee) {
		// 객체 초기화
		Connection conn = null;
		Employee employee = null;
		
		try {
			// conn 메서드실행할 객체생성
			DBUtil dbUtil = new DBUtil();
			conn = dbUtil.getConnection();
			
			EmployeeDao employeeDao = new EmployeeDao();
			employee = employeeDao.selectEmployeeByIdAndPw(conn, paramEmployee);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			// DB자원해제
			try {
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return employee;
	}

	
	
	// 직원탈퇴 액션페이지에서 호출되는 메서드
	public boolean removeEmployee(Employee paramEmployee) {
		
		Connection conn = null;
		try {
			conn = new DBUtil().getConnection();
			conn.setAutoCommit(false); // executeUpdate()실행시 자동 커밋막기
			
			EmployeeDao employeeDao = new EmployeeDao();
			if(employeeDao.deleteEmployee(conn, paramEmployee) ==1) {
				throw new Exception();
			}
			OutIdDao OutIdDao = new OutIdDao();
			if(OutIdDao.insertOutId(conn, paramEmployee.getEmployeeId()) != 1) {
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