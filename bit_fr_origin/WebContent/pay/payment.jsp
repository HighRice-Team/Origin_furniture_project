<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/jquery-ui.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.7.0.min.js"></script>
<script type="text/javascript" src = "./js/jquery-ui.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#paymentBtn").click(function(){
			var pwd = $("#pwd").val()
			var price = $("#price").val();
			var pwd2 = $("#pwd2").val();
			var product_id = $("#product_id").val();
			var rent_start = $("#rent_start").val();
			data={"pwd":pwd,"price":price,"pwd2":pwd2,"product_id":product_id, "rent_start":rent_start}
			$.ajax({
				url:"./pay/paymentOkAjax.jsp",
				data:data,
				success:function(data){
					data=eval("("+data+")");
					alert(data.str)
					if(data.str=="결제완료"){
						location.href="myPage.do"
					}
				}
			})
		})
	})
</script>
</head>
<body>
	<center><h1>결제창</h1></center><hr>
	<center><table width="40%">
		<tr style="height: 100px;">
			<td>결제 금액</td>
			<td><input type="text" readonly="readonly" value="${price}"  name="price" id="price">원</td>
		</tr>
		<tr style="height: 100px;">
			<td>로그인 시 비밀번호</td>
			<td><input type="password" name="pwd" id="pwd"></td>
		</tr>
	</table></center>
			<input type="hidden" name="pwd2" id="pwd2" value="${pwd }">
			<input type="hidden" name="product_id" id="product_id" value="${product_id }">
			<input type="hidden" name="rent_start" id="rent_start" value="${rent_start }">
	<center><button id="paymentBtn">결제</button></center>
</body>
</html>