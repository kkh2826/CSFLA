<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>  
<jsp:useBean id="dto" class="Reply.ReplyDTO"></jsp:useBean>
<jsp:useBean id="dao" class="Reply.ReplyDAO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>  


<%
	int res = dao.insertReply(dto);

	if ( res > 0 ) {
%>
		<script language="javascript">
			alert("��۴亯�� ����Ͽ����ϴ�.");
			document.location.href="comment2.jsp?contentNum=" + <%=dto.getContentNum() %> + "&commentType=qa";
		</script>
<%
	} else {
%>
		<script language="javascript">
			alert("��۴亯�� ����ϴµ� ���� �Ͽ����ϴ�. �ٽ� �õ����ּ���.");
			document.location.href="comment2.jsp?contentNum=" + <%=dto.getContentNum() %>+ "&commentType=qa";
		</script>
<%
	}
%>