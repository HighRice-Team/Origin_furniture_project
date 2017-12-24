<%@page import="com.bit_fr.dao.ProductDao"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int product_id = Integer.parseInt(request.getParameter("product_id"));
	ProductDao dao = ProductDao.getInstance();
	int re = dao.deleteProduct(product_id);
	String str="{\"re\":\""+re+"\"}";
%>
<%=str%>