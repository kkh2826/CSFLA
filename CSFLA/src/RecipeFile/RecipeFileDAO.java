package RecipeFile;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import Recipe.RecipeDTO;

public class RecipeFileDAO {
	DataSource dataSource;
	public static final int SHARE_RECIPE_OK = 1;
	
	public RecipeFileDAO() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/testdb");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int insertRecipeFile(String writer, String recipeFileName, String recipeFileType, int recipeNum) {
		int res = 0;
		Connection connection = null;
		PreparedStatement pstmt = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "insert into 파일업로드(아이디, 파일이름, 파일형태, 작성번호) values (?,?,?,?)";
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, writer);
			pstmt.setString(2, recipeFileName);
			pstmt.setString(3, recipeFileType);
			pstmt.setInt(4, recipeNum);
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
	
	public ArrayList<RecipeFileDTO> list(int recipeNum2) {
		ArrayList<RecipeFileDTO> dtos = new ArrayList<RecipeFileDTO>();
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "select * from 파일업로드 where 작성번호 = ?";
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, recipeNum2);
			resultSet = pstmt.executeQuery();
			while(resultSet.next()) {
				int recipeNum = resultSet.getInt("작성번호");
				String recipeFileName = resultSet.getString("파일이름");
				String recipeFileType = resultSet.getString("파일형태");
				String writer = resultSet.getString("아이디");
				int recipeUploadFileNum = resultSet.getInt("업로드번호");
				
				RecipeFileDTO dto = new  RecipeFileDTO(recipeNum, recipeFileName, recipeFileType, recipeUploadFileNum, writer);
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
}
