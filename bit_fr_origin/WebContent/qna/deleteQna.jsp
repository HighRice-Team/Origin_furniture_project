<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href ="qna/style.css">
</head>
<body>
	<h2>정말로 삭제하시겠습니까?</h2>
	
	<p><a href = "deleteQnaOk.do?board_id=${q.board_id}">예</a><p>
	<p><a href = "listQna.do">아니오</a><p>
</body>
</html>