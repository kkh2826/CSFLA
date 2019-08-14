<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="Mail.*" %>
<%@ page import="Food.*" %>
<%@ page import="CS.*" %>
<%
   request.setCharacterEncoding("EUC-KR");
   ArrayList<FoodDTO> list = (ArrayList<FoodDTO>)session.getAttribute("cartList");
   CSDAO csDAO = new CSDAO();
   CSDTO csDTO = new CSDTO();
   String email = (String)session.getAttribute("email");
   
   String title = "예약 내역입니다.";
   String content = "";
   
   for ( int i = 0 ; i < list.size() ; i++ ) {
      content += "음식명 : " + list.get(i).getFoodName() + "\n";
      csDTO = csDAO.getCS(list.get(i).getOrderPlace());
      
      content += "편의점 위치 : " + csDTO.getCsLocation() + "\n 편의점 전화번호 : " + csDTO.getCsPhone() + "\n\n";
      
   }
   
   MailSend ms = new MailSend();
   ms.MailSend("kkh2826@gmail.com", "", email, title, content);
   response.sendRedirect("../shop/shop.jsp?category=ALL");
%>

<script>
   
</script>