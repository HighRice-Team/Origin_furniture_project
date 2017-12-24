<%@page import="com.bit_fr.dao.ManagerDao"%>
<%@page import="com.bit_fr.vo.ManagerVo"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("utf-8");
   String id = request.getParameter("id");
   String pwd = request.getParameter("pwd");
   String str="";
   ManagerDao dao = ManagerDao.getInstance();   
   
	if (id != null && !id.equals("")) {
		int re = dao.existMember(id);
		if (re > 0) {
			ManagerVo v = dao.getOne(id);
			boolean compare = v.getPwd().equals(pwd);
			if (!compare) {
				str = "비밀번호가 일치하지 않습니다.";
			}else{
			HttpSession session3 = request.getSession();
			session3.setAttribute("mid", id);
			session3.setAttribute("mpwd", pwd);
			
			}
		}else{
			str = "아이디가 존재하지 않습니다.";
		}
	}

	str ="{\"str\":\""+str+"\"}";
%>
<%=str%>