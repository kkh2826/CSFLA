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
			String query = "select distinct ����.���Ĺ�ȣ, ����.���ĸ�, ����.����, ��������ǰ.�ǸŻ� from ����, ��������ǰ, ������� where ����.���Ĺ�ȣ=�������.���Ĺ�ȣ and �������.��ǰ��ȣ=��������ǰ.��ǰ��ȣ ";
			pstmt = connection.prepareStatement(query);
			resultSet = pstmt.executeQuery();
			while(resultSet.next()) {
				dto = new FoodDTO();
				dto.setFoodNum(resultSet.getInt("����.���Ĺ�ȣ"));
				dto.setFoodName(resultSet.getString("����.���ĸ�"));
				dto.setFoodImage(resultSet.getString("����.����"));
				dto.setBrandName(resultSet.getString("��������ǰ.�ǸŻ�"));
				
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
			String query = "select ����.���Ĺ�ȣ, ����.���ĸ�, ����.����, ����.������, ����.���ļ���, sum(��������ǰ.Į�θ�) as ��Į�θ�, sum(��������ǰ.����) as ���հ���, ��������ǰ.�ǸŻ� from ����, �������, ��������ǰ " 
							+ "where ����.���Ĺ�ȣ=�������.���Ĺ�ȣ and �������.��ǰ��ȣ=��������ǰ.��ǰ��ȣ  and ����.���Ĺ�ȣ = ?";
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, num);
			resultSet = pstmt.executeQuery();
			if(resultSet.next()) {
				dto = new FoodDTO();
				dto.setFoodNum(resultSet.getInt("����.���Ĺ�ȣ"));
				dto.setFoodName(resultSet.getString("����.���ĸ�"));
				dto.setFoodImage(resultSet.getString("����.����"));
				dto.setFoodVideo(resultSet.getString("����.������"));
				dto.setFoodDescription(resultSet.getString("����.���ļ���"));
				dto.setFoodCalory(resultSet.getInt("��Į�θ�")); 
				dto.setFoodPrice(resultSet.getInt("���հ���"));
				dto.setBrandName(resultSet.getString("��������ǰ.�ǸŻ�"));
				
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
	         String query = "select count(distinct �������.���Ĺ�ȣ) as �귣�庰���� from ��������ǰ, ������� where �������.��ǰ��ȣ=��������ǰ.��ǰ��ȣ and ��������ǰ.�ǸŻ�=?";
	         pstmt = connection.prepareStatement(query);
	         pstmt.setString(1, category);
	         resultSet = pstmt.executeQuery();
	         if (resultSet.next()) {
	            res = Integer.parseInt(resultSet.getString("�귣�庰����")); 
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
			String query = "select ���Ĺ�ȣ, ���ĸ�, ����, sum(����) as �Ѱ���, sum(Į�θ�) as ��Į�θ� from ����������� group by ���Ĺ�ȣ";
			pstmt = connection.prepareStatement(query);
			resultSet = pstmt.executeQuery();
			while(resultSet.next()) {
				dto = new FoodDTO();
				dto.setFoodNum(resultSet.getInt("���Ĺ�ȣ"));
				dto.setFoodName(resultSet.getString("���ĸ�"));
				dto.setFoodImage(resultSet.getString("����"));
				dto.setFoodPrice(resultSet.getInt("�Ѱ���"));
				dto.setFoodCalory(resultSet.getInt("��Į�θ�"));
				
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
