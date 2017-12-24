<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body><div style="margin: 0 15% 0 15%; padding: 40px 0 40px 0; ">
	<h2>비밀번호 입력</h2>
	<br><br><br>
	<form action="productDeleteOk.do" method="post">
		<center><input type="text" name="input_pwd"></center>
		<input type="hidden" value="${product_id }" name="product_id">
		<center><input type="submit" value="확인"></center>
	</form>
	</div>
</body>
</html>