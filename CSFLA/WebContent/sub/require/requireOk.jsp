<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>    
<jsp:useBean id="dto" class="Require.RequireDTO"></jsp:useBean>
<jsp:useBean id="dao" class="Require.RequireDAO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>  
<%
	String content = dto.getRequireContent();
	content = content.replaceAll("\r\n", "<br>");
	dto.setRequireContent(content);
   int res = dao.insertRequire(dto);

   if ( res > 0 ) {
%>
      <script language="javascript">
         alert("문의사항을 등록하였습니다. 답변을 기다려주세요.");
         document.location.href="require_list.jsp";
      </script>
<%
   } else {
%>
      <script language="javascript">
         alert("문의사항을 등록하는데 실패 하였습니다. 다시 시도해주세요.");
         document.location.href="require.jsp";
      </script>
<%
   }
%>