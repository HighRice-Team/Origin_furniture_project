<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	HttpSession session2 = request.getSession();
	session2.invalidate();
%>