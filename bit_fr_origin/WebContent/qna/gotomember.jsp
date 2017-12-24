<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href ="qna/style.css">
<style type="text/css">
	p{
		text-align: center;
	}
	h2{
		text-align: center;
	}
</style>
<script type="text/javascript">
	function back(){
		history.back();	
	}
	function login(){
		location.href = "login.do";
	}
	function join(){
		location.href = "join.do"
	}
</script>

</head>
<body>
	<div style="margin: 0 15% 0 15%; padding: 40px 0 40px 0;">
	<h2>PLEASE LOGIN</h2><hr>
	
	${str}
	
	</div>
</body>
</html>