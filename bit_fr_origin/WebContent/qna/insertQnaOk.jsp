
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href ="qna/style.css">
<title>Insert title here</title>
</head>
<body>
<c:if test="${re > 0}">
	<h2>등록완료</h2>
</c:if>

<c:if test="${re < 0}">
	<h2>등록실패</h2>
</c:if>
<p><a href = "listQna.do">돌아가기</a></p>


</body>
</html>