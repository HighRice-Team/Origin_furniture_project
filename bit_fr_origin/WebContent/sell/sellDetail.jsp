<%@page import="java.util.ArrayList"%>
<%@page import="com.bit_fr.vo.SellVo"%>
<%@page import="com.bit_fr.dao.SellDao"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>SELL DETAIL</h2>
	<hr>
		제목: ${p.product_name}<br>
		분류: ${p.item}<br>
		품질: ${p.quality}<br>
		대표이미지: ${p.main_img}<br>
		<c:if test="${fn.length(p.main_img)!=0}">
			<img src="img/product/${p.main_img}" width="200">
		</c:if>
		<hr>
		상세이미지: <br>
		<img src="img/product/${p.sub_img}" width="400"><br>
		<a href="sellList.do">목록</a>&nbsp;&nbsp;
		<a href="sellUpdate.do?product_id=${p.product_id}">수정</a>&nbsp;&nbsp;
		<a href="sellDelete.do?product_id=${p.product_id}">삭제</a>&nbsp;&nbsp;
</body>
</html>