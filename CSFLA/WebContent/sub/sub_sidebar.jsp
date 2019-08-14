<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script language="javascript" src="../login/member.js"></script>
</head>
<body>
		<header class="site-navbar" role="banner">
			<div class="site-navbar-top">
				<div class="container">
					<div class="row align-items-center">

						<div class="col-6 col-md-4 order-2 order-md-1 site-search-icon text-left">
						</div>

						<div
							class="col-12 mb-3 mb-md-0 col-md-4 order-1 order-md-2 text-center">
							<div class="site-logo">
								<a href="<%= request.getContextPath() %>/sub/index_sub.jsp" class="js-logo-clone">Convenient Store</a>
							</div>
						</div>

						<div class="col-6 col-md-4 order-3 order-md-3 text-right">
							<div class="site-top-icons">
								<ul>
									<%-- <li><a href="<%= request.getContextPath() %>/login/logout.jsp"><span class="icon icon-power-off"></span></a></li> --%>
									<li>
										<a href="#" ><span class="icon icon-power-off" data-toggle="modal" data-target=".bs-example-modal-sm"></span></a>
										<div class="modal bs-example-modal-sm" tabindex="-1" role="dialog" aria-hidden="true">
  											<div class="modal-dialog modal-sm">
    											<div class="modal-content" align="center">
      												<div class="modal-header"><h4>Logout</h4></div>
      												<div class="modal-body">로그아웃 하시겠습니까?</div>
      												<div class="modal-footer"><a href="<%= request.getContextPath() %>/login/logout.jsp" class="btn btn-outline-danger">Logout</a></div>
    											</div>
  											</div>
										</div>
									</li>
									<li><a href="<%= request.getContextPath() %>/login/updateInfo.jsp"><span class="icon icon-person"></span></a></li>
									<li><a href="<%= request.getContextPath() %>/sub/shop/cart/cart.jsp" class="site-cart"> <span class="icon icon-shopping_cart"></span>
									</a></li>
									<li class="d-inline-block d-md-none ml-md-0"><a href="#"
										class="site-menu-toggle js-menu-toggle"><span
											class="icon-menu"></span></a></li>
								</ul>
							</div>
						</div>

					</div>
				</div>
			</div>
			<nav class="site-navigation text-right text-md-center"
				role="navigation">
				<div class="container">
					<ul class="site-menu js-clone-nav d-none d-md-block">
						<li class="has-children active"><a href="<%= request.getContextPath() %>/sub/index_sub.jsp">Home</a>
							<ul class="dropdown">
								<li><a href="<%= request.getContextPath() %>/main/index.jsp">Main HomePage</a></li>
								<li><a href="<%= request.getContextPath() %>/sub/index_sub.jsp">Sub HomePage</a></li>
							</ul></li>
						<li class="has-children"><a href="<%= request.getContextPath() %>/sub/shop/shop.jsp?category=All">Shop</a>
							<ul class="dropdown">
								<li><a href="<%= request.getContextPath() %>/sub/shop/shop.jsp?category=CU">CU</a></li>
								<li><a href="<%= request.getContextPath() %>/sub/shop.shop.jsp?category=GS">GS25</a></li>
								<li><a href="<%= request.getContextPath() %>/sub/shop/shop.jsp?category=7ELEVEN">7-Eleven</a></li>
							</ul></li>
						<li class="has-children"><a href="<%= request.getContextPath() %>/sub/recipe/share_recipe_list.jsp">Sharing
								Recipe</a>
							<ul class="dropdown">
								<li><a href="<%= request.getContextPath() %>/sub/recipe/share_recipe.jsp">Post</a></li>
								<li><a href="<%= request.getContextPath() %>/sub/recipe/share_recipe_list.jsp">List</a></li>
							</ul></li>
						<li class="has-children"><a href="<%= request.getContextPath() %>/sub/require_list.jsp">Q&A</a>
							<ul class="dropdown">
								<li><a href="<%= request.getContextPath() %>/sub/require/require.jsp">Post</a></li>
								<li><a href="<%= request.getContextPath() %>/sub/require/require_list.jsp">List</a></li>
							</ul></li>
					</ul>
				</div>
			</nav>
		</header>
</body>
</html>