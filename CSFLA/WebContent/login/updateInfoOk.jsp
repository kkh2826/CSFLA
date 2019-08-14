<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<jsp:useBean id="dto" class="Member.MemberDTO"></jsp:useBean>
<jsp:useBean id="dao" class="Member.MemberDAO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
<%
	String id = (String)session.getAttribute("id");
	int res = dao.updateMember(dto);
	
	if(res == 1) {
%>
	<script language="javascript">
		alert("회원정보가 변경되었습니다.");
		document.location.href="../sub/index_sub.jsp";
	</script>
<%
	} else {
%>
	<script language="javascript">
		alert("회원정보 수정이 불가합니다.");
		history.go(-1);
	</script>
<%
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