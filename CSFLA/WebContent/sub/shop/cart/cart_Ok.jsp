<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "Food.*" %>    
<%
	request.setCharacterEncoding("EUC-KR");
	int foodCount = Integer.parseInt(request.getParameter("foodCount"));
	int orderPlace = Integer.parseInt(request.getParameter("csSelect"));
	
	ArrayList<FoodDTO> list = (ArrayList<FoodDTO>)session.getAttribute("cartList");
	FoodDTO cartdto = (FoodDTO)session.getAttribute("cartdto");
	cartdto.setOrderCount(foodCount);
	cartdto.setOrderPlace(orderPlace);
	
	list.add(cartdto);
	session.setAttribute("cartList", list);
	
%>
<script language="javascript">
	alert('��ٱ��Ͽ� ����߽��ϴ�.');
	document.location.href="cart.jsp";
</script>