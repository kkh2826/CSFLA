<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>  
<jsp:useBean id="dao" class="Recipe.RecipeDAO"></jsp:useBean>

<%
   
   int contentNum = Integer.parseInt( request.getParameter("num") ); 
   int res = dao.removeRecipe(contentNum);
   
   if ( res > 0 ) {
%>
      <script language="javascript">
         alert("���̵���� �����Ͽ����ϴ�.");
         document.location.href="share_recipe_list.jsp";
      </script>
<%
   } else {
%>
      <script language="javascript">
         alert("���ǻ����� �����ϴµ� �����Ͽ����ϴ�.");
         document.location.href="share_recipe_content.jsp?num=" + <%= contentNum %>;
      </script>
<%
   }
%>