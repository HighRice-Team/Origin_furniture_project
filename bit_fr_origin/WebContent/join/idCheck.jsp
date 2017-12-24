<%@page import="javax.swing.text.StyledEditorKit.BoldAction"%>
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
	
	<%
	String id = request.getParameter("id");
	//boolean check = ck.duplcheck(id);
	ProjectDao dao = ProjectDao.getInstance();
	boolean check = dao.duplcheck(id);
	%>
	<title>ID중복체크</title>
	<b><%=id %></b>
	<%
	if(check){ //true라면
		 out.println("는 이미 존재하는 ID입니다.<br><br>사용할 수 없습니다.<p>");
		//out.println("는 사용 가능 합니다.<p>");
     
	}else{ //false라면   
	    out.println("는 사용 가능 합니다.<p>");
	    // out.println("는 이미 존재하는 ID입니다.<br><br>사용할 수 없습니다.<p>");
	}
	
	//out.close();
	%>
	<a href="JavaScript:window.close()">닫기</a>
</body>
</html>