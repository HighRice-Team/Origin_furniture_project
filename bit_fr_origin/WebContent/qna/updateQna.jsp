<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href ="qna/style.css">
</head>
<body>	<div style="margin: 0 15% 0 15%; padding: 40px 0 40px 0;">
	<h2>게시글 수정</h2>
	<hr>
	
	<form action = "updateQnaOk.do" method = "post">
		<div style = "text-align: left;">
		제목  <input type ="text" name = "title" value="${q.title}" class = "ui-widget-content"><br>
		</div>
		<input type = "hidden" name = "member_id" value="${q.member_id}">
		<input type = "hidden" name = "board_id" value="${q.board_id}"><br>
		<div style = "text-align: left;">
		<p style = "text-align: left">내용 </p>
		&nbsp;&nbsp;&nbsp;<textarea rows="20" cols="90" name = "content" class = "ui-widget-content">${q.content }</textarea><br>
		</div>
		<br>
		<input type="submit" value = "제출">
	</form></div>
</body>
</html>