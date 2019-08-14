<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="Require.*" %>
<%@ page import="java.util.*" %>
<%
   request.setCharacterEncoding("EUC-KR");
   String id = (String)session.getAttribute("id");
   RequireDAO dao = new RequireDAO();
   RequireDTO dto = new RequireDTO();
   
%>
<%@ include file='/sub/sub_head.jsp' %>
<body>
   <div class="site-wrap">
      <jsp:include page="../sub_sidebar.jsp"></jsp:include>
      <div class="site-section">
         <div class="container">
            <form action="requireOk.jsp" method="post" name="req_form">
               <div class="row">
                  <div class="col-md-12 mb-10 mb-md-10">
                     <h2 class="h3 mb-3 text-black">문의사항</h2>
                     <div class="p-3 p-lg-5 border">
                        
                        <div class="form-group">
                           <label for="c_companyname" class="text-black">작성자 : </label>
                           <input type="text" class="form-control" id="c_order_notes" name="id" value="<%= id %>"readonly>
                            
                        </div>
   
                        <div class="form-group row">
                           <div class="col-md-12">
                              <label for="c_companyname" class="text-black">제목 </label> <input
                                 type="text" class="form-control" id="c_order_notes" name="requireTitle">
                           </div>
                        </div>
   
                        <div class="form-group">
                           <label for="c_order_notes" class="text-black">문의내용</label>
                           <textarea name="requireContent" id="c_order_notes" cols="30"
                              rows="15" class="form-control"
                              placeholder="Write your notes here..."></textarea>
                        </div>
                        <div class="form-group">
                                   <button class="btn btn-primary btn-lg py-3 btn-block" type="submit">문의 올리기</button>
                                </div>
                     </div>
                  </div>
               </div>
            </form>

            <!-- </form> -->
         </div>
      </div>
      <%@ include file="/sub/sub_footer.jsp"%>
   </div>
   <%@ include file="/sub/sub_bottom_js.jsp"%>