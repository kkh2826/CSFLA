<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<header class="header-section">
	<div class="header-close">
		<i class="fa fa-times"></i>
	</div>
	<div class="header-warp">
		<a href="<%= request.getContextPath() %>/main/index.jsp" class="site-logo">
			<img src="<%= request.getContextPath() %>/main/pagemain/img/csfla_logo.jpg" alt="">
		</a>
		<img src="<%= request.getContextPath() %>/main/pagemain/img/menu-icon.png" alt="" class="menu-icon">
		<ul class="main-menu">
			<li class="active"><a href="<%= request.getContextPath() %>/main/index.jsp">Home</a></li>
			<li><a href="<%= request.getContextPath() %>/main/gallery.jsp">Gallery</a></li>
			<li><a href="<%= request.getContextPath() %>/main/about.jsp">About</a></li>
		</ul>
		<div class="social-links-warp">
			<div class="social-links">
				<a href=""><i class="fa fa-facebook"></i></a>
			</div>
			<div class="social-text">Find us on</div>
		</div>
	</div>
	<div class="copyright">Colorlib 2018  @ All rights reserved</div>
</header>
		<!-- header section end -->