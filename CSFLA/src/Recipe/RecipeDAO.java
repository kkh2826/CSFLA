package Recipe;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class RecipeDAO {
	DataSource dataSource;
	public static final int SHARE_RECIPE_OK = 1;
	
	public RecipeDAO() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/testdb");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int insertRecipe(String recipeTitle, String writer, String recipeContent) {
		int res = 0;
		Connection connection = null;
		PreparedStatement pstmt = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "insert into ���̵�����(����, ���̵�, ����) values (?,?,?)";
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, recipeTitle);
			pstmt.setString(2, writer);
			pstmt.setString(3, recipeContent);
			res = pstmt.executeUpdate();
			res = SHARE_RECIPE_OK;
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
	
	public int getRecipeNum() {
		int res = 0;
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "select �ۼ���ȣ from ���̵����� order by ��¥ desc limit 1";
			pstmt = connection.prepareStatement(query);
			resultSet = pstmt.executeQuery();
			if(resultSet.next()) {
				res = resultSet.getInt("�ۼ���ȣ");
			}
		
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
	
	public ArrayList<RecipeDTO> listRecipe() {
		ArrayList<RecipeDTO> dtos = new ArrayList<RecipeDTO>();
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "select * from ���̵����� order by �ۼ���ȣ desc";
			pstmt = connection.prepareStatement(query);
			resultSet = pstmt.executeQuery();
			while(resultSet.next()) {
				int recipeNum = resultSet.getInt("�ۼ���ȣ");
				String recipeTitle = resultSet.getString("����");
				String writer = resultSet.getString("���̵�");
				Timestamp recipeDate = resultSet.getTimestamp("��¥");
				String recipeContent = resultSet.getString("����");
				
				RecipeDTO dto = new  RecipeDTO(recipeNum, recipeTitle, writer, recipeDate, recipeContent);
				dtos.add(dto);
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
		return dtos;
	}
	
	public RecipeDTO getRecipe(int num) {
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		RecipeDTO dto = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "select * from ���̵����� where �ۼ���ȣ = ?";
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, num);
			resultSet = pstmt.executeQuery();
			
			if(resultSet.next()) {
				int recipeNum = resultSet.getInt("�ۼ���ȣ");
				String recipeTitle = resultSet.getString("����");
				String writer = resultSet.getString("���̵�");
				Timestamp recipeDate = resultSet.getTimestamp("��¥");
				String recipeContent = resultSet.getString("����");
				
				dto = new RecipeDTO(recipeNum, recipeTitle, writer, recipeDate, recipeContent);
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
	
	public int removeRecipe(int num) {
	      Connection connection = null;
	      PreparedStatement pstmt = null;
	      int res = 0;

	      try {
	         connection = dataSource.getConnection();
	         String query = "delete from ���̵����� where �ۼ���ȣ=?";
	         pstmt = connection.prepareStatement(query);
	         pstmt.setInt(1, num);
	         
	         res = pstmt.executeUpdate();
	      }catch(Exception e) {
	         System.out.println( e.getMessage() );
	         e.printStackTrace();
	      }finally {
	         try {
	            if(pstmt != null) pstmt.close();
	            if(connection != null) connection.close();
	         }catch(Exception e) {
	            System.out.println( e.getMessage() );
	            e.printStackTrace();
	         }
	      }
	      return res;
	   }
	
}