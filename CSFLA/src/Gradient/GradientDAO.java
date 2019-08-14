package Gradient;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class GradientDAO {
	DataSource dataSource;

	public GradientDAO() {
		
		try {
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/testdb");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<GradientDTO> getGradient(int num) {
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		ArrayList<GradientDTO> list = new ArrayList<GradientDTO>();
		GradientDTO dto = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "select 편의점물품.사진, 편의점물품.물품명 from 편의점물품, 음식, 제조방법 where 편의점물품.물품번호=제조방법.물품번호 and 제조방법.음식번호=음식.음식번호 and 음식.음식번호=?";
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, num);
			resultSet = pstmt.executeQuery();
			while(resultSet.next()) {
				dto = new GradientDTO();
				dto.setGradientImage(resultSet.getString("편의점물품.사진"));
				dto.setGradientName(resultSet.getString("편의점물품.물품명"));
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
