<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="Food.*"%>

<%
   request.setCharacterEncoding("EUC-KR");
   FoodDAO dao = new FoodDAO();
   
%>
<div class="col-md-3 order-1 mb-5 mb-md-0">
   <div class="border p-4 rounded mb-4" style="position:fixed;">
      <h3 class="mb-3 h6 text-uppercase text-black d-block">CONVENIENT STORE</h3>
      <ul class="list-unstyled mb-0">
         <li class="mb-1"><a href="<%= request.getContextPath() %>/sub/shop/shop.jsp?category=CU" class="d-flex"><span>CU</span>
               <span class="text-black ml-auto"><%= dao.getFoodCount("CU") %>°³</span></a></li>
         <li class="mb-1"><a href="<%= request.getContextPath() %>/sub/shop/shop.jsp?category=GS" class="d-flex"><span>GS25</span>
               <span class="text-black ml-auto"><%= dao.getFoodCount("GS") %>°³</span></a></li>
         <li class="mb-1"><a href="<%= request.getContextPath() %>/sub/shop/shop.jsp?category=7ELEVEN" class="d-flex"><span>7Eleven</span>
               <span class="text-black ml-auto"><%= dao.getFoodCount("7ELEVEN") %>°³</span></a></li>
      </ul>
   </div>

</div>