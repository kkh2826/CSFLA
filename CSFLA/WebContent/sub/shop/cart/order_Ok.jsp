<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "Food.*" %> 
<%@ page import = "Order.*" %>   
<%
	request.setCharacterEncoding("EUC-KR");
	
	OrderDAO orderDAO = new OrderDAO();
	String id = (String)session.getAttribute("id");
	ArrayList<FoodDTO> list = (ArrayList<FoodDTO>)session.getAttribute("cartList");
	int res = orderDAO.insertOrder(list, id);
	
	if( res > 0) {
%>
	<script language="javascript">
		document.location.href="../thankyou.jsp";
	</script>
<%
	} else {
%>
	<script language="javascript">
		alert("예약실패!");
		history.go(-1);
	</script>		
<%	
	}
%>

