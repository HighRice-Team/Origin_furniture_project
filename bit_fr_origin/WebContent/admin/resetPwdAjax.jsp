<%@page import="com.bit_fr.dao.MemberDao"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDao dao = MemberDao.getInstance();
	String member_id = request.getParameter("member_id");
	int re = dao.resetPwd(member_id);
%>