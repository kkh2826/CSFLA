<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="Food.*" %>
<%
   request.setCharacterEncoding("EUC-KR");
   int index = Integer.parseInt(request.getParameter("removeNum"));

   ArrayList<FoodDTO> list = (ArrayList<FoodDTO>)session.getAttribute("cartList"); 

   list.remove(index);
   
   session.setAttribute("cartList", list);
   
%>
<script language="javascript">
   alert("삭제 하였습니다.");
   document.location.href = "cart.jsp";
</script>