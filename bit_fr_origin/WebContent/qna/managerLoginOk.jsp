<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
	h2{
		text-align: center;
	}
	
	p{
		text-align: center;
	}
</style>
<title>Insert title here</title>
<script type="text/javascript">

function back(){
	history.back();	
}

function login(){
	location.href = "managerLogin.do";
}

function manager(){
	location.href = "productList.do"
}
	
</script>
</head>
<body>
	<c:if test="${re == 1 }">
		<h2>로그인 성공</h2>
	</c:if>
	
	<c:if test="${re != 1 }">
		<h2>로그인 실패</h2>
	</c:if>
	
	<c:if test="${re == 1 }">
		<p><button onclick = "manager()">관리자 페이지</button></p>
	</c:if>
	
	<c:if test="${re != 1 }">
		<p><button onclick = "login()">관리자 로그인 페이지</button></p>
	</c:if>
	
	
	<p><button onclick="back()">뒤로가기</button></p>
</body>
</html>