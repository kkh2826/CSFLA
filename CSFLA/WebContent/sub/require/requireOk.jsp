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
         alert("���ǻ����� ����Ͽ����ϴ�. �亯�� ��ٷ��ּ���.");
         document.location.href="require_list.jsp";
      </script>
<%
   } else {
%>
      <script language="javascript">
         alert("���ǻ����� ����ϴµ� ���� �Ͽ����ϴ�. �ٽ� �õ����ּ���.");
         document.location.href="require.jsp";
      </script>
<%
   }
%>