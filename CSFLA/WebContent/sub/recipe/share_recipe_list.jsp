<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="Recipe.*" %>
<jsp:useBean id="dao" class="Recipe.RecipeDAO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
<%
	ArrayList<RecipeDTO> list = dao.listRecipe();
%>
<%@ include file='/sub/sub_head.jsp' %>

<body>
	<div class="site-wrap">
		<jsp:include page="../sub_sidebar.jsp"></jsp:include>

		<div class="site-section">
			<div class="container">
				<div class="row">
					<div class="col-md-12 mb-10 mb-md-10">
						<h2 class="h3 mb-3 text-black">레시피 공유공간</h2>
						<div class="p-3 p-lg-5 border">
							<table class="table table-hover">
								<thead>
									<tr class="row" align="center">
										<th class="col-md-2">번호</th>
										<th class="col-md-6">제목</th>
										<th class="col-md-2">작성자</th>
										<th class="col-md-2">생성일</th>
									</tr>
								</thead>
								<tbody>
									<% for(int i=0; i<list.size(); i++) { %>
									<tr class="row" align="center">
										<td class="col-md-2"><%= i+1 %></td>
										<td class="col-md-6"><a href="share_recipe_content.jsp?num=<%= list.get(i).getRecipeNum() %>"><%= list.get(i).getRecipeTitle() %></a></td>
										<td class="col-md-2"><%= list.get(i).getWriter() %></td>
										<td class="col-md-2"><%= list.get(i).getRecipeDate() %></td>
									</tr>
									<% } %>
								</tbody>
							</table>


							<div class="form-group">
								<button class="btn btn-primary btn-lg py-3"
									onclick="window.location='<%= request.getContextPath()%>/sub/recipe/share_recipe.jsp'">레시피 자랑하기</button>
							</div>
						</div>
					</div>
				</div>
				<!-- </form> -->
			</div>
		</div>
		
		<%@ include file="/sub/sub_footer.jsp" %>
	</div>
	
	<%@ include file="/sub/sub_bottom_js.jsp" %>