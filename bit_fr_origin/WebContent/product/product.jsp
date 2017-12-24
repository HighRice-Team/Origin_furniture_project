<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
 h4 { text-align: right;
	
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
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	$(function(){
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
	})
	
</script>
</head>
<body>
		<div style="margin: 0 15% 0 15%; padding: 40px 0 40px 0; ">
		
		<div><a href="product.do?item=${item }">${item}</a></div><hr id="hr">
		<div>
			<h4><a href="product.do?order=quality&item=${item }">품질등급순</a>&nbsp;&nbsp;<a href="product.do?order=price_min&item=${item }">낮은가격순</a>&nbsp;&nbsp;<a href="product.do?order=price_max&item=${item }">높은가격순</a></h4>  
		</div>
			<table width="70%" cellpadding="4" cellspacing="4">
				<tr>
					<c:forEach items="${list }" var="list">
						<td class="hover1" width="25%" height="250px" bgColor="#DDDDDD"><a href="productDetail.do?product_id=${list.product_id }"><br>${list.product_name }<br><img src="img/product/${list.quality }"class="item_img"><br>${list.item }<br>\ ${list.price }</a></td>
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
		<div>
			<c:forEach var="pageNum" begin="1" end="${pageMax }">
					<a href="product.do?pageNum=${pageNum }&item=${item}&order=${order}">${pageNum}</a>
			</c:forEach>
		</div></div>
</body>
</html>