<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<%@ page import="Food.*" %>    
<jsp:useBean id="dto" class="Food.FoodDTO"></jsp:useBean>
<jsp:useBean id="dao" class="Food.FoodDAO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
<%
	ArrayList<FoodDTO> list = dao.mainListFood();
%>    
<%@ include file="/main/main_head.jsp" %>
<div class="main-warp">
	<jsp:include page="main_sidebar.jsp" flush="false"></jsp:include>
	<div class="page-section gallery-page">
		<ul class="portfolio-filter">
			<li class="filter all active" data-filter="*">All</li>
			<li class="filter" data-filter=".photo">CU</li>
			<li class="filter" data-filter=".nature">GS25</li>
			<li class="filter" data-filter=".love">7-Eleven</li>
		</ul>

		<div class="portfolio-gallery">
			<% 
            	for ( int i = 0 ; i < list.size() ; i++ ) { 
               		if ( list.get(i).getBrandName().equals("CU") ) {
         	%>
			<div class="gallery-item photo">
			<%
            		} else if ( list.get(i).getBrandName().equals("GS") ) {
         	%>
			<div class="gallery-item nature">
			<%
            		} else {
         	%>
			<div class="gallery-item love">
			<%
            		}
         	%>
						<img src="/FOOD/<%= list.get(i).getFoodImage() %>">
						<div class="hover-links">
							<a href="<%= request.getContextPath() %>/login/login.jsp"
								class="site-btn sb-light">Next</a>
						</div>
					</div>
					<% } %>
				</div>

			</div>
		</div>
		<%@ include file="/main/main_bottom_js.jsp"%>