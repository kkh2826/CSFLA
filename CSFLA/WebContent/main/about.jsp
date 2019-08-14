<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/main/main_head.jsp" %>
<div class="main-warp">
	<jsp:include page="main_sidebar.jsp" flush="false"></jsp:include>
	<div class="page-section about-page">
		<div class="about-warp">
			<div class="row">
				<div class="col-xl-7 order-2 order-xl-1">
					<div class="about-text">
						<span>The Site is ...</span>
						<h2>The CSFLA</h2>
						<p>저희 CSFLA는 Convenient Store's Service For Living Alone의
							약자로써, 자취생 또는 혼자 사는 사람을 위해 편의점을 이용해 서비스를 제공 받을 수 있도록 도움을 주는
							사이트입니다.</p>
					</div>
				</div>
				<div class="col-xl-3 offset-xl-1 order-1 order-xl-2 offset-0 pl-0">
					<div class="about-image">
						<img src="pagemain/img/about.jpg" alt="">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="element">
					<h2 class="el-title">CSFLA의 기능</h2>
					<div class="row">
						<div class="col-xl-6">
							<!-- Accordions -->
							<div id="accordion" class="accordion-area">
								<div class="panel">
									<div class="panel-header" id="headingOne">
										<button class="panel-link" data-toggle="collapse"
											data-target="#collapse1" aria-expanded="false"
											aria-controls="collapse1">편의점 음식 레시피 제공</button>
									</div>
									<div id="collapse1" class="collapse"
										aria-labelledby="headingOne" data-parent="#accordion">
										<div class="panel-body">
											<p>저희 CSFLA에서는 편의점에서 손쉽게 구할 수 있는 재료들로 만들 수 있는 레시피를 제공해
												드립니다. 레시피 동영상을 포함한 재료구성까지 모두 제공되기 때문에 회원님들께서는 손쉽게 요리를 해서
												외식부럽지 않은 퀄리티 있는 요리를 하실 수 있습니다.</p>
										</div>
									</div>
								</div>
								<div class="panel">
									<div class="panel-header" id="headingTwo">
										<button class="panel-link" data-toggle="collapse"
											data-target="#collapse2" aria-expanded="false"
											aria-controls="collapse2">음식 재료 예약 서비스</button>
									</div>
									<div id="collapse2" class="collapse"
										aria-labelledby="headingTwo" data-parent="#accordion">
										<div class="panel-body">
											<p>회원님들께서는 원하시는 요리를 선택하시게 되면 그에 필요한 재료품목들과 함께 가까운 편의점에서
												구매를 할 수 있도록 재료구매예약 서비스를 제공받으실 수 있습니다.</p>
										</div>
									</div>
								</div>
								<div class="panel">
									<div class="panel-header" id="headingThree">
										<button class="panel-link" data-toggle="collapse"
											data-target="#collapse3" aria-expanded="false"
											aria-controls="collapse3">레시피 정보 교환</button>
									</div>
									<div id="collapse3" class="collapse"
										aria-labelledby="headingThree" data-parent="#accordion">
										<div class="panel-body">
											<p>회원님들께서는 저희가 제공하는 편의점 음식 뿐만이 아니라 회원님들끼리 서로의 레시피를 모방하고
												정보를 공유할 수 있는 게시판을 이용하실 수 있습니다.</p>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-6">
							<div class="tab-element">
								<ul class="nav nav-tabs" id="myTab" role="tablist">
									<li class="nav-item"><a class="nav-link active" id="1-tab"
										data-toggle="tab" href="#tab-1" role="tab"
										aria-controls="tab-1" aria-selected="true">다양한 선택</a></li>
									<li class="nav-item"><a class="nav-link" id="2-tab"
										data-toggle="tab" href="#tab-2" role="tab"
										aria-controls="tab-2" aria-selected="false">시간단축</a></li>
									<li class="nav-item"><a class="nav-link" id="3-tab"
										data-toggle="tab" href="#tab-3" role="tab"
										aria-controls="tab-3" aria-selected="false">맛의 퀄리티</a></li>
									<li class="nav-item"><a class="nav-link" id="4-tab"
										data-toggle="tab" href="#tab-4" role="tab"
										aria-controls="tab-4" aria-selected="false">돈의절약</a></li>
								</ul>
								<div class="tab-content" id="myTabContent">
									<!-- single tab content -->
									<div class="tab-pane fade show active" id="tab-1"
										role="tabpanel" aria-labelledby="tab-1">
										<p>CU, GS25, 7-Eleven 3사의 재료들로 구성된 음식의 레시피이기 때문에 어느 편의점을
											선택할 지 폭넓은 선택지를 고를 수 있다.</p>
									</div>
									<div class="tab-pane fade" id="tab-2" role="tabpanel"
										aria-labelledby="tab-2">
										<p>바쁜 현대인을 위한 예약구매 시스템으로써 원하는 음식에 대한 재료를 예약하여 편의점 방문시 바로
											구매가 가능할 수 있어 시간이 매우 단축된다.</p>
									</div>
									<div class="tab-pane fade" id="tab-3" role="tabpanel"
										aria-labelledby="tab-3">
										<p>다양하고 어울리는 재료의 조합으로 외식을 하고 있는 듯한 맛을 느낄 수 있다.</p>
									</div>
									<div class="tab-pane fade" id="tab-4" role="tabpanel"
										aria-labelledby="tab-4">
										<p>간단하고 저렴한 편의점 재료로 만든 음식과 함께 집에서 만들어 먹기 때문에 교통비 절약까지
											가능하다.</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<br>
			<br>
			<div class="row">
				<div class="element">
					<h2 class="el-title">CONTACT</h2>
					<div class="col-xl-12">
						<ul class="list-unstyled">
							<li class="address">주소 : 대진대학교(경기도 포천시 자작동 호국로 1007)</li>
							<br>
							<li class="phone"><a href="tel://23923929210">번호 :
									031-539-1960</a></li>
							<br>
							<li class="email">E-Mail : 20141269@daejin.ac.kr</li>
						</ul>
					</div>
				</div>
				<iframe
					src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3149.4516620037675!2d127.1546018151253!3d37.873118814268494!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357cd0ef5c94de0f%3A0x939bfb90b5e10194!2z64yA7KeE64yA7ZWZ6rWQ!5e0!3m2!1sko!2skr!4v1561979839989!5m2!1sko!2skr"
					width="400" height="450" frameborder="0" style="border: 0"
					allowfullscreen></iframe>
			</div>
		</div>
	</div>
</div>
<%@ include file="/main/main_bottom_js.jsp"%>