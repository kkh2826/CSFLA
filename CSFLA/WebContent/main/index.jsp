<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="Food.*" %>    
<%
	ArrayList<FoodDTO> cartList = new ArrayList<FoodDTO>();
	session.setAttribute("cartList", cartList);
%>        
<%@ include file="/main/main_head.jsp" %>

<div class="main-warp">
	<jsp:include page="main_sidebar.jsp" flush="false"></jsp:include>
	<div class="page-section home-page">
		<div class="hero-slider owl-carousel">
			<div class="slider-item d-flex align-items-center set-bg"
				data-setbg="pagemain/img/cu_01.jpg" data-hash="slide-1">
				<div class="si-text-box">
					<span>The First</span>
					<h2>CU</h2>
					<p>
						항상 당신에게 휴식이 되고, 위로가 되고, 응원이 되고, 힘이 되는 CU의 신선한 즐거움으로 당신의 일상을
						Refresh 하세요.<br>
						<br> CU는 ‘CVS for YOU’의 약자로“다시 만나자”라는 뜻의 “See You”가 연상되듯이,
						“Good to see you”, “See you again”의 의미를 담고 있습니다.<br>
					</p>
					<a href="http://cu.bgfretail.com/index.do" target="_blank"
						class="site-btn">More About</a>
				</div>
				<div class="next-slide-show set-bg"
					data-setbg="pagemain/img/gs_02.jpg">
					<a href="#slide-2" class="ns-btn">Next</a>
				</div>
			</div>
			<div class="slider-item d-flex align-items-center set-bg"
				data-setbg="pagemain/img/gs_01.jpg" data-hash="slide-2">
				<div class="si-text-box">
					<span>The Second</span>
					<h2>GS 25</h2>
					<p>대한민국 토종 브랜드의 자존심을 지키고 있는 GS25는 ‘수익을 낼 수 있는 가맹점을 늘린다’는 프랜차이즈
						사업의 대원칙을 변함없이 지켜온 결과 개별점 수익성이 가장 높은 국내 최고의 편의점 브랜드로 자리매김하였습니다.</p>
					<a href="http://gs25.gsretail.com/gscvs/ko/main" target="_blank"
						class="site-btn">More About</a>
				</div>
				<div class="next-slide-show set-bg"
					data-setbg="pagemain/img/711_02.jpg">
					<a href="#slide-3" class="ns-btn">Next</a>
				</div>
			</div>
			<div class="slider-item d-flex align-items-center set-bg"
				data-setbg="pagemain/img/711_01.jpg" data-hash="slide-3">
				<div class="si-text-box">
					<span>The Third</span>
					<h2>7-Eleven</h2>
					<p>
						대한민국 최초의 편의점인 세븐일레븐<br>
						<br> 세븐일레븐은 환하고 깨끗한 쇼핑공간과 다양한 상품, 친절한 서비스를 24시간 연중무휴 제공하는
						매력적인 유통형태로 고객들의 폭발적인 사랑은 받으며 눈부신 성장을 이루어 왔습니다.
					</p>
					<a href="http://www.7-eleven.co.kr/" target="_blank"
						class="site-btn">More About</a>
				</div>
				<div class="next-slide-show set-bg"
					data-setbg="pagemain/img/cu_02.jpg">
					<a href="#slide-1" class="ns-btn">Next</a>
				</div>
			</div>
		</div>
		<div id="snh-1"></div>
	</div>
	<!-- Page section end-->
</div>

<%@ include file="/main/main_bottom_js.jsp"%>