<!-- 아이디 전달값 수정 필요 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/jquery-ui.min.css">
<link rel="stylesheet" href="./product/fancybox/jquery.fancybox-1.3.4.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.7.0.min.js"></script>
<script type="text/javascript" src="product/fancybox/jquery.fancybox-1.3.4.js"></script>
<script type="text/javascript" src="product/fancybox/jquery.easing-1.3.pack.js"></script>
<script type="text/javascript" src="product/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
   $(function(){
      $("#main_img").fancybox();
      $("#loginDialog").dialog({
            autoOpen:false,
            modal:true,
            resizable:false,
            buttons:{
               "로그인":function(){
                  var id = $("#login_member_id").val()
                  var pwd = $("#login_pwd").val()
                  var data = {"member_id":id,"pwd":pwd};
                  $.ajax({
                     url:"login/loginAjax.jsp",
                     data:data,
                     success:function(data){
                        data = eval("("+data+")");
                        if(data.str==""){
                           location.href="";
                           $("#loginDialog").dialog("close")
                        }else{
                           $("#msg").html("*"+data.str);
                        }
                     }
                  })
               },
               "취소":function(){
                  $("#loginDialog").dialog("close")
               },
               "회원가입":function(){
                  
               }
            }
         });
         $("#login").click(function(){
            $("#loginDialog").dialog("open");
         })
         

         $("#cal").dblclick(function(){
           var rent_start = $("#cal").val()
           var d = new Date()
           milli = d.setMilliseconds(rent_start)
           
           
         })
         
         var d = new Date();
         $("#day").html(d.getFullYear()+"년 "+(eval(d.getMonth())+1)+"월 "+(eval(d.getDate())+2))
         rent_start = d.getFullYear()+""+(eval(d.getMonth())+1)+""+(eval(d.getDate())+2)
       
   })
   function cart(){
      month = $("#rentMonth").val()
      if(month=="대여기간"){
         alert("대여기간을 선택하시오.");
         return
      }
       var id = '<%=session.getAttribute("id")%>'
      if(id!="null"){
         
         month = $("#rentMonth").val();
         product_id = $("#product_id").val()
         var data ={"rent_month":month,"product_id":product_id};
          $.ajax({
             url:"orderlist/insertOrderListAjax.jsp",
             data:data,
             success:function(data){
                data = eval("("+data+")");
                if(data.re==1){
                   if(confirm("이미 등록한 상품입니다. 장바구니로 이동하시겠습니까?")){
                      location.href="cartList.do";
                   }                   
                }else{
                   if(confirm("장바구니에 추가하였습니다. 장바구니로 이동하시겠습니까?"))
                   {
                       location.href="cartList.do";
                   }
                }
             }
                
          })
            
      }else{
            if(confirm("로그인이 필요한 서비스 입니다.\n 로그인 하시겠습니까?","a")){
               $("#loginDialog").dialog("open");
            }
      }
      
   }
   
   function payment_info(){
      product_id=$("#product_id").val();
      month = $("#rentMonth").val();
//        price = $("#price").val();
      var id = '<%=session.getAttribute("id")%>'
      if(id=="null"){
         if(confirm("로그인이 필요한 서비스 입니다.\n 로그인 하시겠습니까?","a")){
            $("#loginDialog").dialog("open");
         }
      }else{
         if(month=="대여기간"){
            alert("대여기간을 선택하시오.");
            return
         }         
         if(confirm("구매 화면으로 이동하시겠습니까?")){
            
             location.href="paymentInfo.do?product_id="+product_id+"&rentMonth="+month+"&rent_start="+rent_start;
            
         }
      }
     
      
      
   }
</script>
</head>
<body>
   <div style="margin: 0 15% 0 15%; padding: 40px 0 40px 0;">
      <h2>
         <a href="product.do?item=${v.getItem() }">${v.getItem() }</a>
      </h2><hr>
      <div style="width: 100%; height: 300px;">
         <div style="width: 35%; float: left; margin-left: 5%" >
            <a id="main_img" rel="fancybox" href="img/product/${v.getMain_img()}">
               <img src="img/product/${v.getMain_img()}"style="width: 100%; height: 300px;">
            </a>
         </div>
         <div style="width: 55%;float: right; text-align: right; margin: 25px 5% 0 0">
            <input type="hidden" value="${v.getProduct_id() }" id="product_id">
            <input type="hidden" value="${member_id }" id="member_id"> 
            <input type="hidden" value="${v.getPrice() }" id="price">
            ${v.getItem() }
            <h2> ${v.getProduct_name() }</h2><br><br> 
            가격  : ${v.getPrice() }&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;
               <select id="rentMonth">
                  <option selected="selected" disabled="disabled">대여기간</option>
                  <option value=6>6개월</option>
                  <option value=7>7개월</option>
                  <option value=8>8개월</option>
                  <option value=9>9개월</option>
                  <option value=10>10개월</option>
                  <option value=11>11개월</option>
                  <option value=12>1년</option>
               </select><br><br>
               <!-- <p>대여 시작일 : <input type="date" id="cal"></p> 대여 시작일은 <span id="day"></span>일 입니다.<br><br>-->
                <c:if test="${v.getMember_id()!=sessionScope.id}">
                  &nbsp;&nbsp;&nbsp;<input type="button" value="장바구니"
                  onclick="cart()">&nbsp;&nbsp;&nbsp;
                  <input type="button" value="물품 대여" onclick="payment_info()">
            </c:if>
         </div>
      </div><hr>
      <div style="background-color: grey;">
         <h1>Sub영역</h1>
      </div>
   </div>
   
   <div id="loginDialog" title="로그인">
      <form id="loginForm">
         <table>
            <tr>
               <td>ID:</td>
               <td><input type="text" id="login_member_id"
                  name="login_member_id"></td>
            </tr>
            <tr>
               <td>PW:</td>
               <td><input type="password" id="login_pwd" name="login_pwd"></td>
            </tr>
            <tr>
               <td colspan="2" style="color: red" id="msg"></td>
            </tr>
         </table>
      </form>
      <br>
   </div>
</body>
</html>