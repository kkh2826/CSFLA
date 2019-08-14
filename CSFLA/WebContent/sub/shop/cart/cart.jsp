<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="Food.*" %>   
<%@ page import="CS.*" %> 
<%
	request.setCharacterEncoding("EUC-KR");
	ArrayList<FoodDTO> list = (ArrayList<FoodDTO>)session.getAttribute("cartList");
	int sum = 0;
	
	CSDAO csDAO = new CSDAO();
	CSDTO csDTO = new CSDTO();
%>    

<%@ include file='../../sub_head.jsp' %>

<body>
   <div class="site-wrap">
      <jsp:include page="../../sub_sidebar.jsp"></jsp:include>
      <div class="site-section">
         <div class="container">
            <div class="row mb-5">
               <form class="col-md-12" action="order_delete.jsp" method="post">
                  <div class="site-blocks-table">
                     <table class="table table-bordered">
                        <thead>
                           <tr>
                              <th class="product-thumbnail">Food Image</th>
                              <th class="product-name">Product</th>
                              <th class="product-price">Price</th>
                              <th class="product-quantity">Quantity</th>
                              <th class="product-total">Total</th>
                              <th class="product-total">Location</th>
                              <th class="product-remove">Remove</th>
                           </tr>
                        </thead>
                        
                        <tbody>
                        <%
                        	for(int i=0; i<list.size(); i++) {
                        		sum += list.get(i).getFoodPrice() * list.get(i).getOrderCount();
                        		csDTO = csDAO.getCS(list.get(i).getOrderPlace());
                        %>
                           <tr>
                              <td class="product-thumbnail"> 
                              	<img src="/FOOD/<%= list.get(i).getFoodImage() %>" class="img-fluid">
                              </td>
                              <td class="product-name">
                                 <h2 class="h5 text-black"><%= list.get(i).getFoodName() %></h2>
                              </td>
                              <td><%= list.get(i).getFoodPrice() %></td>
                              <td><%= list.get(i).getOrderCount() %></td>
                              <td><%= list.get(i).getFoodPrice() * list.get(i).getOrderCount() %></td>
                              <td><%= csDTO.getCsLocation() %></td>
                              <td>
                              	<input name="removeNum" type="hidden" value="<%= i %>">
                              	<input type="submit"  class="btn btn-primary btn-sm" value="X">
                              </td>
                           </tr>
						<%
                        	}
						%>
                           
                        </tbody>
                     </table>
                  </div>
               </form>
            </div>

            <div class="row">
               <div class="col-md-6">
                  <div class="row mb-5">

                     <div class="col-md-6">
                        <button class="btn btn-outline-primary btn-sm btn-block" onclick="window.location='<%= request.getContextPath()%>/sub/shop/shop.jsp?category=ALL'">
                        Continue Shopping</button>
                     </div>
                  </div>

               </div>
               <div class="col-md-6 pl-5">
                  <div class="row justify-content-end">
                     <div class="col-md-7">
                        <div class="row">
                           <div class="col-md-12 text-right border-bottom mb-5">
                              <h3 class="text-black h4 text-uppercase">Cart Totals</h3>
                           </div>
                        </div>
                        
                        <div class="row mb-5">
                           <div class="col-md-6">
                              <span class="text-black">Total</span>
                           </div>
                           <div class="col-md-6 text-right">
                              <strong class="text-black"><%= sum %>¿ø</strong>
                           </div>
                        </div>

                        <div class="row">
                           <div class="col-md-12">
                              <button class="btn btn-primary btn-lg py-3 btn-block"
                                 onclick="window.location='order_Ok.jsp'">UPDATE ORDER</button>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <%@ include file="/sub/sub_footer.jsp"%>
   </div>
   <%@ include file="/sub/sub_bottom_js.jsp"%>