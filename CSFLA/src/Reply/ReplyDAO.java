package Reply;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ReplyDAO {
   DataSource dataSource;
   
   public ReplyDAO() {
      try {
         Context context = new InitialContext();
         dataSource = (DataSource)context.lookup("java:comp/env/jdbc/testdb");
      }catch(Exception e) {
         System.out.println( e.getMessage() );
         e.printStackTrace();
      }
   }
   
   
   public ArrayList<ReplyDTO> getList(int contentNum) {
		ArrayList<ReplyDTO> list = new ArrayList<ReplyDTO>();
		ReplyDTO dto = null;
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "select ���ǻ��״��.* from ���ǻ��״��, ���ǻ��� where ���ǻ��״��.���ǹ�ȣ=���ǻ���.���ǹ�ȣ and ���ǻ��״��.���ǹ�ȣ=? and ���ǻ��״��.�θ��ۼ��� is null";
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, contentNum);
			resultSet = pstmt.executeQuery();
			
			while ( resultSet.next() ) {
				dto = new ReplyDTO();
				dto.setId(resultSet.getString("���̵�"));;
				dto.setContent(resultSet.getString("����"));
				dto.setReplyDate(resultSet.getTimestamp("��¥"));
				dto.setCommentNum(resultSet.getInt("��۱���"));
				
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
   
   public ArrayList<ReplyDTO> getList2(int contentNum, int commentNum) throws SQLException {
		ArrayList<ReplyDTO> list = new ArrayList<ReplyDTO>();
		ReplyDTO dto = null;
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "select ���ǻ��״��.* from ���ǻ��״��, ���ǻ��� where ���ǻ��״��.���ǹ�ȣ=���ǻ���.���ǹ�ȣ and ���ǻ��״��.���ǹ�ȣ = ? and ���ǻ��״��.��۱���=? and ���ǻ��״��.�θ��ۼ��� is not null";
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, contentNum);
			pstmt.setInt(2, commentNum);
			resultSet = pstmt.executeQuery();
			
			while ( resultSet.next() ) {
				dto = new ReplyDTO();
				dto.setContentNum(resultSet.getInt("���ǹ�ȣ"));
				dto.setId(resultSet.getString("���̵�"));;
				dto.setContent(resultSet.getString("����"));
				dto.setReplyDate(resultSet.getTimestamp("��¥"));
				dto.setParentId(resultSet.getString("�θ��ۼ���"));
				dto.setCommentNum(resultSet.getInt("��۱���"));
				
				list.add(dto);
			}
		} catch ( Exception e ) {
			System.out.println( e.getMessage() );
			e.printStackTrace();
		} finally {
			if ( connection != null ) connection.close();
			if ( pstmt != null ) pstmt.close();
			if ( resultSet != null ) resultSet.close();
		}
		return list;
	}
   
   public int insertReply(ReplyDTO dto2) {
		ReplyDTO dto = null;
		Connection connection = null;
		PreparedStatement pstmt = null;
		int res = 0;
		
		try {
			dto = new ReplyDTO();
			connection = dataSource.getConnection();
			String query = "insert into ���ǻ��״��(���̵�, ����, ���ǹ�ȣ, �θ��ۼ���, ��۱���) values (?, ?, ?, ?, ?)";
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, dto2.getId());
			pstmt.setString(2, dto2.getContent());
			pstmt.setInt(3, dto2.getContentNum());
			pstmt.setString(4, dto2.getParentId());
			pstmt.setInt(5, dto2.getCommentNum());
			
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
   
   
   public int removeReply(int num) {
		Connection connection = null;
		PreparedStatement pstmt = null;
		int res = 0;
		
		try {
			connection = dataSource.getConnection();
			String query = "delete from ���ǻ��״�� where ��۹�ȣ=?";
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
   
   public ArrayList<ReplyDTO> ideaCommentGetList(int contentNum) {
	      ArrayList<ReplyDTO> list = new ArrayList<ReplyDTO>();
	      ReplyDTO dto = null;
	      Connection connection = null;
	      PreparedStatement pstmt = null;
	      ResultSet resultSet = null;
	      
	      try {
	         connection = dataSource.getConnection();
	         String query = "select ���̵����.* from ���̵����, ���̵����� where ���̵����.�ۼ���ȣ=���̵�����.�ۼ���ȣ and ���̵����.�ۼ���ȣ=? and ���̵����.�θ��ۼ��� is null";
	         pstmt = connection.prepareStatement(query);
	         pstmt.setInt(1, contentNum);
	         resultSet = pstmt.executeQuery();
	         
	         while ( resultSet.next() ) {
	            dto = new ReplyDTO();
	            dto.setContentNum(resultSet.getInt("�ۼ���ȣ"));
	            dto.setId(resultSet.getString("���̵�"));;
	            dto.setContent(resultSet.getString("����"));
	            dto.setReplyDate(resultSet.getTimestamp("��¥"));
	            dto.setCommentNum(resultSet.getInt("��۱���"));
	            
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
	   
	   public ArrayList<ReplyDTO> ideaCommentGetList2(int contentNum, int commentNum) throws SQLException {
	      ArrayList<ReplyDTO> list = new ArrayList<ReplyDTO>();
	      ReplyDTO dto = null;
	      Connection connection = null;
	      PreparedStatement pstmt = null;
	      ResultSet resultSet = null;
	      
	      try {
	         connection = dataSource.getConnection();
	         String query = "select ���̵����.* from ���̵����, ���̵����� where ���̵����.�ۼ���ȣ=���̵�����.�ۼ���ȣ and ���̵����.�ۼ���ȣ=? and ���̵����.��۱���=? and ���̵����.�θ��ۼ��� is not null";
	         pstmt = connection.prepareStatement(query);
	         pstmt.setInt(1, contentNum);
	         pstmt.setInt(2, commentNum);
	         resultSet = pstmt.executeQuery();
	         
	         while ( resultSet.next() ) {
	            dto = new ReplyDTO();
	            dto.setContentNum(resultSet.getInt("�ۼ���ȣ"));
	            dto.setId(resultSet.getString("���̵�"));;
	            dto.setContent(resultSet.getString("����"));
	            dto.setReplyDate(resultSet.getTimestamp("��¥"));
	            dto.setParentId(resultSet.getString("�θ��ۼ���"));
	            dto.setCommentNum(resultSet.getInt("��۱���"));
	            
	            list.add(dto);
	         }
	      } catch ( Exception e ) {
	         System.out.println( e.getMessage() );
	         e.printStackTrace();
	      } finally {
	         if ( connection != null ) connection.close();
	         if ( pstmt != null ) pstmt.close();
	         if ( resultSet != null ) resultSet.close();
	      }
	      return list;
	   }
	   
	   public int ideaInsertReply(ReplyDTO dto2) {
	      ReplyDTO dto = null;
	      Connection connection = null;
	      PreparedStatement pstmt = null;
	      int res = 0;
	      
	      try {
	         dto = new ReplyDTO();
	         connection = dataSource.getConnection();
	         String query = "insert into ���̵����(���̵�, ����, �ۼ���ȣ, �θ��ۼ���, ��۱���) values (?, ?, ?, ?, ?)";
	         pstmt = connection.prepareStatement(query);
	         
	         pstmt.setString(1, dto2.getId());
	         pstmt.setString(2, dto2.getContent());
	         pstmt.setInt(3, dto2.getContentNum());
	         pstmt.setString(4, dto2.getParentId());
	         pstmt.setInt(5, dto2.getCommentNum());
	         
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
	   
	   public int ideaRemoveReply(int num) {
	      Connection connection = null;
	      PreparedStatement pstmt = null;
	      int res = 0;
	      
	      try {
	         connection = dataSource.getConnection();
	         String query = "delete from ���̵���� where ��۹�ȣ=?";
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
