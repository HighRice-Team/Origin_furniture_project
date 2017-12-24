<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.7.0.min.js"></script>
<script type="text/javascript">
		$(function(){
			$("#goHome").click(function(){
				location.href="main.jsp";
			})
			
			$("#goInput").click(function(){
				location.href="updateMember.do";
			})
			
		})
</script>
</head>
<body>
	<center><h3>${str }</h3></center>
	<c:if test="${str=='회원정보 변경 성공' }"><center><input type="button" value="홈으로" id="goHome"></center></c:if>
	<c:if test="${str=='비밀번호가 틀렸습니다.' }"><center><input type="button" value="다시 입력하기" id="goInput"><input type="button" value="홈으로" id="goHome"></center></c:if>
	<c:if test="${str=='입력한 두 비밀번호가 일치하지 않습니다.' }"><center><input type="button" value="다시 입력하기" id="goInput"><input type="button" value="홈으로" id="goHome"></center></c:if>
</body>
</html>