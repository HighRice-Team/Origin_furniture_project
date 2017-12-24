<%@page import="com.bit_fr.vo.CartVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="./css/jquery-ui.min.css">
<style>
   .light{
      background-color: gray;
   }
   input[type=checkbox]{
      vertical-align: middle;
       -ms-transform: scale(1.4);
        -moz-transform: scale(1.4);
        -webkit-transform: scale(1.4);
        -o-transform: scale(1.4);
   }
   #product_id{
      width : 7%;
   }
   
   input[type=number]{
      width : 30px;
   }
   
   img{
      width :200px;
   }
   
   #price, #total{
      width : 15%;
   }
</style>
<title>Insert title here</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.7.0.min.js"></script>
<script type="text/javascript" src = "./js/jquery-ui.min.js"></script>
<script type="text/javascript">
 $(function(){

    $(".goods").hover(function(){
       $(this).addClass("light");
    },function(){
       $(this).removeClass("light");
    })
    
    $("#paymentReset").click(function(){ $("#paymentInfo").dialog("close")})
    $("#paymentChk").click(function(){
       $("#pwdDialog2").dialog("open");
    })
    
    $("#paymentBtn").click(function(){
       if($('input[type=checkbox]:checked').length>0){
          $("#countProduct").text($('input[type=checkbox]:checked').length);
          $("#tot_price").text($("#pay").val());
          $("#mem_name").text($("#memName").val())
          $("#mem_addr").text($("#address1").val()+"\t"+$("#address2").val()+"\t"+$("#address3").val())
          $("#mem_tel").text($("#memTel").val())
          $("#paymentInfo").dialog("open")
       }else{
          alert("상품을 선택하시오.")
       }
    })
    
    $("#deleteBtn").click(function(){
      
      var a = $('input[type=checkbox]:checked');
      var a_len = $(a).length;
       if(confirm(a_len+"건의 상품을 삭제하시겠습니까?")){
         $.each(a,function(index,item){
            var value = $(this).val()
             var par = $(this).parent()
             var tr = $(par).parent()
             var product_id = $(tr).find("#product").val()
            var data = {"product_id":product_id};
             $.ajax({
                url:"orderlist/deleteOrderListAjax.jsp",
                data:data
             });
         })
         location.href="";
      }
   });
    
    $("#paymentInfo").dialog({
       autoOpen:false,
       modal:true,
       autowidth:true
    });
    $("#pwdDialog2").dialog({
          width:400,
         maxWidth:400,
         minWidth:400,
         autoOpen:false,
         modal:true,
         buttons:{
            "확인":function(){
               var pwd = $("#pPwd").val()
               var pwd2 = $("#pPwd2").val()
               var data={"pwd":pwd,"pwd2":pwd2};
               $.ajax({
                  url:"./login/pwdChk.jsp",
                  data:data,
                  success:function(data){
                     data = eval("("+data+")");
                     if(data.str=="일치"){
                        $('input[type=checkbox]:checked').each(function(index,item){
                           var product_id = $(this).val()
                           var data={"product_id":product_id}
                           $.ajax({
                              url:"./orderlist/updateOderlistAjax.jsp",
                              data:data
                           })
                        })
                        alert("결제가 성공적으로 완료되었습니다.");
                        $("#pwdDialog2").dialog("close");
                        $("#paymentInfo").dialog("close");
                        location.href="";
                     }else{
                        alert(data.str)
                     }
                  }
               })
               
            },
            "취소":function(){
               $("#pwdDialog2").dialog("close");
               $("#paymentInfo").dialog("close");
            }
         }
    })
    $("#pwdDialog").dialog({
          width:400,
         maxWidth:400,
         minWidth:400,
         autoOpen:false,
         modal:true,
         buttons:{
            "확인":function(){
               if(confirm("정보를 변경 하시겠습니까?")){
                  $("#pwd_chk").val($("#pwd_chk2").val());
                  $("#j_pwd").val($("#j_pwd2").val());
                  var str="";
                  var data = $("#myForm").serializeArray();
                  $.ajax({url:"./login/updateMemberOkAjax.jsp",data:data,success:function(str){
                     str = eval("("+str+")");
                     alert(str.str)
                     if(str.str=="회원정보 변경 완료")
                     {
                        location.href="";
                        $("#dialog").dialog("close");
                        $("#pwdDialog").dialog("close");                     
                     }            
                  }})   
               }
            },
            "취소":function(){
               $("#pwdDialog").dialog("close");
            }
         }
    })
    $("#dialog").dialog({
         width:800,
         maxWidth:800,
         minWidth:800,
         autoOpen:false,
         modal:true,
         buttons:{
            "수정":function(){         
                  $("#pwdDialog").dialog("open");
   
               
            },
            "취소":function(){
               $("#dialog").dialog("close");
            }
         }
      });
    
    $("#update").click(function(){
       $.getJSON("./login/updateMemberAjax.jsp",function(data){
            $("#name").html(data.name);
            $("#address1").val(data.address1);
            $("#address2").val(data.address2);
            $("#address3").val(data.address3);
            $("#tel").val(data.tel);
            $("#member_id").html(data.member_id);
            $("#jumin").html(data.jumin);
            $("#account_no").val(data.account_no);   
            $("#pwd_a").val(data.pwd_a);
            $("#pwd_q").val(data.pwd_q);
            $("#bank").val(data.bank);
            
         })
         $("#dialog").dialog("open");
    })
    
   
    
    $('input[type = checkbox]').change(function(){
       var sum = 0;
       var a = $('input[type=checkbox]:checked'); 
       
       if(a.length > 0)
       {
          a.each(function(index,item){
             
          var value = $(this).val()
          var par = $(this).parent()
          var tr = $(par).parent()
          sum += Number(tr.find("#total").html())
         $("#count").val(index+1) 
         $("#pay").val(sum)
         $("#product_id").val(value)
           })
       }
       else
       {
          $("#count").val(0) 
            $("#pay").val(0)   
       }
         
      
    })
    
     $('#submit').click(function(){
      $("#count").html() 
      var pay = $("#pay").html()             
    })
    
       $('.btnmon').click(function(){
         var par = ($(this).parent())
         var month = par.find("input[type=number]").val()
         var tr = $(par).parent()
         var price  = $(tr).find("#price").text()
         var product_id = $(tr).find("#product").val()
         
         if(confirm("대여기간을 변경하시겠습니까?")){
            var data = {"rent_month":month,"product_id":product_id};
            $.ajax({
               url:"product/oneOrderListAjax.jsp",
               data:data,
               success:function(data){
                  data = eval("("+data+")");
                  location.href="";
               }
            })
            $(tr).find("#total").html(month * price)  
         }           
       })
   
 })

   
</script>
</head>
<body>
   <div style="margin: 0 15% 0 15%; padding: 40px 0 40px 0;">
   <c:if test="${list==null }"><jsp:forward page="cartList.do"></jsp:forward> </c:if>
   <h2>${mv.member_id }'s CART</h2><hr>
   <hr>
   
   <p>
   <table border="1" width="100%">
      <tr bgcolor="#E6E5ED">
         <td>no</td>
         <td>물품 이름</td>
         <td>물품 이미지</td>
         <td>월별 대여금액</td>
         <td>대여기간</td>
         <td>총금액</td>
      </tr>
      <c:forEach items="${list }" var="list">
         <tr class ="goods">
            <td id = 'product_id'><input type="checkbox" name = "product" id ="product" value = "${list.product_id }">${list.rownum }</td>
            <td id = 'product_name'>${list.product_name }</td>
            <td><img src = "img/product/${list.main_img }"></td>
            <td id = "price" class="price">${list.price }</td>
            <td><input type = "number" value="${list.rent_month }" id = "month">/개월<button class = "btnmon">변경</button></td>
            <td id = "total" class = "total">${list.price*list.rent_month }</td>
         </tr>
         
      </c:forEach>   
   </table>
   <div style="height:30px;  padding-top: 10px;">
   <button id="deleteBtn" style="position: relative; float:right;">삭제</button>
   </div>
   <div style="position: relative;">
         <hr>
   </div>
   <br>
   

   <table id ="mem">
      <tr>
      <td width="10%">이름  </td> 
      <td width="70%"><input type = "text" value = "${mv.name }" readonly = "readonly" id="memName"></td>
      <td rowspan="3"><input type = "button" value = "정보변경" id ="update"><td>
      </tr>
      <tr>
      <td>주소  </td> 
      <td><input type = "text" value = "${adr }" readonly = "readonly"></td>
      </tr>
      <tr>
      <td>연락처 </td>
      <td><input type = "text" value="${mv.tel }" readonly="readonly" id="memTel"></td>
      
   </table>
   <br>
   <hr>
   <br>
   <p>
   <c:forEach items="${list }" var="list">
      <input type= "hidden" name = "product_id" class= "product_id">
   </c:forEach>
   <table border = "1" id = "order">
      <tr>
         <td>선택 건 수</td>
         <td>총 금액</td>
         <td>주문</td>
      </tr>
      <tr>
         <td><input type="text" id = "count" readonly="readonly"></td>
         <td><input type="text" id = "pay" readonly="readonly" name = "price"></td>
         <td><input type="button" value = "주문하기" id="paymentBtn"></td>
         
      </tr>
   </table>
   <br>
   </div>
   <div id="dialog">
      <center><h1>회원정보 수정</h1></center><br><br>
      <form id="myForm">
         <table border="1" cellpadding="5" cellspacing="0" width="100%">
         <tr>
            <td>이름</td>
            <td><label id="name" name="name"></label></td>
         </tr>
         <tr>
            <td>주소</td>
            <td><select id="address1"  name="address1">
                  <option value="서울시">서울시</option>
                  <option value="경기도">경기도</option>
                  <option value="충남">충남</option>
                  <option value="세종시">세종시</option>
               </select> 
               <select id="address2" name="address2">
                  <option value="마포구">마포구</option>
                  <option value="고양시">고양시</option>
                  <option value="천안시">천안시</option>
                  <option value="다정동">다정동</option>
                  <option value="중랑구">중랑구</option>
               </select>
               <input type="text" id="address3" name="address3" size="50" value="" required="required">
            </td>
         </tr>
         <tr>
            <td id="title">핸드폰번호</td>
            <td><input type="text" id="tel" name="tel" size="50" value="" required="required"></td>
         </tr>         
         <input type="hidden" id="bank" name="bank">         
         <input type="hidden" id="account_no" name="account">         
         <input type="hidden" id="pwd_q" name="pwd_q">         
         <input type="hidden" id="pwd_a" name="pwd_a">         
         <input type="hidden" id="member_id" name="id">               
         <input type="hidden" id="j_pwd" name="j_pwd">               
         <input type="hidden" id="pwd_chk" name="pwd_chk">               
      </table>
      </form>
      <form id="myForm2">
         <div id="pwdDialog">
         비밀번호:<input type="password" id="j_pwd2"><br>
         비밀번호 확인:<input type="password" id="pwd_chk2"><br>
         </div>
      </form>
   </div>
   
   <div id="paymentInfo" title="결제">
      <table>
         <tr>
            <td><b>물품 정보</b></td>
            <td></td>
         </tr>
         <tr>
            <td>결제 건 수</td>
            <td><label id="countProduct"></label></td>
         </tr>
         <tr>
            <td>결제 총 금액</td>
            <td><label id="tot_price"></label></td>
         </tr>
         <tr><td><br></td><td></td></tr>
         <tr>
            <td><b>회원 정보</b></td>
            <td></td>
         </tr>
         <tr>
            <td>이름</td>
            <td><label id="mem_name"></label></td>
         </tr>
         <tr>
            <td>주소</td>
            <td><label id="mem_addr"></label></td>
         </tr>
         <tr>
            <td>연락처</td>
            <td><label id="mem_tel"></label></td>
         </tr>
      </table>
      <br><hr><br><center>
      <button id="paymentChk">결제</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <button id="paymentReset">취소</button></center><br>
   </div>
   <div id="pwdDialog2">
         비밀번호:<input type="password" id="pPwd"><br>
         비밀번호 확인:<input type="password" id="pPwd2"><br>
   </div>
      
      
</body>
</html>