<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>  
<jsp:useBean id="dto" class="Member.MemberDTO"></jsp:useBean>
<jsp:useBean id="dao" class="Member.MemberDAO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>  
   
<%
	if(dao.checkId(dto.getId()) == dao.ID_EXISTENT) {
%>
	<script language="javascript">
		alert("���̵� �����մϴ�.");
		history.back();
	</script>
<%
	} else {
		int res = dao.registerMem(dto);
		if(res == dao.JOIN_OK) {
			session.setAttribute("id", dto.getId());
%>
	<script language="javascript">
		alert("ȸ�������� �����մϴ�.");
		document.location.href="login.jsp";
	</script>
<%
		} else {
%>
	<script language="javascript">
		alert("ȸ�����Կ� �����Ͽ����ϴ�.");
		document.location.href="login.jsp";
	</script>
<%
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