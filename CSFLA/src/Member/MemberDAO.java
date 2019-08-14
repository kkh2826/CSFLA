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
			String query = "select ���̵� from ȸ�� where ���̵� = ?";
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
			String query = "insert into ȸ�� (���̵�, ��й�ȣ, �̸�, �̸���, ��ȭ��ȣ) values (?,?,?,?,?)";
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
			String query = "select ��й�ȣ from ȸ�� where ���̵� = ?";
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, id);
			resultSet = pstmt.executeQuery();
			
			if(resultSet.next()) {
				String subPw = resultSet.getString("��й�ȣ");
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
			String query = "select * from ȸ�� where ���̵� = ?";
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, id);
			resultSet = pstmt.executeQuery();
			if(resultSet.next()) {
				dto = new MemberDTO();
				dto.setId(resultSet.getString("���̵�"));
				dto.setPw(resultSet.getString("��й�ȣ"));
				dto.setName(resultSet.getString("�̸�"));
				dto.setEmail(resultSet.getString("�̸���"));
				dto.setPhoneNum(resultSet.getString("��ȭ��ȣ"));
				dto.setGrade(resultSet.getString("���"));
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
			String query = "update ȸ�� set ��й�ȣ=?, �̸�=?, �̸���=?, ��ȭ��ȣ=? where ���̵�=?";
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
