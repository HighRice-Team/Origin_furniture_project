<%@page import="com.bit_fr.vo.MemberVo"%>
<%@page import="com.bit_fr.dao.MemberDao"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("utf-8");
   String id = request.getParameter("member_id");
   String pwd = request.getParameter("pwd");
   String str="";
   MemberDao dao = MemberDao.getInstance();   
   
	if (id != null && !id.equals("")) {
		int re = dao.existMember(id);
		if (re > 0) {
			MemberVo v = dao.getOne(id);
			boolean compare = v.getPwd().equals(pwd);
			if (!compare) {
				str = "비밀번호가 일치하지 않습니다.";
			}else{
			HttpSession session2 = request.getSession();
			session2.setAttribute("id", id);
			session2.setAttribute("pwd", pwd);
			}
		}else{
			str = "아이디가 존재하지 않습니다.";
		}
	}
	str ="{\"str\":\""+str+"\"}";
%>
<%=str%>