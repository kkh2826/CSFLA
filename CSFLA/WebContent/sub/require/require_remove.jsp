<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>  
<jsp:useBean id="dao" class="Require.RequireDAO"></jsp:useBean>

<%
   
   int requireNum = Integer.parseInt( request.getParameter("contentNum") );
   int res = dao.removeRequire(requireNum);
   
   if ( res > 0 ) {
%>
      <script language="javascript">
         alert("���ǻ����� �����Ͽ����ϴ�.");
         document.location.href="require_list.jsp";
      </script>
<%
   } else {
%>
      <script language="javascript">
         alert("���ǻ����� �����ϴµ� �����Ͽ����ϴ�.");
         document.location.href="require_list.jsp";
      </script>
<%
   }
%>