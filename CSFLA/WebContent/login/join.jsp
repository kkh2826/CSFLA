<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>    
<% request.setCharacterEncoding("EUC-KR"); %>
<script language="javascript" src="member.js"></script> 
<%@ include file="/login/login_head.jsp" %>
<body>
	<div class="container">
		<div class="card card-login mx-auto text-center bg-dark">
			<div class="card-header mx-auto bg-dark">
				<span> <img src="<%= request.getContextPath() %>/main/pagemain/img/csfla_logo2.jpg"
					class="w-75" alt="Logo">
				</span><br /> <span class="logo_title mt-5">회원가입 페이지</span>

			</div>
			<div class="card-body">
				<form action="joinOk.jsp" method="post" name="reg_form">
					<div class="input-group form-group">
						<input type="text" name="id" class="form-control" placeholder="ID">
					</div>

					<div class="input-group form-group">
						<input type="password" name="pw" class="form-control"
							placeholder="Password">
					</div>

					<div class="input-group form-group">
						<input type="password" name="pw_check" class="form-control"
							placeholder="Password_Check">
					</div>

					<div class="input-group form-group">
						<input type="text" name="name" class="form-control"
							placeholder="Username">
					</div>

					<div class="input-group form-group">
						<input type="text" name="email" class="form-control"
							placeholder="Email">
					</div>

					<div class="input-group form-group">
						<input type="text" name="phoneNum" class="form-control"
							placeholder="Phone Number">
					</div>

					<div class="form-group">
						<input type="submit" name="btn" value="Register"
							class="btn btn-outline-danger float-center login_btn" onclick="infoConfirm()">
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>