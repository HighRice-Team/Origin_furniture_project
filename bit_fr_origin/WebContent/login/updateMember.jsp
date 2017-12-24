<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="./css/jquery-ui.min.css">

<script type="text/javascript" src="https://code.jquery.com/jquery-1.7.0.min.js"></script>
<script type="text/javascript" src = "./js/jquery-ui.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		bank = $('#getBank').val()
		address1 = $("#getAddress1").val()
		address2 = $("#getAddress2").val()
		pwd_q = $("#getPwd_q").val()
		
	  	$("option[value="+bank+"]").attr("selected","selected");
	  	$("option[value="+address1+"]").attr("selected","selected");
	  	$("option[value="+address2+"]").attr("selected","selected");
	  	$("option[value="+pwd_q+"]").attr("selected","selected");		

		$("input[value=돌아가기]").click(function(){
			if(confirm("마이페이지로 이동하시겠습니까?"))
				location.href="myPage.do";
		})
	})
</script>
<title>Insert title here</title>
</head>
<body>
		<div id="dialog">
		<center><h1>회원정보 수정</h1></center><br><br>
		<form action="updateMemberOk.do" method="post">
			<table border="1" cellpadding="5" cellspacing="0" width="100%">
			<tr>
				<td id="title" width="15%">아이디</td>
				<td colspan="3">${v.getMember_id() }</td>
			</tr>

			<tr>
				<td id="title">비밀번호</td>
				<td width="20%"><input type="password" id="j_pwd" name="j_pwd"
					maxlength="50" required="required"></td>
				<td id="title">비밀번호 확인</td>
				<td><input type="password" id="pwdcheck" maxlength="50" name="pwd_chk" required="required"></td>
			</tr>

			<tr>
				<td id="title">이름</td>
				<td colspan="4">${v.getName() }</td>
			</tr>

			<tr>
				<td id="title">주민번호</td>
				<td colspan="4">${v.getJumin() }</td>
			</tr>

			<tr>
				<td id="title">계좌번호</td>
				<td colspan="4"><input type="hidden" name="account_id" value="${v.getAccount_id() }">

				<input type="hidden" value="${account_v.getBank()}" id="getBank">
				<select name="bank">
						<option value="kb">한국은행</option>
						<option value="sh">신한은행</option>
						<option value="nh">농협</option>
						<option value="bs">부산은행</option>
						<option value="wr">우리은행</option>
				</select> <input type="text" name="account" size="40" value="${account_v.getAccoint_no() }" required="required"></td>
			</tr>

			<tr>
				<td id="title">주소</td>
				<input type="hidden" value="${address_v.getAddress1()}" id="getAddress1">
				<input type="hidden" value="${address_v.getAddress2()}" id="getAddress2">
				<td colspan="4"><input type="hidden" name="n2" value="${n2 }">
					<select name="address1">
						<option value="서울시">서울시</option>
						<option value="경기도">경기도</option>
						<option value="충남">충남</option>
						<option value="세종시">세종시</option>
				</select> <select name="address2">
						<option value="마포구">마포구</option>
						<option value="고양시">고양시</option>
						<option value="천안시">천안시</option>
						<option value="다정동">다정동</option>
						<option value="중랑구">중랑구</option>
				</select> <input type="text" name="address3" size="50" value="${address_v.getAddress3() }" required="required"></td>
			</tr>
			<tr>
				<td id="title">핸드폰번호</td>
				<td colspan="4"><input type="text" name="tel" size="50" value="${v.getTel() }" required="required">
				</td>
			</tr>
			<tr>
				<td id="title">비밀번호 힌트</td>
				<input type="hidden" value="${v.getPwd_q()}" id="getPwd_q">
				<td colspan="4"><select name="pwd_q">
						<option value="a">a</option>
						<option value="b">b</option>
						<option value="c">c</option>
						<option value="d">d</option>
						<option value="e">e</option>
						<option value="f">f</option>
						<option value="g">g</option>
						<option value="h">h</option>
						<option value="i">i</option>
				</select></td>
			</tr>
			<tr>
				<td id="title">힌트 답</td>
				<td colspan="4"><input type="text" name="pwd_a" maxlength="50" value="${v.getPwd_a() }" required="required">
				</td>
			</tr>
			
		</table>
			<br><br><center>
			<input type="submit" value="수정">
			<input type="button" value="돌아가기">
			</center>
		</form>
		</div>
</body>
</html>