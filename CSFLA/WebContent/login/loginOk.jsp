<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<%@ page import="Member.*" %>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	MemberDAO dao = new MemberDAO();
	
	int res = dao.userCheck(id, pw);
	if(res == -1) {
%>
	<script language="javascript">
		alert("�������� �ʴ� ȸ���Դϴ�.");
		history.go(-1);
	</script>
<%
	} else if(res == 0) {
%>
	<script language="javascript">
		alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
		history.go(-1);
	</script>
<%
	} else {
		MemberDTO dto = dao.getMember(id);
		
		if(dto == null) {
%>
	<script language="javascript">
		alert("ȸ���� �������� �ʽ��ϴ�.");
		history.go(-1);
	</script>
<%
		} else {
			session.setAttribute("name", dto.getName());
			session.setAttribute("id", dto.getId());
			session.setAttribute("email", dto.getEmail());
			session.setAttribute("ValidMember", "yes");
			response.sendRedirect("../sub/index_sub.jsp");
		}
	}
%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>