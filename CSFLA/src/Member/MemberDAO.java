package Member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	DataSource dataSource;
	
	public static final int ID_EXISTENT = 0;
	public static final int ID_NONEXISTENT = 1;
	public static final int JOIN_OK = 1;
	public static final int LOGIN_OK = 1;
	public static final int LOGIN_FAIL = 0;
	public static final int NOT_MEMBER = -1;
	
	public MemberDAO() {
		
		
		try {
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/testdb");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public int checkId(String id) {
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		int res = 0;
		
		try {
			connection = dataSource.getConnection();
			String query = "select 아이디 from 회원 where 아이디 = ?";
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, id);
			resultSet = pstmt.executeQuery();
			if(resultSet.next()) {
				res = ID_EXISTENT;
			}else {
				res = ID_NONEXISTENT;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(resultSet != null) resultSet.close();
				if(pstmt != null) pstmt.close();
				if(connection != null) connection.close();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
		return res;
	}
	
	public int registerMem(MemberDTO dto) {
		Connection connection = null;
		PreparedStatement pstmt = null;
		int res = 0;
		
		try {
			connection = dataSource.getConnection();
			String query = "insert into 회원 (아이디, 비밀번호, 이름, 이메일, 전화번호) values (?,?,?,?,?)";
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getPhoneNum());
			pstmt.executeUpdate();
			res = JOIN_OK;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(connection != null) connection.close();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
		return res;
	}
	
	public int userCheck(String id, String pw) {
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		int res = 0;
		
		try {
			connection = dataSource.getConnection();
			String query = "select 비밀번호 from 회원 where 아이디 = ?";
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, id);
			resultSet = pstmt.executeQuery();
			
			if(resultSet.next()) {
				String subPw = resultSet.getString("비밀번호");
				if(subPw.equals(pw)) {
					res = LOGIN_OK;
				}else {
					res = LOGIN_FAIL;
				}
			} else {
				res = NOT_MEMBER;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(resultSet != null) resultSet.close();
				if(pstmt != null) pstmt.close();
				if(connection != null) connection.close();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
		return res;
	}
	
	public MemberDTO getMember(String id) {
		MemberDTO dto = null;
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "select * from 회원 where 아이디 = ?";
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, id);
			resultSet = pstmt.executeQuery();
			if(resultSet.next()) {
				dto = new MemberDTO();
				dto.setId(resultSet.getString("아이디"));
				dto.setPw(resultSet.getString("비밀번호"));
				dto.setName(resultSet.getString("이름"));
				dto.setEmail(resultSet.getString("이메일"));
				dto.setPhoneNum(resultSet.getString("전화번호"));
				dto.setGrade(resultSet.getString("등급"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(resultSet != null) resultSet.close();
				if(pstmt != null) pstmt.close();
				if(connection != null) connection.close();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
		return dto;
	}
	
	public int updateMember(MemberDTO dto) {
		int res = 0;
		Connection connection = null;
		PreparedStatement pstmt = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "update 회원 set 비밀번호=?, 이름=?, 이메일=?, 전화번호=? where 아이디=?";
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, dto.getPw());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getEmail());
			pstmt.setString(4, dto.getPhoneNum());
			pstmt.setString(5, dto.getId());
			res = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(connection != null) connection.close();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
		return res;
	}
}
