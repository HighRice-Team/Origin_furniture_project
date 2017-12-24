<%@page import="com.bit_fr.dao.ProductDao"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	System.out.println("a");
	int product_id = Integer.parseInt(request.getParameter("product_id"));
	System.out.println(product_id);
	ProductDao dao = ProductDao.getInstance();
	int re = dao.changeCondition(product_id,"입금완료");
	System.out.println(re);
%>