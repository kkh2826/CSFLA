<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="Food.*" %>    

<%@ include file='/sub/sub_head.jsp' %>

<body>
	<div class="site-wrap">
		<jsp:include page="sub_sidebar.jsp"></jsp:include>
		<div class="site-blocks-cover"
			style="background-image: url(pagesub/images/pizza.jpg);"
			data-aos="fade">
			<div class="container">
				<div
					class="row align-items-start align-items-md-center justify-content-end">
					<div class="col-md-5 text-center text-md-left pt-5 pt-md-0">
						<h1 class="mb-2">Finding Your Perfect Foods</h1>
						<div class="intro-text text-center text-md-left">
							<p class="mb-4">자기 취향에 맞는 음식을 예약하여 직접 편의점에서 재료들을 수령하세요. 음식을
								제조하는 동영상을 제공합니다. 직접 개발한 편의점 음식의 아이디어를 남기시면 소정의 상품을 제공합니다.</p>
							<p>
								<a href="<%= request.getContextPath() %>/sub/shop/shop.jsp?category=ALL" class="btn btn-sm btn-primary">Shop Now</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="site-section site-section-sm site-blocks-1">
			<div class="container">
				<div class="row">
					<div class="col-md-6 col-lg-4 d-lg-flex mb-4 mb-lg-0 pl-4"
						data-aos="fade-up" data-aos-delay="">
						<div class="icon mr-4 align-self-start">
							<span class="icon-truck"></span>
						</div>
						<div class="text">
							<h2 class="text-uppercase">No Shipping</h2>
							<p>저의 서비스는 배달을 지원하지 않습니다. 상품과 지점을 선택해서 예약을 하고 직접 수령을 하러 가셔야
								됩니다.</p>
						</div>
					</div>
					<div class="col-md-6 col-lg-4 d-lg-flex mb-4 mb-lg-0 pl-4"
						data-aos="fade-up" data-aos-delay="100">
						<div class="icon mr-4 align-self-start">
							<span class="icon-refresh2"></span>
						</div>
						<div class="text">
							<h2 class="text-uppercase">Free Cancellation</h2>
							<p>자유롭게 예약한 내용을 취소할 수 있습니다. 그러나 수령시간 30분 이전에는 취소가 불가능합니다.</p>
						</div>
					</div>
					<div class="col-md-6 col-lg-4 d-lg-flex mb-4 mb-lg-0 pl-4"
						data-aos="fade-up" data-aos-delay="200">
						<div class="icon mr-4 align-self-start">
							<span class="icon-help"></span>
						</div>
						<div class="text">
							<h2 class="text-uppercase">Customer Support</h2>
							<p>궁금한 사항이 있으면 Q&A 항목에 자유롭게 글을 남겨주시면 됩니다. 자기가 개발한 메뉴를 올리시면 추첨을 통해서 상품권을 드립니다.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<%@ include file="/sub/sub_content_product.jsp" %>

		<div class="site-section block-8">
			<div class="container">
				<div class="row justify-content-center  mb-5">
					<div class="col-md-7 site-section-heading text-center pt-4">
						<h2>Big Event!</h2>
					</div>
				</div>
				<div class="row align-items-center">
					<div class="col-md-12 col-lg-7 mb-5">
						<a href="#"><img src="<%= request.getContextPath() %>/sub/pagesub/images/giftcard.jpg" alt="Image placeholder" class="img-fluid rounded"></a>
					</div>
					<div class="col-md-12 col-lg-5 text-center pl-md-5">
						<h2>
							<a href="#">We will give you a small Gift Card!</a>
						</h2>
						<p class="post-meta mb-4">
							By <a href="#">HK Company</a> <span class="block-8-sep">&bullet;</span>
							July 3, 2019
						</p>
						<p>만약 당신이 우리 사이트에 없는 편의점 음식을 제조하였다면 게시물을 남겨주세요. 추첨을 통해서 소정의
							상품권을 드립니다!!</p>
						<p>
							<a href="<%= request.getContextPath() %>/sub/reciple/share_recipe.jsp" class="btn btn-primary btn-sm">SHARING NOW</a>
						</p>
					</div>
				</div>
			</div>
		</div>
		
		<%@ include file="/sub/sub_footer.jsp" %>
	</div>
	
	<%@ include file="/sub/sub_bottom_js.jsp" %>