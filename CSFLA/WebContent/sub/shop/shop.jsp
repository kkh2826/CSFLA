<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ page import="Food.*"%>
<jsp:useBean id="dto" class="Food.FoodDTO"></jsp:useBean>
<jsp:useBean id="dao" class="Food.FoodDAO"></jsp:useBean>

<%
   request.setCharacterEncoding("EUC-KR");
   String category = request.getParameter("category");
   ArrayList<FoodDTO> list = dao.mainListFood();
   int foodNum = 0;
   
%>
<%@ include file='/sub/sub_head.jsp'%>
<script>
   var arr = new Array();
</script>
<body>
   <div class="site-wrap">
      <jsp:include page="../sub_sidebar.jsp"></jsp:include>
      <div class="site-section">
         <div class="container">


            <div class="row mb-5">
               <div class="col-md-9 order-2">

                  <div class="row">
                     <div class="col-md-12 mb-5">
                        <div class="float-md-left mb-4">
                           <h2 class="text-black h5"><%= category %></h2>
                        </div>
                        <div class="d-flex">

                           <div class="dropdown mr-1 ml-md-auto btn-group">
                              <button type="button"
                                 class="btn btn-secondary btn-sm dropdown-toggle"
                                 id="dropdownMenuReference" data-toggle="dropdown">Reference</button>
                              <div class="dropdown-menu"
                                 aria-labelledby="dropdownMenuReference">
                                 <a class="dropdown-item" href="#" id="lowTohigh">Price, low to high</a> <a
                                    class="dropdown-item" href="#" id="highTolow">Price, high to low</a>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="row mb-5">

                     <%
                           for (int i = 0; i < list.size(); i++) {
                              if ( category.equals("CU") ) {
                                 if ( !list.get(i).getBrandName().equals(category) ) continue;
                              } else if ( category.equals("GS") ) {
                                 if ( !list.get(i).getBrandName().equals(category) ) continue;
                              } else if ( category.equals("7ELEVEN") ) {
                                 if ( !list.get(i).getBrandName().equals(category) ) continue;
                              }
                     %>
                              <div class="col-sm-6 col-lg-4 mb-4" data-aos="fade-up">
                                 <div class="block-4 text-center border">
                                    <figure class="block-4-image">
                                       <a href="<%= request.getContextPath() %>/sub/shop/shop_single.jsp?foodNum=<%= list.get(i).getFoodNum() %>">
                                       <img src="/FOOD/<%=list.get(i).getFoodImage()%>" class="img-fluid foodImgTag"></a>
                                    </figure>
                                    <%
                                       dto = dao.getFoodInfo(list.get(i).getFoodNum());
                                    %>
                                    <div class="block-4-text p-4">
                                       <h5>
                                          <a href="<%= request.getContextPath() %>/sub/shop/shop_single.jsp?foodNum=<%= list.get(i).getFoodNum() %>" class="foodNameTag"><%=dto.getFoodName()%></a>
                                       </h5>
                                       <p class="mb-0 foodCaloryTag" ><%=dto.getFoodCalory()%> kcal</p>
                                       <p class="text-primary font-weight-bold foodPriceTag"><%=dto.getFoodPrice()%> ¿ø</p>
                                    </div>
                                 </div>
                              </div>
                              <script>
		                           arr.push({id : <%= dto.getFoodNum()%>, price : <%= dto.getFoodPrice()%>, img : '<%= dto.getFoodImage()%>', calory : <%= dto.getFoodCalory()%>, name : '<%= dto.getFoodName()%>'});
		                      </script>
                     <%
                           }
                     %>
                           
                  </div>
				<script>
                     var orderFunc = function() {
                        arr.sort(function(a,b){
                           return a['price'] - b['price'];
                        });
                        
                        for ( var i = 0 ; i < arr.length ; i++ ) {
                           foodImgTag[i].src = "/FOOD/" + arr[i].img;
                           foodNameTag[i].textContent = arr[i].name;
                           foodCaloryTag[i].textContent = arr[i].calory + ' kcal';
                           foodPriceTag[i].textContent = arr[i].price + ' ¿ø';
                        }
                        
                     };
                     var orderFunc2 = function() {
                        arr.sort(function(a,b){
                           return b['price'] - a['price'];
                        });
                        for ( var i = 0 ; i < arr.length ; i++ ) {
                           foodImgTag[i].src = "/FOOD/" + arr[i].img;
                           foodNameTag[i].textContent = arr[i].name;
                           foodCaloryTag[i].textContent = arr[i].calory + ' kcal';
                           foodPriceTag[i].textContent = arr[i].price + ' ¿ø';
                        }
                     }
                     var lowTohigh = document.getElementById('lowTohigh');
                     var highTolow = document.getElementById('highTolow');
                     var foodImgTag = document.getElementsByClassName('foodImgTag');
                     var foodNameTag = document.getElementsByClassName('foodNameTag');
                     var foodCaloryTag = document.getElementsByClassName('foodCaloryTag');
                     var foodPriceTag = document.getElementsByClassName('foodPriceTag');
                     
                     lowTohigh.addEventListener('click', orderFunc.bind(this), false);
                     highTolow.addEventListener('click', orderFunc2.bind(this), false);
                  </script>


               </div>

            <jsp:include page="sub_shop_category.jsp"></jsp:include>
            </div>


         </div>



      </div>
   </div>
   <%@ include file="/sub/sub_footer.jsp"%>

   <%@ include file="/sub/sub_bottom_js.jsp"%>