<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "Food.*" %>    
<%
	request.setCharacterEncoding("EUC-KR");
	ArrayList<FoodDTO> list = (ArrayList<FoodDTO>)session.getAttribute("cartList");
%>
<%@ include file='/sub/sub_head.jsp' %>

<body>
	<div class="site-wrap">
		<jsp:include page="../sub_sidebar.jsp"></jsp:include>
		<div class="site-section">
			<div class="container">
				<div class="row">
					<div class="col-md-12 text-center">
						<span class="icon-check_circle display-3 text-success"></span>
						<h2 class="display-3 text-black">Thank you!</h2>
						<p class="lead mb-5">Your order was successfully completed.</p>
						<p>
							<a href="<%= request.getContextPath() %>/sub/shop/mail_Ok.jsp" class="btn btn-sm btn-primary">Back to shop</a> 
						</p>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="/sub/sub_footer.jsp"%>
	</div>
	<%@ include file="/sub/sub_bottom_js.jsp"%>