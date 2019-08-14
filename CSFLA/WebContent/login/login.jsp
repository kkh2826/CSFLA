<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ include file="/login/login_head.jsp" %>
<body>
	<div class="container">
		<div class="card card-login mx-auto text-center bg-dark">
			<div class="card-header mx-auto bg-dark">
				<span> <img src="<%= request.getContextPath() %>/main/pagemain/img/csfla_logo2.jpg"
					class="w-75" alt="Logo">
				</span><br /> <span class="logo_title mt-5">로그인 페이지</span>


			</div>
			<div class="card-body">
				<form action="loginOk.jsp" method="post">
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
						</div>
						<input type="text" name="id" class="form-control" placeholder="ID" value="<% if(session.getAttribute("id") != null) out.println(session.getAttribute("id")); %>"> 
					</div>

					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-key"></i></span>
						</div>
						<input type="password" name="pw" class="form-control" placeholder="Password">
					</div>

					<div class="form-group">
						<input type="submit" name="btn" value="Login" class="btn btn-outline-danger float-center login_btn"> 
						<input type="button" name="btn" value="Signin" onclick="location.href='<%= request.getContextPath()%>/login/join.jsp'" class="btn btn-outline-danger float-center login_btn">
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>