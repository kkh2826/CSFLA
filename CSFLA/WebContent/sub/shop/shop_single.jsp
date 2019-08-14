<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="Gradient.*" %>
<%@ page import="CS.*" %>
<jsp:useBean id="dto" class="Food.FoodDTO"></jsp:useBean>
<jsp:useBean id="dao" class="Food.FoodDAO"></jsp:useBean>   

<%
	request.setCharacterEncoding("EUC-KR");
	String foodNum = request.getParameter("foodNum");
	dto = dao.getFoodInfo(Integer.parseInt(foodNum));
	GradientDAO dao2 = new GradientDAO();
	ArrayList<GradientDTO > gradientList = dao2.getGradient(Integer.parseInt(foodNum)); 
	
	session.setAttribute("cartdto", dto);
	
	CSDAO csDAO = new CSDAO();
	ArrayList<CSDTO> csList = csDAO.getCSList(dto.getBrandName());
%>
<%@ include file='/sub/sub_head.jsp' %>

<body>
	<div class="site-wrap">
		<jsp:include page="../sub_sidebar.jsp"></jsp:include>
		<div class="site-section">
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						<video class="embed-responsive" autoplay controls>
							<source src="/FOOD/<%= dto.getFoodVideo() %>" >
						</video>
					</div>
					<div class="col-md-6">
						<h2 class="text-black"><%= dto.getFoodName() %></h2><br>
						<%
							String foodDescription = dto.getFoodDescription();
							foodDescription = foodDescription.replaceAll(",", "<br>");
							dto.setFoodDescription(foodDescription);
						%>
						<p><%= dto.getFoodDescription() %></p>
						<p>
							<strong class="text-primary h4"><%= dto.getFoodPrice() %>원</strong>
						</p>
						<form action="<%= request.getContextPath() %>/sub/shop/cart/cart_Ok.jsp" method="POST">
						<div class="mb-5">
							<div class="input-group mb-3" style="max-width: 120px;">
								<div class="input-group-prepend">
									<button class="btn btn-outline-primary js-btn-minus" type="button">&minus;</button>
								</div>
								<input type="text" class="form-control text-center" value="1" aria-label="Example text with button addon" aria-describedby="button-addon1" name="foodCount">
								<div class="input-group-append">
									<button class="btn btn-outline-primary js-btn-plus" type="button">&plus;</button>
								</div>
							</div>
							<select name="csSelect">
								<%
									for(int i=0; i<csList.size(); i++) {
								%>
									<option value="<%= csList.get(i).getCsNum()%>"><%= csList.get(i).getCsLocation() %></option>
								<%
									}
								%>									
							</select>
						</div>
						<p>
							<input type="submit" class="buy-now btn btn-sm btn-primary" value="Add To Cart">
							
						</p>
						</form>
					</div>
					
					<div class="col">
					<div class="input-group-prepend">
                  			<span class="input-group-text" >필요한 재료</span>
					
							<%
								for(int i=0; i<gradientList.size(); i++) {
							%>
							<div class="block-4-text p-4">
								<img class="mx-auto d-block" src="/GRADIENT/<%=gradientList.get(i).getGradientImage()%>" width=100, height=100>
								<p class="mb-0"><%=gradientList.get(i).getGradientName()%></p>
							</div>

							<%
								}
							%>
					</div>
					</div>
				</div>
			</div>
		</div>
		
		<%@ include file="/sub/sub_content_product.jsp" %>
		
		<%@ include file="/sub/sub_footer.jsp" %>
	</div>
	
	<%@ include file="/sub/sub_bottom_js.jsp" %>