<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String userId = "";
	if(session.getAttribute("id") != null) {
		userId = (String)session.getAttribute("id");
	}
%>

<%@ include file='/sub/sub_head.jsp' %>
<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js"/>
<body>
	<div class="site-wrap">
		<jsp:include page="../sub_sidebar.jsp"></jsp:include>
		<div class="site-section">
			<div class="container">
				<div class="row">
					<div class="col-md-12 mb-10 mb-md-10">
						<h2 class="h3 mb-3 text-black">������ ��������</h2>
						<div class="p-3 p-lg-5 border">
						<form action="share_recipe_Ok.jsp" method="post" enctype="multipart/form-data">
							<div class="form-group row">
								<div class="col-md-12">
									<label for="c_companyname" class="text-black">�޴� �̸� </label> 
									<input type="text" class="form-control" id="c_companyname" name="recipeTitle">
								</div>
							</div>
							
							<div class="form-group row">
								<div class="col-md-12">
									<label for="c_companyname" class="text-black">�ۼ��� </label> 
									<input type="text" class="form-control" id="c_companyname" name="writer" value="<%= userId %>" readonly>
								</div>
							</div>
							
							<div class="form-group">
								<label for="c_order_notes" class="text-black">������ ����</label>
								<textarea name="recipeContent" id="c_order_notes" cols="30"
									rows="15" class="form-control"
									placeholder="Write your notes here..."></textarea>
							</div>

							<!-- <div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroupFileAddon01">���� �Ǵ� ������</span>
								</div>
								<div class="custom-file">
									<input type="file" class="custom-file-input"  id="inputGroupFile01" aria-describedby="inputGroupFileAddon01">
									<label class="custom-file-label" for="inputGroupFile01">�ϼ��� ������ �÷��ּ���...(Ȯ����: .jpg, .jpeg, .png)</label>
								</div>
							</div>   -->
						
							<!-- 	���� : <input type="file" name="recipeImage"> -->
								
							<label for="c_order_notes" class="text-black">÷������</label>
								<div class="input-group mb-3">
									<div class="custom-file">
										<input type="file" name="recipeImage" class="custom-file-input" id="inputGroupFile01" aria-describedby="inputGroupFileAddon01">
										<label class="custom-file-label" for="inputGroupFile01">Choose file(����)</label>
									</div>
									<div class="custom-file">
										<input type="file" name="recipeImage2" class="custom-file-input" id="inputGroupFile01" aria-describedby="inputGroupFileAddon01">
										<label class="custom-file-label" for="inputGroupFile01">Choose file(����)</label>
									</div>
									<div class="custom-file">
										<input type="file" name="recipeImage3" class="custom-file-input" id="inputGroupFile01" aria-describedby="inputGroupFileAddon01">
										<label class="custom-file-label" for="inputGroupFile01">Choose file(����)</label>
									</div>
									<div class="custom-file">
										<input type="file" name="recipeImage4" class="custom-file-input" id="inputGroupFile01" aria-describedby="inputGroupFileAddon01">
										<label class="custom-file-label" for="inputGroupFile01">Choose file(������)</label>
									</div>
								</div>
								<script type="text/javascript">
									$(document).on('change', '.custom-file-input', function (event) {
								    	$(this).next('.custom-file-label').html(event.target.files[0].name);
									})
								</script>



								<br>
							<div class="form-group">
								<button class="btn btn-primary btn-lg py-3 btn-block" type="submit">������ �ڶ��ϱ�</button>
							</div>
						</form>
						</div>
					</div>
				</div>
				<!-- </form> -->
			</div>
		</div>
		<%@ include file="/sub/sub_footer.jsp" %>
	</div>
	<%@ include file="/sub/sub_bottom_js.jsp" %>