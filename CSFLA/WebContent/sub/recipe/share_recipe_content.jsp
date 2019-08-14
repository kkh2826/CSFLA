<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ page import="Recipe.*"%>
<%@ page import="RecipeFile.*"%>
<jsp:useBean id="dao" class="Recipe.RecipeDAO"></jsp:useBean>
<jsp:useBean id="dao2" class="RecipeFile.RecipeFileDAO"></jsp:useBean>
<jsp:useBean id="dto2" class="RecipeFile.RecipeFileDTO"></jsp:useBean>
<% request.setCharacterEncoding("EUC-KR"); %>
<%
   String admin = "site_admin";
   String userId = (String)session.getAttribute("id");
   String content_num = request.getParameter("num");
   RecipeDTO dto = dao.getRecipe(Integer.parseInt(content_num)); 
   
   ArrayList<RecipeFileDTO> list = dao2.list(Integer.parseInt(content_num));
%>
<%@ include file='/sub/sub_head.jsp'%>
<body>
   <div class="site-wrap">
      <jsp:include page="../sub_sidebar.jsp"></jsp:include>
      <div class="site-section">
         <div class="container">
            <div class="row">
               <div class="col-md-12 mb-10 mb-md-10">
                  <h2 class="h3 mb-3 text-black">문의사항</h2>
                  
                  
               		<%
                        if(dto.getWriter().equals(userId)) {
                    %>
                     <div class="row">
                        <div class="col">
                           <button class="btn btn-primary btn-lg py-3 btn-block"
                              onclick="window.location='<%= request.getContextPath()%>/sub/recipe/share_recipe_update.jsp?num=<%= content_num %>'">수정하기</button>
                        </div>
                        <div class="col">
                           <button class="btn btn-primary btn-lg py-3 btn-block"
                              onclick="window.location='<%= request.getContextPath()%>/sub/recipe/share_recipe_delete.jsp?num=<%= content_num %>'">삭제하기</button>
                        </div>
                        
                        <div class="col">
                           <button class="btn btn-primary btn-lg py-3 btn-block"
                              onclick="window.location='<%= request.getContextPath()%>/sub/recipe/share_recipe_list.jsp'">목록가기</button>
                        </div>
                     </div>
               		<%
                        } else {
                    %>
                     <div class="form-group row">
                        <div class="col-md-2">
                           <button class="btn btn-primary btn-lg py-3 btn-block"
                              onclick="window.location='<%= request.getContextPath()%>/sub/recipe/shre_recipe_list.jsp'">목록가기</button>
                        </div>
                     </div>
               		<%
                        }
                    %>
                  
                  
                  <div class="p-3 p-lg-5 border">
                     <!-- <form action="" method="post"> -->

                     <div class="form-group row">
                        <div class="col-md-6">
                           <label for="c_companyname" class="text-black">제목 </label> <input
                              type="text" class="form-control" id="c_companyname"
                              name="requireTitle" value="<%= dto.getRecipeTitle() %>"
                              readonly>
                        </div>
                        <div class="col-md-6">
                           <label for="c_companyname" class="text-black">날짜 </label> <input
                              type="text" class="form-control" id="c_companyname"
                              name="requireTitle" value="<%= dto.getRecipeDate() %>"
                              readonly>
                        </div>
                     </div>

                     <div class="form-group row">
                        <div class="col-md-6">
                           <label for="c_companyname" class="text-black">작성자 </label> <input
                              type="text" class="form-control" id="c_companyname"
                              name="writer" value="<%= dto.getWriter() %>" readonly>
                        </div>
                     </div>

                     <div class="form-group">
                        <label for="c_order_notes" class="text-black">문의내용</label>
                        <textarea name="requireContent" id="c_order_notes" cols="30"
                           rows="10" class="form-control" readonly><%= dto.getRecipeContent() %></textarea>
                     </div>

                     <div class="form-group mb-3">
                        <div class="input-group-prepend">
                           <span class="input-group-text" id="inputGroupFileAddon01">사진 및 동영상</span>
                        </div>
                        <div class="row">
                  		<%
                           for(int i=0; i<list.size(); i++){
                              if(list.get(i).getRecipeFileType().startsWith("image")) {
                        %>
                           <div class="col">
                              <img
                                 src="/RECIPE_CONTENT/<%= list.get(i).getRecipeFileName() %>"
                                 width="280" height="300">
                           </div>
                  		<%                                 
                              } 
                           }
                        %>


                  		<%
                           for(int i=0; i<list.size(); i++){
                              if(list.get(i).getRecipeFileType().startsWith("video")) {
                        %>
                           <div class="col">
                              <iframe
                                 src="/RECIPE_CONTENT/<%= list.get(i).getRecipeFileName() %>"
                                 width="280" height="300"></iframe>
                           </div>
                  		<%                                 
                              } 
                           }
                        %>
                        </div>

                     </div>

                     <form action="../comment/comment2.jsp" method="post" name="comment_form2">
                        <input type="hidden" name="contentNum" value="<%=content_num%>">
                        <input type="hidden" name="commentType" value="idea">
                        <div class="form-group">
                           <button class="btn btn-primary btn-lg py-3 btn-block" float="right" onclick="window.location='<%=request.getContextPath()%>/sub/comment/comment2.jsp'">댓글</button>
                        </div>
                     </form>

                     <!-- </form> -->
                  </div>
               </div>
            </div>
            <!-- </form> -->
         </div>
      </div>
      <%@ include file="/sub/sub_footer.jsp"%>
   </div>
   <%@ include file="/sub/sub_bottom_js.jsp"%>