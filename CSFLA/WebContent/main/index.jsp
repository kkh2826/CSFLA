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
						�׻� ��ſ��� �޽��� �ǰ�, ���ΰ� �ǰ�, ������ �ǰ�, ���� �Ǵ� CU�� �ż��� ��ſ����� ����� �ϻ���
						Refresh �ϼ���.<br>
						<br> CU�� ��CVS for YOU���� ���ڷΡ��ٽ� �����ڡ���� ���� ��See You���� ����ǵ���,
						��Good to see you��, ��See you again���� �ǹ̸� ��� �ֽ��ϴ�.<br>
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
					<p>���ѹα� ���� �귣���� �������� ��Ű�� �ִ� GS25�� �������� �� �� �ִ� �������� �ø��١��� ����������
						����� ���Ģ�� ���Ծ��� ���ѿ� ��� ������ ���ͼ��� ���� ���� ���� �ְ��� ������ �귣��� �ڸ��ű��Ͽ����ϴ�.</p>
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
						���ѹα� ������ �������� �����Ϸ���<br>
						<br> �����Ϸ����� ȯ�ϰ� ������ ���ΰ����� �پ��� ��ǰ, ģ���� ���񽺸� 24�ð� ���߹��� �����ϴ�
						�ŷ����� �������·� ������ �������� ����� ������ ���ν� ������ �̷�� �Խ��ϴ�.
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