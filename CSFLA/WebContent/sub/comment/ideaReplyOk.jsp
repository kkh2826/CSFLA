<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>  
<jsp:useBean id="dto" class="Reply.ReplyDTO"></jsp:useBean>
<jsp:useBean id="dao" class="Reply.ReplyDAO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>  

<%
   int res = dao.ideaInsertReply(dto);
   String idea = "���̵��";
   
   if ( res > 0 ) {
%>
      <script language="javascript">
         alert("����� ����Ͽ����ϴ�.");
         document.location.href="comment2.jsp?contentNum=" + <%= dto.getContentNum()%>+ "&commentType=idea";
      </script>
<%
   } else {
%>
      <script language="javascript">
         alert("����� ����ϴµ� ���� �Ͽ����ϴ�. �ٽ� �õ����ּ���.");
         document.location.href="comment2.jsp?contentNum=" + <%= dto.getContentNum()%> + "&commentType=idea";
      </script>
<%
   }
%>