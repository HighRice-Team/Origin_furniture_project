<%@page import="com.bit_fr.vo.AdminMemberListVo"%>
<%@page import="com.bit_fr.vo.MemberVo"%>
<%@page import="com.bit_fr.dao.MemberDao"%>
<%@page import="com.bit_fr.dao.AdminOrderListDao"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	int re = -1;
	AdminMemberListVo v = new AdminMemberListVo();
	if(request.getParameter("oper").equals("edit")){
		
		v.setMember_id(request.getParameter("ID"));
		v.setName(request.getParameter("name"));
		v.setAddress(request.getParameter("address"));
		v.setTel(request.getParameter("tel"));
		
		MemberDao dao = MemberDao.getInstance();
		re = dao.adminUpdateMember(v);
		re += dao.adminUpdateAddress(v);
		System.out.println(re);
		
	}
	out.print("{re:"+re+"}");
	
%>