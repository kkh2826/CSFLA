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
							<p class="mb-4">�ڱ� ���⿡ �´� ������ �����Ͽ� ���� ���������� ������ �����ϼ���. ������
								�����ϴ� �������� �����մϴ�. ���� ������ ������ ������ ���̵� ����ø� ������ ��ǰ�� �����մϴ�.</p>
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
							<p>���� ���񽺴� ����� �������� �ʽ��ϴ�. ��ǰ�� ������ �����ؼ� ������ �ϰ� ���� ������ �Ϸ� ���ž�
								�˴ϴ�.</p>
						</div>
					</div>
					<div class="col-md-6 col-lg-4 d-lg-flex mb-4 mb-lg-0 pl-4"
						data-aos="fade-up" data-aos-delay="100">
						<div class="icon mr-4 align-self-start">
							<span class="icon-refresh2"></span>
						</div>
						<div class="text">
							<h2 class="text-uppercase">Free Cancellation</h2>
							<p>�����Ӱ� ������ ������ ����� �� �ֽ��ϴ�. �׷��� ���ɽð� 30�� �������� ��Ұ� �Ұ����մϴ�.</p>
						</div>
					</div>
					<div class="col-md-6 col-lg-4 d-lg-flex mb-4 mb-lg-0 pl-4"
						data-aos="fade-up" data-aos-delay="200">
						<div class="icon mr-4 align-self-start">
							<span class="icon-help"></span>
						</div>
						<div class="text">
							<h2 class="text-uppercase">Customer Support</h2>
							<p>�ñ��� ������ ������ Q&A �׸� �����Ӱ� ���� �����ֽø� �˴ϴ�. �ڱⰡ ������ �޴��� �ø��ø� ��÷�� ���ؼ� ��ǰ���� �帳�ϴ�.</p>
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
						<p>���� ����� �츮 ����Ʈ�� ���� ������ ������ �����Ͽ��ٸ� �Խù��� �����ּ���. ��÷�� ���ؼ� ������
							��ǰ���� �帳�ϴ�!!</p>
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