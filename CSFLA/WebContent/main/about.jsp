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
						<p>���� CSFLA�� Convenient Store's Service For Living Alone��
							���ڷν�, ����� �Ǵ� ȥ�� ��� ����� ���� �������� �̿��� ���񽺸� ���� ���� �� �ֵ��� ������ �ִ�
							����Ʈ�Դϴ�.</p>
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
					<h2 class="el-title">CSFLA�� ���</h2>
					<div class="row">
						<div class="col-xl-6">
							<!-- Accordions -->
							<div id="accordion" class="accordion-area">
								<div class="panel">
									<div class="panel-header" id="headingOne">
										<button class="panel-link" data-toggle="collapse"
											data-target="#collapse1" aria-expanded="false"
											aria-controls="collapse1">������ ���� ������ ����</button>
									</div>
									<div id="collapse1" class="collapse"
										aria-labelledby="headingOne" data-parent="#accordion">
										<div class="panel-body">
											<p>���� CSFLA������ ���������� �ս��� ���� �� �ִ� ����� ���� �� �ִ� �����Ǹ� ������
												�帳�ϴ�. ������ �������� ������ ��ᱸ������ ��� �����Ǳ� ������ ȸ���Ե鲲���� �ս��� �丮�� �ؼ�
												�ܽĺη��� ���� ����Ƽ �ִ� �丮�� �Ͻ� �� �ֽ��ϴ�.</p>
										</div>
									</div>
								</div>
								<div class="panel">
									<div class="panel-header" id="headingTwo">
										<button class="panel-link" data-toggle="collapse"
											data-target="#collapse2" aria-expanded="false"
											aria-controls="collapse2">���� ��� ���� ����</button>
									</div>
									<div id="collapse2" class="collapse"
										aria-labelledby="headingTwo" data-parent="#accordion">
										<div class="panel-body">
											<p>ȸ���Ե鲲���� ���Ͻô� �丮�� �����Ͻð� �Ǹ� �׿� �ʿ��� ���ǰ���� �Բ� ����� ����������
												���Ÿ� �� �� �ֵ��� ��ᱸ�ſ��� ���񽺸� ���������� �� �ֽ��ϴ�.</p>
										</div>
									</div>
								</div>
								<div class="panel">
									<div class="panel-header" id="headingThree">
										<button class="panel-link" data-toggle="collapse"
											data-target="#collapse3" aria-expanded="false"
											aria-controls="collapse3">������ ���� ��ȯ</button>
									</div>
									<div id="collapse3" class="collapse"
										aria-labelledby="headingThree" data-parent="#accordion">
										<div class="panel-body">
											<p>ȸ���Ե鲲���� ���� �����ϴ� ������ ���� �Ӹ��� �ƴ϶� ȸ���Ե鳢�� ������ �����Ǹ� ����ϰ�
												������ ������ �� �ִ� �Խ����� �̿��Ͻ� �� �ֽ��ϴ�.</p>
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
										aria-controls="tab-1" aria-selected="true">�پ��� ����</a></li>
									<li class="nav-item"><a class="nav-link" id="2-tab"
										data-toggle="tab" href="#tab-2" role="tab"
										aria-controls="tab-2" aria-selected="false">�ð�����</a></li>
									<li class="nav-item"><a class="nav-link" id="3-tab"
										data-toggle="tab" href="#tab-3" role="tab"
										aria-controls="tab-3" aria-selected="false">���� ����Ƽ</a></li>
									<li class="nav-item"><a class="nav-link" id="4-tab"
										data-toggle="tab" href="#tab-4" role="tab"
										aria-controls="tab-4" aria-selected="false">��������</a></li>
								</ul>
								<div class="tab-content" id="myTabContent">
									<!-- single tab content -->
									<div class="tab-pane fade show active" id="tab-1"
										role="tabpanel" aria-labelledby="tab-1">
										<p>CU, GS25, 7-Eleven 3���� ����� ������ ������ �������̱� ������ ��� ��������
											������ �� ������ �������� �� �� �ִ�.</p>
									</div>
									<div class="tab-pane fade" id="tab-2" role="tabpanel"
										aria-labelledby="tab-2">
										<p>�ٻ� �������� ���� ���౸�� �ý������ν� ���ϴ� ���Ŀ� ���� ��Ḧ �����Ͽ� ������ �湮�� �ٷ�
											���Ű� ������ �� �־� �ð��� �ſ� ����ȴ�.</p>
									</div>
									<div class="tab-pane fade" id="tab-3" role="tabpanel"
										aria-labelledby="tab-3">
										<p>�پ��ϰ� ��︮�� ����� �������� �ܽ��� �ϰ� �ִ� ���� ���� ���� �� �ִ�.</p>
									</div>
									<div class="tab-pane fade" id="tab-4" role="tabpanel"
										aria-labelledby="tab-4">
										<p>�����ϰ� ������ ������ ���� ���� ���İ� �Բ� ������ ����� �Ա� ������ ����� �������
											�����ϴ�.</p>
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
							<li class="address">�ּ� : �������б�(��⵵ ��õ�� ���۵� ȣ���� 1007)</li>
							<br>
							<li class="phone"><a href="tel://23923929210">��ȣ :
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