<%@page import="com.bit_fr.vo.MemberVo"%>
<%@page import="com.bit_fr.dao.MemberDao"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	System.out.println("진입성공");
	String member_id = (String)session.getAttribute("id");
	MemberDao mem_dao = MemberDao.getInstance();
	MemberVo mem_v = mem_dao.getOne(member_id);
	String old_pwd = request.getParameter("oldPwd");
	String input_pwd = request.getParameter("pwd");
	String input_pwd2 = request.getParameter("pwd2");
	
	String pwd = mem_v.getPwd();
	
	String str="";
	if(input_pwd.equals(input_pwd2)){
		if(old_pwd.equals(pwd))
		{
			str = "일치";
		}else{
			str = "비밀번호가 일치하지 않습니다.";
		}
	}else{
		str = "입력한 두 번호가 일치하지 않습니다.";
	}
	
	str="{\"str\":\""+str+"\"}";
%>
<%=str%>