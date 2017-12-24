<%@page import="java.util.ArrayList"%>
<%@page import="com.bit_fr.vo.SellVo"%>
<%@page import="com.bit_fr.dao.SellDao"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>SELL WRITE CONFIRM</h2>
	<hr>
	<c:if test="${re>0}">
	물품 등록 성공</c:if><br>
	<c:if test="${re<=0}">
	물품 등록 실패</c:if><br>
	<a href="sellList.do">물품 목록 보기</a><br>
</body>
</html>