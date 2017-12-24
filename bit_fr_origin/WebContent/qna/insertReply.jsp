<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href ="qna/style.css">
<title>Insert title here</title>
</head>
<body>
	<div style="margin: 0 15% 0 15%; padding: 40px 0 40px 0;">
	<h2>답글 페이지입니다.</h2>
	<hr>
	<form action = "insertReplyOk.do" method = "post">
		<input type="hidden" name = "b_ref" value = "${b_ref}">
		제목 : <input type ="text" name = "title"><br>
		<input type = "hidden" name = "member_id"><br>
		내용 : <br>
		<textarea rows="10" cols="50" name = "content"></textarea><br>
		<input type="submit" value = "제출">
	</form></div>
</body>
</html>