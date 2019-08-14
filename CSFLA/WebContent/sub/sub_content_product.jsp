<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="Food.*" %>
<%
	FoodDAO dao3 = new FoodDAO();
	ArrayList<FoodDTO> list = dao3.getPopularFood();
%>    
<div class="site-section block-3 site-blocks-2 bg-light">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-7 site-section-heading text-center pt-4">
				<h2>인기있는 TOP5 레시피</h2>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="nonloop-block-3 owl-carousel">
					<%
						for(int i=0; i<list.size(); i++) {
					%>
					<div class="item">
					
						<div class="block-4 text-center">
							<figure class="block-4-image">
								<a href="<%= request.getContextPath() %>/sub/shop/shop_single.jsp?foodNum=<%=list.get(i).getFoodNum()%>"><img src="/FOOD/<%= list.get(i).getFoodImage() %>" alt="Image placeholder" class="img-fluid"></a>
							</figure>
							<div class="block-4-text p-4">
								<h3>
									<a href="<%= request.getContextPath() %>/sub/shop/shop_single.jsp?foodNum=<%= list.get(i).getFoodNum() %>"><%= list.get(i).getFoodName() %></a>
								</h3>
								<p class="mb-0"><%= list.get(i).getFoodCalory() %></p>
								<p class="text-primary font-weight-bold"><%= list.get(i).getFoodPrice() %></p>
							</div>
						</div>
					
					</div>
					<%
						}
					%>
				</div>
			</div>
		</div>
	</div>
</div>