<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>RESET PASSWORD CONFIRM</h2>
	<hr>
	<c:if test="${re>0}">
	비밀번호 초기화 성공</c:if><br>
	<c:if test="${re<=0}">
	비밀번호 초기화 실패</c:if><br>
	<a href="memberList.do">회원 목록 보기</a><br>
</body>
</html>