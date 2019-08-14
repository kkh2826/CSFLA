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
			String query = "select 문의사항댓글.* from 문의사항댓글, 문의사항 where 문의사항댓글.문의번호=문의사항.문의번호 and 문의사항댓글.문의번호=? and 문의사항댓글.부모작성자 is null";
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, contentNum);
			resultSet = pstmt.executeQuery();
			
			while ( resultSet.next() ) {
				dto = new ReplyDTO();
				dto.setId(resultSet.getString("아이디"));;
				dto.setContent(resultSet.getString("내용"));
				dto.setReplyDate(resultSet.getTimestamp("날짜"));
				dto.setCommentNum(resultSet.getInt("댓글구분"));
				
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
			String query = "select 문의사항댓글.* from 문의사항댓글, 문의사항 where 문의사항댓글.문의번호=문의사항.문의번호 and 문의사항댓글.문의번호 = ? and 문의사항댓글.댓글구분=? and 문의사항댓글.부모작성자 is not null";
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, contentNum);
			pstmt.setInt(2, commentNum);
			resultSet = pstmt.executeQuery();
			
			while ( resultSet.next() ) {
				dto = new ReplyDTO();
				dto.setContentNum(resultSet.getInt("문의번호"));
				dto.setId(resultSet.getString("아이디"));;
				dto.setContent(resultSet.getString("내용"));
				dto.setReplyDate(resultSet.getTimestamp("날짜"));
				dto.setParentId(resultSet.getString("부모작성자"));
				dto.setCommentNum(resultSet.getInt("댓글구분"));
				
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
			String query = "insert into 문의사항댓글(아이디, 내용, 문의번호, 부모작성자, 댓글구분) values (?, ?, ?, ?, ?)";
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
			String query = "delete from 문의사항댓글 where 댓글번호=?";
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
	         String query = "select 아이디어댓글.* from 아이디어댓글, 아이디어공간 where 아이디어댓글.작성번호=아이디어공간.작성번호 and 아이디어댓글.작성번호=? and 아이디어댓글.부모작성자 is null";
	         pstmt = connection.prepareStatement(query);
	         pstmt.setInt(1, contentNum);
	         resultSet = pstmt.executeQuery();
	         
	         while ( resultSet.next() ) {
	            dto = new ReplyDTO();
	            dto.setContentNum(resultSet.getInt("작성번호"));
	            dto.setId(resultSet.getString("아이디"));;
	            dto.setContent(resultSet.getString("내용"));
	            dto.setReplyDate(resultSet.getTimestamp("날짜"));
	            dto.setCommentNum(resultSet.getInt("댓글구분"));
	            
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
	         String query = "select 아이디어댓글.* from 아이디어댓글, 아이디어공간 where 아이디어댓글.작성번호=아이디어공간.작성번호 and 아이디어댓글.작성번호=? and 아이디어댓글.댓글구분=? and 아이디어댓글.부모작성자 is not null";
	         pstmt = connection.prepareStatement(query);
	         pstmt.setInt(1, contentNum);
	         pstmt.setInt(2, commentNum);
	         resultSet = pstmt.executeQuery();
	         
	         while ( resultSet.next() ) {
	            dto = new ReplyDTO();
	            dto.setContentNum(resultSet.getInt("작성번호"));
	            dto.setId(resultSet.getString("아이디"));;
	            dto.setContent(resultSet.getString("내용"));
	            dto.setReplyDate(resultSet.getTimestamp("날짜"));
	            dto.setParentId(resultSet.getString("부모작성자"));
	            dto.setCommentNum(resultSet.getInt("댓글구분"));
	            
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
	         String query = "insert into 아이디어댓글(아이디, 내용, 작성번호, 부모작성자, 댓글구분) values (?, ?, ?, ?, ?)";
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
	         String query = "delete from 아이디어댓글 where 댓글번호=?";
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
