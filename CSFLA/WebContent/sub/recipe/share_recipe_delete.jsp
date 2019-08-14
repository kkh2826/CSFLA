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
         alert("아이디어을 삭제하였습니다.");
         document.location.href="share_recipe_list.jsp";
      </script>
<%
   } else {
%>
      <script language="javascript">
         alert("문의사항을 삭제하는데 실패하였습니다.");
         document.location.href="share_recipe_content.jsp?num=" + <%= contentNum %>;
      </script>
<%
   }
%>