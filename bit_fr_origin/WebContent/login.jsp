<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="./css/jquery-ui.min.css">
<title>Insert title here</title>
</head>
<body>
	<div style="margin: 0 15% 0 15%; padding: 40px 0 40px 0;">
		<h2>LOGIN</h2><hr>
		<h5>${str }</h5>
		<form action="login.do" method="post">
			<table style="margin: 0 35% 0 35%">
				<tr>
					<td width="25%">아이디
					<td width="*"><input type="text" name="id" required="required">
				</tr>
				<tr>
					<td>패스워드
					<td><input type="password" name="pwd" required="required">
				</tr>
			</table>
			<input type="submit" value="로그인">
		</form>
	</div>
</body>
</html>
