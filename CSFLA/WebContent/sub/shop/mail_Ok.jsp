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
   
   String title = "���� �����Դϴ�.";
   String content = "";
   
   for ( int i = 0 ; i < list.size() ; i++ ) {
      content += "���ĸ� : " + list.get(i).getFoodName() + "\n";
      csDTO = csDAO.getCS(list.get(i).getOrderPlace());
      
      content += "������ ��ġ : " + csDTO.getCsLocation() + "\n ������ ��ȭ��ȣ : " + csDTO.getCsPhone() + "\n\n";
      
   }
   
   MailSend ms = new MailSend();
   ms.MailSend("kkh2826@gmail.com", "", email, title, content);
   response.sendRedirect("../shop/shop.jsp?category=ALL");
%>

<script>
   
</script>