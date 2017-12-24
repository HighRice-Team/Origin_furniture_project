<%@page import="java.awt.print.Printable"%>
<%@page import="com.bit_fr.vo.ProjectJoinVo"%>
<%@page import="com.bit_fr.dao.ProjectDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="margin: 0 15% 0 15%; padding: 40px 0 40px 0;">
	<h2>JOIN</h2><hr>
	
	<%
		request.setCharacterEncoding("EUC-KR");

		String name = request.getParameter("name");
		String jumin = request.getParameter("jumin");

		ProjectDao dao = ProjectDao.getInstance();
		ProjectJoinVo c = dao.joinCheck2(name, jumin);

		try {
	%>
	<center><%
			if (c != null) { %>
				<%=name%>님에 아이디는 <b><%=c.getMember_id()%></b> 입니다.
				<form method="post" action="main.jsp">
				<p><input type="submit" value="메인으로..">
	<%		} 
			else {			session.setAttribute("name", name);
		        session.setAttribute("jumin", jumin);
				%>
				<form method="post" action="insertMemberJoin.do">
				<p><input type="submit" value="가입진행">

	<%		}
	%>
			
		</form>
	</center>
	<%
	} catch (Exception e) {
	}
%></div>
</body>
</html>