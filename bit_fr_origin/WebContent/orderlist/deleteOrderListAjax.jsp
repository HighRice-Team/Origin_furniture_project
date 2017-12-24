<%@page import="com.bit_fr.dao.OrderListDao"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	HttpSession session2 = request.getSession();
	String member_id = (String)session2.getAttribute("id");
	int product_id = Integer.parseInt(request.getParameter("product_id"));
	OrderListDao dao = OrderListDao.getInstance();
	int re = dao.deleteOne(member_id, product_id);
	String str = "{\"re\":\""+re+"\"}";
%>
<%=str%>
