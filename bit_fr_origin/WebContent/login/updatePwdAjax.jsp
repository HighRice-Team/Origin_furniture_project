<%@page import="com.bit_fr.dao.MemberDao"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String member_id = (String)session.getAttribute("id");
	String pwd = request.getParameter("pwd");
	MemberDao dao = MemberDao.getInstance();
	int re = dao.updatePwd(member_id, pwd);
%>