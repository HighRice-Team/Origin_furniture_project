<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function checkValue() {
		var form = document.JoinInfo;
		if (!form.name.value) {
			alert("이름을 입력하세요");
			//inputForm.name.focus();
			return false;
		}
		if (!form.jumin.value) {
			alert("주민번호를 입력하세요");
			//inputForm.jumin.focus();
			return false;
		}
	}

	// 취소 버튼 클릭시 첫화면으로 이동
	function goLogin() {
		history.go(-1);
	}
</script>
</head>
<body>
	<div style="margin: 0 15% 0 15%; padding: 40px 0 40px 0;">
	<h2>JOIN</h2><hr>
	<form name="JoinInfo" method="post" action="joinOk.do" onsubmit="return checkValue()">
		<table align="center" width="400" height="200" border="1" cellpadding="0" cellspacing="0">
			<tr>
				<td align="center">주민번호 인증이 필요합니다.<br> <br> 
				이름 : <input type="text" name="name"><br> <br> 
				주민번호 : <input type="text" name="jumin"></td>
			</tr>
		</table>
		<p align="center">
			<input type="button" value="이전" onclick="goLogin()">
			<input type="submit" value="다음">
		</p>
	</form>
 	</div>
</body>
</html>