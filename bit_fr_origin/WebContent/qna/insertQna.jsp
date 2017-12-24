<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href ="qna/style.css">
<link rel="stylesheet" href="./css/ui.jqgrid.css">
<link rel="stylesheet" href="./css/jquery-ui.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.7.0.min.js"></script>
<script type="text/javascript" src = "./js/jquery-ui.min.js"></script>
<script type="text/javascript" src = "./js/i18n/grid.locale-en.js"></script>
<script type="text/javascript" src = "./js/jquery.jqGrid.min.js"></script>
</head>
<body>	<div style="margin: 0 15% 0 15%; padding: 40px 0 40px 0;">
	<h2>게시글 입력</h2>
	<hr>
	
	<form action = "insertQnaOk.do" method = "post">
		<p style="text-align: left;">
		제목 &nbsp; <input type ="text" name = "title"  class = "ui-widget-content"><br>
		<!--아이디  : <input type = "text" name = "member_id"><br>   -->
		</p>
		<p style="text-align: left">
		내용<br>
		<textarea rows="20" cols="90" name = "content" class = "ui-widget-content"></textarea><br>
		</p>
		<br>
		<input type="submit" value = "제출">
	</form></div>
</body>
</html>