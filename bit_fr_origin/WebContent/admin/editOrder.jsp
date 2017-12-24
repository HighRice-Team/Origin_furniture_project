<%@page import="com.bit_fr.dao.AdminOrderListDao"%>
<%@page import="com.bit_fr.dao.OrderListDao"%>
<%@page import="com.bit_fr.vo.OrderListVo"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	int order_id = Integer.parseInt(request.getParameter("order_id")); 
	String rent_start = request.getParameter("rent_start");
	int rent_month = Integer.parseInt(request.getParameter("rent_month"));
	OrderListVo v = new OrderListVo();
	v.setOrder_id(order_id);
	v.setRent_start(rent_start);
	v.setRent_month(rent_month);
	
	String condition = request.getParameter("condition");
	AdminOrderListDao dao = AdminOrderListDao.getInstance();
	int re = dao.adminUpdateOrderCondition(order_id, condition);
	re += dao.adminUpdateOrder(v);
	re += dao.adminUpdateRent_end(order_id);

	out.print("{re:"+re+"}");
%>