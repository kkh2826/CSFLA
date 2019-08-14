package Food;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class FoodDAO {
	DataSource dataSource;

	public FoodDAO() {
		
		try {
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/testdb");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<FoodDTO> mainListFood(){
		ArrayList<FoodDTO> list = new ArrayList<FoodDTO>();
		FoodDTO dto = null;
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "select distinct 음식.음식번호, 음식.음식명, 음식.사진, 편의점물품.판매사 from 음식, 편의점물품, 제조방법 where 음식.음식번호=제조방법.음식번호 and 제조방법.물품번호=편의점물품.물품번호 ";
			pstmt = connection.prepareStatement(query);
			resultSet = pstmt.executeQuery();
			while(resultSet.next()) {
				dto = new FoodDTO();
				dto.setFoodNum(resultSet.getInt("음식.음식번호"));
				dto.setFoodName(resultSet.getString("음식.음식명"));
				dto.setFoodImage(resultSet.getString("음식.사진"));
				dto.setBrandName(resultSet.getString("편의점물품.판매사"));
				
				list.add(dto);
				
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
		return list;
	}
	
	public FoodDTO getFoodInfo(int num){
		FoodDTO dto = null;
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "select 음식.음식번호, 음식.음식명, 음식.사진, 음식.동영상, 음식.음식설명, sum(편의점물품.칼로리) as 총칼로리, sum(편의점물품.가격) as 총합가격, 편의점물품.판매사 from 음식, 제조방법, 편의점물품 " 
							+ "where 음식.음식번호=제조방법.음식번호 and 제조방법.물품번호=편의점물품.물품번호  and 음식.음식번호 = ?";
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, num);
			resultSet = pstmt.executeQuery();
			if(resultSet.next()) {
				dto = new FoodDTO();
				dto.setFoodNum(resultSet.getInt("음식.음식번호"));
				dto.setFoodName(resultSet.getString("음식.음식명"));
				dto.setFoodImage(resultSet.getString("음식.사진"));
				dto.setFoodVideo(resultSet.getString("음식.동영상"));
				dto.setFoodDescription(resultSet.getString("음식.음식설명"));
				dto.setFoodCalory(resultSet.getInt("총칼로리")); 
				dto.setFoodPrice(resultSet.getInt("총합가격"));
				dto.setBrandName(resultSet.getString("편의점물품.판매사"));
				
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
	
	public int getFoodCount(String category) {
	      Connection connection = null;
	      PreparedStatement pstmt = null;
	      ResultSet resultSet = null;
	      int res = 0;
	      
	      try {
	         connection = dataSource.getConnection();
	         String query = "select count(distinct 제조방법.음식번호) as 브랜드별갯수 from 편의점물품, 제조방법 where 제조방법.물품번호=편의점물품.물품번호 and 편의점물품.판매사=?";
	         pstmt = connection.prepareStatement(query);
	         pstmt.setString(1, category);
	         resultSet = pstmt.executeQuery();
	         if (resultSet.next()) {
	            res = Integer.parseInt(resultSet.getString("브랜드별갯수")); 
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
	
	public ArrayList<FoodDTO> getPopularFood() {
		ArrayList<FoodDTO> list = new ArrayList<FoodDTO>();
		FoodDTO dto = null;
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "select 음식번호, 음식명, 사진, sum(가격) as 총가격, sum(칼로리) as 총칼로리 from 예약순위정보 group by 음식번호";
			pstmt = connection.prepareStatement(query);
			resultSet = pstmt.executeQuery();
			while(resultSet.next()) {
				dto = new FoodDTO();
				dto.setFoodNum(resultSet.getInt("음식번호"));
				dto.setFoodName(resultSet.getString("음식명"));
				dto.setFoodImage(resultSet.getString("사진"));
				dto.setFoodPrice(resultSet.getInt("총가격"));
				dto.setFoodCalory(resultSet.getInt("총칼로리"));
				
				list.add(dto);
				
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
		return list;
	}

}
