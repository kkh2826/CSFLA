<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script language="javascript" src="member.js"></script>
<% request.setCharacterEncoding("EUC-KR"); %>
<%@ page import="Member.*" %>
<%
	String id = (String)session.getAttribute("id");
	MemberDAO dao = new MemberDAO();
	MemberDTO dto = dao.getMember(id);
%>
<%@ include file="/login/login_head.jsp" %>
<body>
	<div class="container">
		<div class="card card-login mx-auto text-center bg-dark">
			<div class="card-header mx-auto bg-dark">
				<span> <img src="https://amar.vote/assets/img/amarVotebd.png"
					class="w-75" alt="Logo">
				</span><br /> <span class="logo_title mt-5">회원정보수정 페이지</span>

			</div>
			<div class="card-body">
				<form action="updateInfoOk.jsp" method="post" name="reg_form">
					<div class="input-group form-group">
						<input type="text" name="id" class="form-control" value="<%=dto.getId()%>" readonly><!-- placeholder="ID" -->
					</div>

					<div class="input-group form-group">
						<input type="password" name="pw" class="form-control" placeholder="Password">
					</div>

					<div class="input-group form-group">
						<input type="password" name="pw_check" class="form-control" placeholder="Password_Check">
					</div>

					<div class="input-group form-group">
						<input type="text" name="name" class="form-control" value="<%= dto.getName()%>"><!-- placeholder="Username" -->
						
					</div>

					<div class="input-group form-group">
						<input type="text" name="email" class="form-control" value="<%=dto.getEmail()%>"><!-- placeholder="Email" -->
					</div>

					<div class="input-group form-group">
						<input type="text" name="phoneNum" class="form-control" value="<%=dto.getPhoneNum()%>"><!-- placeholder="Phone Number" -->
					</div>

					<div class="form-group">
						<input type="button" name="btn" value="Update" class="btn btn-outline-danger float-center login_btn" onclick="updateCheck();">
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>