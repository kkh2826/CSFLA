<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="Require.*" %>
<%@ page import="Reply.*" %>
<%@ page import="java.util.*" %>
<%
	request.setCharacterEncoding("EUC-KR");
	String id = (String)session.getAttribute("id");
	RequireDAO dao = new RequireDAO();
	ReplyDAO dao2 = new ReplyDAO();
%>
<%
   int onepageCount = 7; //한 페이지에 보여질 문의사항 글 갯수
   int bottomCount = 5; //바닥에 표시될 페이지번호 갯수 (ex: 페이지가 10쪽이면 1-5까지 그당므은 6-10쪽)
   int selectPage = 1; //자신이 보고싶은 페이지 번호 변수(2페이지를 클릭하면 2페이지, 3페이지 클릭하면 3페이지)
   if(request.getParameter("selectPage") != null) {
      selectPage = Integer.parseInt(request.getParameter("selectPage"));
   }
   int start = (selectPage*onepageCount) - (onepageCount-1); // 선택한 페이지에 대해 게시물의 시작개수 (ex : 페이지당 7개씩 보여지니까 2페이지를 누르면 8번째의 게시물부터 보여져야 하므로 이에 대한 변수)
   int end = selectPage*onepageCount; // 선택한 페이지에 대해 게시물의 끝개수(ex: 2페이지는 7개씩 게시물이기 때문에 14가 된다)
   int count = dao.getTotal(); //문의사항에 대해 총 게시물 갯수 구한 값에 대한 변수
   int allPage = count/onepageCount + (count%onepageCount == 0 ? 0 : 1); //총 게시물에 대해 필요한 페이지 갯수에 대한 변수
   int pageBlock = 3;
   int startPage = (selectPage-1)/pageBlock*pageBlock+1; //default=1 페이지이고 자신이 선택한 페이지에 대한 변수
   //int endPage = selectPage + bottomCount;
   int endPage = startPage + pageBlock - 1; // 자신이 선택한 페이지 다음으로 보여지는 페이지의 갯수에 대한 변수
   if(endPage > allPage) endPage = allPage; 
%>
<%
	ArrayList<RequireDTO> list = dao.getList(start, onepageCount*selectPage);
	ArrayList<ReplyDTO> list2 = null ;
%>
<%@ include file='/sub/sub_head.jsp' %>

<body>
	<div class="site-wrap">
		<jsp:include page="../sub_sidebar.jsp"></jsp:include>
		<div class="site-section">
			<div class="container">
				<div class="row">
					<div class="col-md-12 mb-10 mb-md-10">
						<h2 class="h3 mb-3 text-black">문의사항</h2>
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
								<%
									if ( list == null ) {
										
									} else  {
										for ( int i = 0 ; i < list.size() ; i++ ) {
								%>
										<tr class="row" align="center">
											<th class="col-md-2"><%= i+1 %></th>
											<th class="col-md-6"><a href="#demo<%= list.get(i).getRequireNum() %>" data-toggle="collapse"><%= list.get(i).getRequireTitle() %></a></th>
											<th class="col-md-2"><%= list.get(i).getId() %></th>
											<th class="col-md-2"><%= list.get(i).getRequireDate() %></th>
										</tr>
										<tr class="collapse out row" id="demo<%= list.get(i).getRequireNum() %>" align="center">
											<td class="col-md-10">
												<div>
													<%= list.get(i).getRequireContent() %>
													
												</div>
											</td>
											<%
												if ( session.getAttribute("id") != null ) {
											%>
													<td class="col-md-1">
														<form action="../comment/comment2.jsp" method="post" name="comment_form">
															<input type="hidden" name="contentNum" value="<%= list.get(i).getRequireNum()%>">
															<input type="hidden" name="commentType" value="qa">
															<button class="btn btn-primary btn-sm py-3" float="right"
																onclick="window.location='<%= request.getContextPath()%>/sub/comment/comment2.jsp'">댓글</button>													
														</form>
														
													</td>
													<td class="col-md-1">
														<%
															if ( session.getAttribute("id") != null && id.equals( list.get(i).getId() ) ) {
														%>
																<form action="require_remove.jsp" method="post" name="req_remove_form">
																	<input type="hidden" name="requireNum" value="<%= list.get(i).getRequireNum() %>">
																	<button class="btn btn-danger btn-sm py-3" type="submit">삭제</button>															
																</form>
														<%
															}
														%>
													</td>
											<%
												}
											%>
										</tr>

								<%
										}
									}
								%>
							</tbody>
						</table>
						
						<div align="center">
							<%
								if (startPage != 1) {
							%>
							<a href="require_list.jsp?selectPage=<%=startPage - pageBlock%>">[이전]</a>
							<%
								}
								for (int i = startPage; i <= endPage; i++) {
							%>
							<a href="require_list.jsp?selectPage=<%=i%>">[<%=i%>]
							</a>
							<%
								}
								if (allPage > endPage) {
							%>
							<a href="require_list.jsp?selectPage=<%=startPage + pageBlock%>">[다음]</a>
							<%
								}
							%>
						</div>
						
						
						<div class="form-group">
							<%
								if ( session.getAttribute("id") != null ) {
							%>
									<button class="btn btn-primary btn-sm py-3 "
										onclick="window.location='<%= request.getContextPath()%>/sub/require/require.jsp'">문의 올리기</button>
							<%
								} else {		
							%>
									<button class="btn btn-primary btn-sm py-3 "
										onclick="window.location='<%= request.getContextPath()%>/login/login.jsp'">문의 올리기</button>
							<%
								}
							%>
						
						</div>
					</div>
				</div>
			</div>
			<!-- </form> -->
		</div>
		<%@ include file="/sub/sub_footer.jsp"%>
	</div>
	
	
	
	<%@ include file="/sub/sub_bottom_js.jsp"%>