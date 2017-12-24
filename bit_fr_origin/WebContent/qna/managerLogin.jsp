<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href ="qna/style.css">
</head>
<body>
	
	<h2>관리자 로그인 페이지입니다.</h2>
	
	<form action="managerLoginOk.do" method = "post">
		<center>아이디 : <input type="text" name = "manager_id"><br></center>
		<br>
		<center>비밀번호 : <input type="text" name = "manager_pwd"><br></center>
		<br>
		<center><input type="submit" value="로그인"></center>
	</form>
	
</body>
</html>