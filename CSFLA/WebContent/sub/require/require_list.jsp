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
   int onepageCount = 7; //�� �������� ������ ���ǻ��� �� ����
   int bottomCount = 5; //�ٴڿ� ǥ�õ� ��������ȣ ���� (ex: �������� 10���̸� 1-5���� �״���� 6-10��)
   int selectPage = 1; //�ڽ��� ������� ������ ��ȣ ����(2�������� Ŭ���ϸ� 2������, 3������ Ŭ���ϸ� 3������)
   if(request.getParameter("selectPage") != null) {
      selectPage = Integer.parseInt(request.getParameter("selectPage"));
   }
   int start = (selectPage*onepageCount) - (onepageCount-1); // ������ �������� ���� �Խù��� ���۰��� (ex : �������� 7���� �������ϱ� 2�������� ������ 8��°�� �Խù����� �������� �ϹǷ� �̿� ���� ����)
   int end = selectPage*onepageCount; // ������ �������� ���� �Խù��� ������(ex: 2�������� 7���� �Խù��̱� ������ 14�� �ȴ�)
   int count = dao.getTotal(); //���ǻ��׿� ���� �� �Խù� ���� ���� ���� ���� ����
   int allPage = count/onepageCount + (count%onepageCount == 0 ? 0 : 1); //�� �Խù��� ���� �ʿ��� ������ ������ ���� ����
   int pageBlock = 3;
   int startPage = (selectPage-1)/pageBlock*pageBlock+1; //default=1 �������̰� �ڽ��� ������ �������� ���� ����
   //int endPage = selectPage + bottomCount;
   int endPage = startPage + pageBlock - 1; // �ڽ��� ������ ������ �������� �������� �������� ������ ���� ����
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
						<h2 class="h3 mb-3 text-black">���ǻ���</h2>
						<table class="table table-hover">
							<thead>
								<tr class="row" align="center">
									<th class="col-md-2">��ȣ</th>
									<th class="col-md-6">����</th>
									<th class="col-md-2">�ۼ���</th>
									<th class="col-md-2">������</th>
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
																onclick="window.location='<%= request.getContextPath()%>/sub/comment/comment2.jsp'">���</button>													
														</form>
														
													</td>
													<td class="col-md-1">
														<%
															if ( session.getAttribute("id") != null && id.equals( list.get(i).getId() ) ) {
														%>
																<form action="require_remove.jsp" method="post" name="req_remove_form">
																	<input type="hidden" name="requireNum" value="<%= list.get(i).getRequireNum() %>">
																	<button class="btn btn-danger btn-sm py-3" type="submit">����</button>															
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
							<a href="require_list.jsp?selectPage=<%=startPage - pageBlock%>">[����]</a>
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
							<a href="require_list.jsp?selectPage=<%=startPage + pageBlock%>">[����]</a>
							<%
								}
							%>
						</div>
						
						
						<div class="form-group">
							<%
								if ( session.getAttribute("id") != null ) {
							%>
									<button class="btn btn-primary btn-sm py-3 "
										onclick="window.location='<%= request.getContextPath()%>/sub/require/require.jsp'">���� �ø���</button>
							<%
								} else {		
							%>
									<button class="btn btn-primary btn-sm py-3 "
										onclick="window.location='<%= request.getContextPath()%>/login/login.jsp'">���� �ø���</button>
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