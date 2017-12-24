<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center><h2>${str }</h2><a href="myPage.do">MyPage</a>
		<c:if test="${str=='비밀번호 오류' }"><a href="productDelete.do?product_id=${product_id }">비밀번호 다시 입력하기</a></c:if>
	</center>
</body>
</html>