package Require;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class RequireDAO {
	DataSource dataSource;
	public static final int REQUIRE_OK = 1;
	public static final int REQUIRE_UPDATE_OK = 1;
	public static final int REQUIRE_DELETE_OK = 1;
	public static final int REQUIRE_REPLY_OK = 1;
	
	public RequireDAO() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/testdb");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int insertRequire(RequireDTO dto2) {
	      RequireDTO dto = null;
	      Connection connection = null;
	      PreparedStatement pstmt = null;
	      int res = 0;
	      
	      try {
	         dto = new RequireDTO();
	         connection = dataSource.getConnection();
	         String query = "insert into 문의사항(제목, 아이디, 내용) values (?, ?, ?)";
	         pstmt = connection.prepareStatement(query);
	         
	         pstmt.setString(1, dto2.getRequireTitle());
	         pstmt.setString(2, dto2.getId());
	         pstmt.setString(3, dto2.getRequireContent());
	         
	         res = pstmt.executeUpdate();
	      } catch ( Exception e ) {
	         System.out.println( e.getMessage() );
	         e.printStackTrace();
	      } finally {
	         try {
	            if ( connection != null ) connection.close();
	            if ( pstmt != null ) pstmt.close();
	         } catch (SQLException e ) {
	            System.out.println( e.getMessage() );
	            e.printStackTrace();
	         }
	      }
	      return res;
	   } 
	
	public int getTotal() throws SQLException{
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "select count(*) from 문의사항";
			pstmt = connection.prepareStatement(query);
			resultSet = pstmt.executeQuery();
			resultSet.next();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return resultSet.getInt(1);
	}
	
	public ArrayList<RequireDTO> getList(int start, int end) { 
	      ArrayList<RequireDTO> list = new ArrayList<RequireDTO>();
	      RequireDTO dto = null;
	      Connection connection = null;
	      PreparedStatement pstmt = null;
	      ResultSet resultSet = null;
	      
	      try {
	         connection = dataSource.getConnection();
	         String query = "select * from 문의사항 where 문의번호 between ? and ?";
	         pstmt = connection.prepareStatement(query);
	         
	         pstmt.setInt(1, start);
	         pstmt.setInt(2, end);
	         resultSet = pstmt.executeQuery();
	         
	         while ( resultSet.next() ) {
	            dto = new RequireDTO();
	            dto.setRequireNum(resultSet.getInt("문의번호"));
	            dto.setRequireTitle(resultSet.getString("제목"));
	            dto.setId(resultSet.getString("아이디"));
	            dto.setRequireDate(resultSet.getTimestamp("날짜"));
	            dto.setRequireContent(resultSet.getString("내용"));
	            
	            list.add(dto);
	         }

	      } catch ( Exception e ) {
	         System.out.println( e.getMessage() );
	         e.printStackTrace();
	      } finally {
	         try {
	            if ( connection != null ) connection.close();
	            if ( pstmt != null ) pstmt.close();
	            if ( resultSet != null ) resultSet.close();
	         } catch ( SQLException e ) {
	            System.out.println( e.getMessage() );
	            e.printStackTrace();
	         }
	         
	      }
	      return list;
	   }
	
	public int removeRequire(int num) {
		Connection connection = null;
		PreparedStatement pstmt = null;
		int res = 0;
		
		try {
			connection = dataSource.getConnection();
			String query = "delete from 문의사항 where 문의번호=?";
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, num);
			res = pstmt.executeUpdate();

		} catch ( Exception e ) {
			System.out.println( e.getMessage() );
			e.printStackTrace();
		} finally {
			try {
				if ( connection != null ) connection.close();
				if ( pstmt != null ) pstmt.close();
			} catch ( SQLException e ) {
				System.out.println( e.getMessage() );
				e.printStackTrace();
			}
			
		}
		return res;
	}
	
	
}
