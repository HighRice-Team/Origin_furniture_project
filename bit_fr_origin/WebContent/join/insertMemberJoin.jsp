<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%  request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	function checkValue()
	{
		var form = document.join;
		
		if(!form.id.value){
			alert("아이디를 입력하세요.");
			return false;
			//return;
		}
		
		if(!form.j_pwd.value){
			alert("비밀번호를 입력하세요.");
			return false;
			//return;
		}
		
		if(!form.pwdcheck.value){
			alert("비밀번호 확인을 입력하세요.");
			return false;
			//return;
		}
		
		if(!form.name.value){
			alert("이름을 입력하세요.");
			return false;
			//return;
		}
		
		if(!form.jumin.value){
			alert("주민번호를 입력하세요.");
			return false;
			//return;
		}
		if(!form.account.value){
			alert("은행계좌를 입력하세요.");
			return false;
			//return;
		}
		if(!form.address3.value){
			alert("주소를 입력하세요.");
			return false;
			//return;
		}
		if(!form.tel.value){
			alert("핸드폰번호를 입력하세요.");
			return false;
			//return;
		}
		if(!form.pwd_a.value){
			alert("비밀번호 힌트답을 입력하세요.");
			return false;
			//return;
		}
		
	}
	function idCheck(id){
		if(id == ""){
	        window.alert("아이디를 입력해 주세요.");
	        document.join.id.focus();
	    }else{
	        url="join/idCheck.jsp?id=" + id; //URL Get Method
	        wr = window.open(url,"아이디검색","width=300,height=150");
	        wr.moveTo(x,y);
	    }
	}
	function goFirstForm() {
		location.href="login.do";
	}	
	
	function pwdChk(){
		j_pwd = document.getElementById("j_pwd").value;
		//j_pwd = document.p.j_pwd.value;
		//alert(j_pwd);
		//pwdcheck = document.p.pwdcheck.value;
		pwdcheck = document.getElementById("pwdcheck").value;
		if(!j_pwd  || !pwdcheck){
			alert("비밀번호를 입력하세요.");
			return false;
		}
		
		if(j_pwd != pwdcheck ){
			alert("비밀번호를 동일하게 입력하세요.");
			return;
		}	
		else
		{
			alert("비밀번호 확인되었습니다.");
			return;
		}
	
	}
</script>
</head>
<body>
	<div style="margin: 0 15% 0 15%; padding: 40px 0 40px 0; text-align: left;">
	<h2>JOIN</h2><hr>
	

	<form method="post" action="insertMemberJoinOk.do" name="join"
		onsubmit="return checkValue()">
		<table border="1" cellpadding="0" cellspacing="0" width="100%">
			<tr>
				<td id="title" width="15%">아이디</td>
				<td colspan="3"><input type="text" name="id" maxlength="50">
					<input type="button" value="중복확인"
					onclick="idCheck(this.form.id.value)"> <!-- 					<input type="hidden" name="idDuplication" value="idUncheck" > -->
				</td>
			</tr>

			<tr>
				<td id="title">비밀번호</td>
				<td width="20%"><input type="password" id="j_pwd" name="j_pwd"
					maxlength="50"></td>
				<td id="title">비밀번호 확인</td>
				<td><input type="password" id="pwdcheck" maxlength="50">
					<input type="button" value="확인" onclick="pwdChk()"></td>
			</tr>

			<tr>
				<td id="title">이름</td>
				<td colspan="4"><input type="text" name="name" maxlength="50"
					value="${name }" readonly="true"></td>
			</tr>

			<tr>
				<td id="title">주민번호</td>
				<td colspan="4"><input type="text" name="jumin" maxlength="50"
					value="${jumin }" readonly="true"></td>
			</tr>

			<tr>
				<td id="title">계좌번호</td>
				<td colspan="4"><input type="hidden" name="n" value="${n }">

					<select name="bank">
						<option value="kb">국민은행</option>
						<option value="sh">신한은행</option>
						<option value="nh">농협</option>
						<option value="bs">부산은행</option>
						<option value="wr">우리은행</option>
				</select> <input type="text" name="account" size="40"></td>
			</tr>

			<tr>
				<td id="title">주소</td>
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
				</select> <input type="text" name="address3" size="50"></td>
			</tr>
			<tr>
				<td id="title">핸드폰번호</td>
				<td colspan="4"><input type="text" name="tel" size="50">
				</td>
			</tr>
			<tr>
				<td id="title">비밀번호 힌트</td>
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
				<td colspan="4"><input type="text" name="pwd_a" maxlength="50">
				</td>
			</tr>
		</table>
		<br> <input type="submit" value="회원가입" align="middle"> <input
			type="button" value="취소" onclick="goFirstForm()" align="middle">

	</form>
	</div>
</body>
</html>