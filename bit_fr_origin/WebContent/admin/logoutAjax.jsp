<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	HttpSession session3 = request.getSession();
	session3.invalidate();
%>