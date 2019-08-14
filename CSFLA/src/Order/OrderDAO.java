package Order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import Food.FoodDTO;

public class OrderDAO {
	DataSource dataSource;

	public OrderDAO() {
		
		try {
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/testdb");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int insertOrder(ArrayList<FoodDTO> list, String id) {
		Connection connection = null;
		PreparedStatement pstmt = null;
		int res = 0;
		
		for(int i=0; i<list.size(); i++) {
			try {
				connection = dataSource.getConnection();
				String query = "insert into 예약(음식번호, 아이디, 음식수량, 편의점번호) values (?,?,?,?)";
				pstmt = connection.prepareStatement(query);
				pstmt.setInt(1, list.get(i).getFoodNum());
				pstmt.setString(2, id);
				pstmt.setInt(3, list.get(i).getOrderCount());
				pstmt.setInt(4, list.get(i).getOrderPlace());
				res = pstmt.executeUpdate();
			}catch(Exception e){
				e.printStackTrace();
			}finally {
				try {
					if(pstmt != null) pstmt.close();
					if(connection != null) connection.close();
				}catch(Exception e2) {
					e2.printStackTrace();
				}
			}
		}
		return res;
		
	}
}