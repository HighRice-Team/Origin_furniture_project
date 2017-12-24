<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/jquery-ui.min.css">

<script type="text/javascript" src="https://code.jquery.com/jquery-1.7.0.min.js"></script>
<script type="text/javascript" src = "./js/jquery-ui.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		 var d = new Date();
         $("#rent").html(d.getFullYear()+"년 "+(eval(d.getMonth())+1)+"월 "+(eval(d.getDate())+2))
		
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
		
		$("#updateBtn").click(function(){
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
		
		$("#payment").click(function(){
			price=$("#price").html()
			product_id=$("#product_id").val()
			rent_start=$("#rent_start").val()
			
			location.href="payment.do?price="+price+"&product_id="+product_id+"&rent_start="+rent_start;
		});
		$("#reset").click(function(){
			if(confirm("이전 페이지로 돌아가시겠습니까?")){
				location.href="productDetail.do?product_id="+$("#product_id").val()
			}
			
		});
	});
</script>
</head>
<body>
	<table border="1" width="100%" cellspacing="30px">
		<tr>
			<td style="width: 40%; height: 500px; background-color: grey;"><h1><center>이미지영역</center></h1></td>
			<td style="font-variant: normal;">
					<input type="hidden" id="product_id" value="${v.getProduct_id() }">
					<input type="hidden" id="rent_start" name="rent_start" value="${rent_start }">
					<h2>물품 정보</h2>
					<h4>제목:  ${v.getProduct_name() }</h4>
					<h4>분류:  ${v.getItem() }</h4>
					<h4>기간:  ${rent_month }</h4>
					<h4>가격:  ${v.getPrice()}</h4>
					총 가격:<span id="price">${v.getPrice()*rent_month}</span><br><br>
					<h2>구매 정보</h2>
					<h4>이름:  ${mem_v.getName() }</h4>
					<h4>연락처:  ${mem_v.getTel() }</h4>
					<h4>주소:  ${address }</h4>
					<h4>대여 시작일: <span id = "rent"></span>일</h4><br>					
					<input type="button" id="updateBtn" value="회원정보 수정">			
			</td>
		</tr>
	</table>
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
	<center><button id="payment">결제</button>
	<button id="reset">취소</button></center>
</body>
</html>