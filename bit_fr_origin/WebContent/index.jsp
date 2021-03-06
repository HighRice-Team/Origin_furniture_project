<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="./css/jquery-ui.min.css">
<style type="text/css">
.slide-box {
   width: 600px;
   height: 400px;
   margin: auto;
   overflow: hidden;
   position: relative;
}
.slide-box img {
   width: 100%;
   height: 100%;
   display: block;
   position: absolute;
   top: 0px;
   left: -100%;
}
.over {
      
      background-color:#606060;  
      text-align:center; transition:all 0.8s, color 0.3s 0.3s;  
      color:#504f4f; cursor: pointer;  
   }

.over:hover{
      box-shadow:
         400px 0 0 0  rgba(0,0,0,0.25) inset, 
         -400px 0 0 0  rgba(0,0,0,0.25) inset;
   }
   .over a{
   color : white;
/*.over{
   background-color: #606060;
   
}
.over a{
   color : white;
}*/
</style>
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.7.0.min.js"></script>
<script type="text/javascript" src = "./js/jquery-ui.min.js"></script>
<script type="text/javascript">
   
   $(function() {
      if($("#item2").val()!="")
       {   $("select[name=item]").val($("#item2").val())   }
       if($("#max2").val()!=0)
       {   $("select[name=max]").val($("#max2").val())   }
       if($("#min2").val()!=0)
       {   $("select[name=min]").val($("#min2").val())   }
       if($("#quality2").val()!="")
       {   $("select[name=quality]").val($("#quality2").val())   }
      
       $(document).on("mouseover",".hover1",function(){
         $(this).addClass("over");
      })
      $(document).on("mouseout",".hover1",function(){
         $(this).removeClass("over");
      })
      
      $(".item_img").css("width",$("#hr").width()*0.24)
      $(".item_img").css("height",$("#hr").width()*0.13)
      $(window).resize(function(){
         $(".item_img").css("width",$("#hr").width()*0.24)
         $(".item_img").css("height",$("#hr").width()*0.13)
      })
      
      var auto_slide;
      var auto_time = 1000; // 슬라이드 시간 1000 = 1초
      var auto_num = 0;

      $(".slide-box img").eq(auto_num).css({"left" : "0%"}); // 처음로드시 첫이미지 보이기
      auto_slide = setInterval(function() {
         slide_start()
      }, auto_time);

      function slide_start() { // 슬라이드 구현
         var no = auto_num + 1;
         if (no >= $(".slide-box img").length) {
            no = 0;
         }
         $(".slide-box img").eq(no).css({
            "left" : "-100%"
         }).stop().animate({
            "left" : "0%"
         });
         $(".slide-box img").eq(auto_num).stop().animate({
            "left" : "100%"
         });
         auto_num = no;
      }
      $(".slide-box").hover(function() { // 마우스 오버시 슬라이드 멈춤
         clearInterval(auto_slide);
      }, function() { // 마우스 아웃시 다시 시작
         auto_slide = setInterval(function() {
            slide_start()
         }, auto_time);
      });

   });
</script>
</head>
<body>
   <div class="slide-box" style="width: 100%; height: 300px; position: relative;">
      <a href="#"><img src="img/slide1.jpg" alt="slide"></a>
      <a href="#"><img src="img/slide2.jpg" alt="slide"></a> 
      <a href="#"><img src="img/slide3.jpg" alt="slide"></a> 
      <a href="#"><img src="img/slide4.jpg" alt="slide"></a>
   </div>
      <div style="margin: 0 15% 0 15%; padding: 40px 0 40px 0; ">
   <form action="index.do" method="post" name="F">
      <select name="item"> 
         <option value=null disabled="disabled" selected="selected">분류</option>
         <option value="">선택 안함</option>
         <option value='SOFA'>소파</option>
         <option value='BED'>침대</option>
         <option value='CLOSET'>옷장</option>
         <option value='DESK'>책상</option>
      </select>
      <select name="quality"> 
         <option value=null disabled="disabled" selected="selected">품질</option>
         <option value="">선택 안함</option>
         <option value='A'>A급</option>
         <option value='B'>B급</option>
         <option value='C'>C급</option>
      </select>
       <select name="min" onchange="cus()"> 
         <option value=null disabled="disabled" selected="selected">최저금액</option>
         <option value=0>선택 안함</option>
         <option value=1000>1,000~</option>
         <option value=3000>3,000~</option>
         <option value=5000>5,000~</option>
         <option value=7000>7,000~</option>
      </select>
      <select name="max" id="max">
         <option value=null disabled="disabled" selected="selected">최고금액</option>
         <option value=0>선택 안함</option>
         <option value=1>~1,000</option>
         <option value=3000>~3,000</option>
         <option value=5000>~5,000</option>
         <option value=7000>~7,000</option>
         <option value=9000>~9,000</option>
      </select>      
      <input type="submit" value="검색">
      
      <br><br>
      <c:if test="${list==null }"><jsp:forward page="index.do"></jsp:forward> </c:if>
      <table width="70%" border="0" cellpadding="4" cellspacing="4">
         <tr>
         <c:forEach items="${list }" var="list">
               <td class="hover1" width="17%" height="250px" bgColor="#DDDDDD"><a href="productDetail.do?product_id=${list.product_id }"><br>${list.product_name }<br><br><img src="img/product/${list.main_img }" class="item_img"><br>${list.item }<br>${list.quality }<br>\ ${list.price }</a></td>
            
            <c:if test="${list.rownum%4==0 }">
               </tr>
               <tr>
            </c:if>
         </c:forEach>
         <c:if test="${len%4!=0}">
            <c:forEach var="i" begin="1" end="${4-(len%4) }">
               <td></td>
            </c:forEach>
         </c:if>
         </tr>
      </table>
      <center>
         <c:forEach var="pageNum" begin="1" end="${pageMax }">
               <a href="index.do?pageNum=${pageNum }&item=${item}&quality=${quality}&max=${max }&min=${min }">${pageNum}</a>
         </c:forEach>
      </center>
      <hr id="hr" style="visibility: hidden;">
   </form>
   <input type="hidden" id="item2" value="${item }">   
   <input type="hidden" id="max2" value="${max }">   
   <input type="hidden" id="min2" value="${min }">   
   <input type="hidden" id="quality2" value="${quality }">   </div>
</body>
</html>