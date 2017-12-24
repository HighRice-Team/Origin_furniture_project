
<%@page import="com.bit_fr.dao.OrderListDao"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	HttpSession session2 = request.getSession();
	int product_id = Integer.parseInt(request.getParameter("product_id"));
	int rent_month = Integer.parseInt(request.getParameter("rent_month"));
	String member_id=(String)session.getAttribute("id");
	
	OrderListDao dao = OrderListDao.getInstance();
	int re = dao.updateOne(member_id, product_id, rent_month);
	String str = "{\"re\":\""+re+"\"}";			
%>
<%=str%>