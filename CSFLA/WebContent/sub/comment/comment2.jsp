<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ page import="Require.*"%>
<%@ page import="Reply.*"%>
<% 
   request.setCharacterEncoding("EUC-KR"); 
   int num = Integer.parseInt(request.getParameter("contentNum"));
   String commentType = request.getParameter("commentType");
   ReplyDAO dao = new ReplyDAO();
   ReplyDTO dto = new ReplyDTO();
   ArrayList<ReplyDTO> replyList = null;
   ArrayList<ReplyDTO> replyList2 = null;
   if ( commentType.equals("qa") ) {
      replyList = dao.getList(num);
   } else  {
      replyList = dao.ideaCommentGetList(num); 
   }
   int lastCommentNum = 0;
%>
<link rel="stylesheet"
   href="<%= request.getContextPath() %>/sub/comment/css/style2.css">
<link
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"
   type="text/css" rel="stylesheet">

<%@ include file='/sub/sub_head.jsp'%>
<body>

   <div class="container">
      <h3 class=" text-center">Messaging</h3>
      <div class="messaging" >
         <div class="inbox_msg" style="padding: 20px;">

            <!-- 우측 부분 -->
               <!-- 반복문으로 댓글 출력하는 부분 -->
               <div class="msg_history">
                  <%
                     for ( int i = 0 ; i < replyList.size() ; i++ ) {
                        if ( commentType.equals("qa") ) {
                           replyList2 = dao.getList2(num, replyList.get(i).getCommentNum());                           
                        } else {
                           replyList2 = dao.ideaCommentGetList2(num, replyList.get(i).getCommentNum());                                                      
                        }
                        lastCommentNum = replyList.get(i).getCommentNum(); 
                  %>
                        <div class="incoming_msg">
                           <div class="incoming_msg_img comment_writer_id"><%= replyList.get(i).getId() %></div>
                           <div class="received_msg">
                              <div class="received_withd_msg">
                                 <p><%= replyList.get(i).getContent() %></p>
                                 <input type="hidden" class="comment_num" value="<%= replyList.get(i).getCommentNum() %>">
                                 <span class="time_date">
                                    <%= replyList.get(i).getReplyDate() %>
                                    <a href="#" class="secondCommentCreate"   data-toggle="modal" data-target="#modalContactForm">댓글달기</a>
                                 </span>
                              </div>
                           </div>
                        </div>
                  <%
                        if ( replyList2.size() != 0 ) {
                           for ( int j = 0 ; j < replyList2.size() ; j++ ) {
                  %>
                              <div class="outgoing_msg" style="margin: 0 10px 0 0;">
                                 <div class="sent_msg">
                                    <span class="time_date comment_writer_id2"><%= replyList2.get(j).getId()%></span>
                                    <input type="hidden" class="comment_num2" value="<%= replyList2.get(j).getCommentNum() %>">
                                    <p>
                                       <%= replyList2.get(j).getContent() %>
                                       <span class="time_date" style="color:yellow;">To : <%= replyList2.get(j).getParentId() %></span>
                                    </p>
                                    <span class="time_date"><%= replyList2.get(j).getReplyDate() %>
                                       <a href="#" class="secondCommentCreate2"   data-toggle="modal" data-target="#modalContactForm">댓글달기</a>
                                    </span>
                                 </div>
                              </div>
                  <%
                           }
                        }
                  %>
                  <%
                     }
                  %>
               </div>
               <!-- 반복문으로 댓글 출력하는 부분 -->
               <!-- 댓글 입력하는 구간 (아이디, 내용, 문의번호, 부모작성자, 댓글구분)-->
               <div class="type_msg">
                  <%
                     if ( commentType.equals("qa") ) {
                  %>
                        <form action="replyOk.jsp" method="post" name="reply_form">
                  <%   } else { %>
                        <form action="ideaReplyOk.jsp" method="post" name="reply_form">
                  <%    } %>
                           <div class="input_msg_write">
                              <input type="hidden" name="contentNum" value="<%= num %>">
                              <input type="hidden" name="id" value="<%= (String)session.getAttribute("id") %>">
                              <input type="hidden" name="commentNum" value="<%= lastCommentNum+1 %>">
                              <input type="text" class="write_msg" placeholder="Type a message" name="content"/>
                              <button class="msg_send_btn" type="submit">
                                 <i class="fa fa-paper-plane-o" aria-hidden="true"></i>
                              </button>
                           </div>
                        </form>
               </div>
               <!-- 댓글 입력하는 구간 -->
            <!-- 우측 부분 -->

         </div>


         
         <%
            if ( commentType.equals("qa") ) {
         %>
               <p class="text-center top_spac">
                  <a href="../require/require_list.jsp">뒤로가기</a>
               </p>
         <%
            } else {
         %>
               <p class="text-center top_spac">
                  <a href="../recipe/share_recipe_list.jsp">뒤로가기</a>
               </p>
         <%   }   %>
      </div>
   </div>

   

   <%
      if ( commentType.equals("qa") ) {
   %>
         <form action="reply2Ok.jsp" method="post" name="reply2_form">
   <%
      } else {
   %>
         <form action="ideaReplyOk2.jsp" method="post" name="reply2_form">
   <%   }   %>
            <div class="modal fade" id="modalContactForm" tabindex="-1"
               role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
               <div class="modal-dialog" role="document">
                  <div class="modal-content">
                     <div class="modal-header text-center">
                        <h4 class="modal-title w-100 font-weight-bold">Write to us</h4>
                        <button type="button" class="close" data-dismiss="modal"
                           aria-label="Close">
                           <span aria-hidden="true">&times;</span>
                        </button>
                     </div>
                     <div class="modal-body mx-3">
                        <div class="md-form mb-5">
                           <input type="text"
                              id="form34" class="form-control validate" name="id" value="<%=(String)session.getAttribute("id")%>" readonly> <label
                              data-error="wrong" data-success="right" for="form34">Your
                              ID</label>
                        </div>
         
                        <div class="md-form mb-5">
                           <input
                              type="text" id="form29" class="form-control validate" name="parentId" readonly> <label
                              data-error="wrong" data-success="right" for="form29">Parent
                              ID</label>
                        </div>
         
                        <div class="md-form mb-5">
                           <input type="text"
                              id="form32" class="form-control validate" name="commentNum" readonly> <label
                              data-error="wrong" data-success="right" for="form32">댓글구분</label>
                        </div>
         
                        <div class="md-form">
                           <textarea type="text" id="form8" class="md-textarea form-control"
                              rows="4" name="content"></textarea>
                           <label data-error="wrong" data-success="right" for="form8">Your
                              message</label>
                        </div>
                        <input type="hidden" name="contentNum" value="<%= num %>">
                     </div>
                     <div class="modal-footer d-flex justify-content-center">
                        <button class="btn btn-unique">Send</button>
                     </div>
                  </div>
               </div>
            </div>
         </form>

   <script language="javascript">
      var arr = new Array();   // 부모가 null인 작성자 아이디 넣기
      var arr2 = new Array();   // 댓글구분번호
      var childArr = new Array(); // 부모가 있는 댓글의 작성자 아이디 넣기
      var childArr2 = new Array(); // 

      var secondFunc = function secondComment(a, b) {
         var parentId = document.getElementById('form29');
         var num = document.getElementById('form32');
         
         parentId.value = a;
         num.value = b;
      };

      var commentWriter = document.getElementsByClassName('comment_writer_id');
      for ( var i = 0 ; i < commentWriter.length ; i++ ) {
         arr[i] = commentWriter[i].textContent;
      }
      var commentNum = document.getElementsByClassName('comment_num');
      for ( var i = 0 ; i < commentNum.length ; i++ ) {
         arr2[i] = commentNum[i].value;
      }
      var eventComment = document.getElementsByClassName('secondCommentCreate');
      for ( var i = 0 ; i < eventComment.length ; i++ ) {
         var a = arr[i];
         var b = arr2[i]; 
         eventComment[i].addEventListener('click', secondFunc.bind(this, a, b), false);
      }

      
      var commentWriter2 = document.getElementsByClassName('comment_writer_id2');
      for ( var i = 0 ; i < commentWriter2.length ; i++ ) {
         childArr[i] = commentWriter2[i].textContent;
      }
      var commentNum2 = document.getElementsByClassName('comment_num2');
      for ( var i = 0 ; i < commentNum2.length ; i++ ) {
         childArr2[i] = commentNum2[i].value;
      }
      var eventComment2 = document.getElementsByClassName('secondCommentCreate2');
      for ( var i = 0 ; i < eventComment2.length ; i++ ) {
         var a = childArr[i];
         var b = childArr2[i];
         eventComment2[i].addEventListener('click', secondFunc.bind(this, a, b), false);
      }
   </script>

   <%@ include file="/sub/sub_bottom_js.jsp"%>