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
			alert("댓글을 등록하였습니다.");7
			document.location.href="comment2.jsp?contentNum=" + <%=dto.getContentNum() %>+ "&commentType=qa";
			
		</script>
<%
	} else {
%>
		<script language="javascript">
			alert("댓글을 등록하는데 실패 하였습니다. 다시 시도해주세요.");
			document.location.href="comment2.jsp?contentNum=" + <%=dto.getContentNum() %>+ "&commentType=qa";
		</script>
<%
	}
%>