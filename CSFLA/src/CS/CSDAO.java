package CS;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CSDAO {
	DataSource dataSource;
	public CSDAO() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/testdb");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<CSDTO> getCSList(String brandName){
		  Connection connection = null;
	      PreparedStatement pstmt = null;
	      ResultSet resultSet = null;
	      ArrayList<CSDTO> list = new ArrayList<CSDTO>();
	      CSDTO dto = null;
	      
	      try {
	    	  connection = dataSource.getConnection();
	    	  String query = "select * from 편의점 where 판매사=?";
	    	  pstmt = connection.prepareStatement(query);
	    	  pstmt.setString(1, brandName);
	    	  resultSet = pstmt.executeQuery();
	    	  while(resultSet.next()) {
	    		  dto = new CSDTO();
	    		  dto.setCsNum(resultSet.getInt("편의점번호"));
	    		  dto.setCsBrand(resultSet.getString("판매사"));
	    		  dto.setCsOwner(resultSet.getString("점주명"));
	    		  dto.setCsEmail(resultSet.getString("이메일"));
	    		  dto.setCsPhone(resultSet.getString("전화번호"));
	    		  dto.setCsLocation(resultSet.getString("위치"));
	    		  
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
	
	public CSDTO getCS(int csNum) {
			Connection connection = null;
			PreparedStatement pstmt = null;
			ResultSet resultSet = null;
			CSDTO dto = null;
			
			try {
		    	  connection = dataSource.getConnection();
		    	  String query = "select * from 편의점 where 편의점번호=?";
		    	  pstmt = connection.prepareStatement(query);
		    	  pstmt.setInt(1, csNum);
		    	  resultSet = pstmt.executeQuery();
		    	  while(resultSet.next()) {
		    		  dto = new CSDTO();
		    		  dto.setCsNum(resultSet.getInt("편의점번호"));
		    		  dto.setCsBrand(resultSet.getString("판매사"));
		    		  dto.setCsOwner(resultSet.getString("점주명"));
		    		  dto.setCsEmail(resultSet.getString("이메일"));
		    		  dto.setCsPhone(resultSet.getString("전화번호"));
		    		  dto.setCsLocation(resultSet.getString("위치"));
		    		  
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
}
