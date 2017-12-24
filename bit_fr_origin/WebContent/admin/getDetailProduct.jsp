<%@page import="com.bit_fr.vo.ProductVo"%>
<%@page import="com.bit_fr.dao.ProductDao"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	ProductDao dao = ProductDao.getInstance();
	ProductVo pv = dao.getProduct(Integer.parseInt(request.getParameter("product_id")));
	
	String str = "<rows>";
	str+="<page></page>";
	str+="<total></total>";
	str+="<records></records>";
	
	str+="<row>";
	str+="<cell>물품 번호</cell>";
	str+="<cell>"+pv.getProduct_id()+"</cell>";
	str+="</row>";
	
	str+="<row>";
	str+="<cell>등록자 아이디</cell>";
	str+="<cell>"+pv.getMember_id()+"</cell>";
	str+="</row>";
	
	str+="<row>";
	str+="<cell>물품명</cell>";
	str+="<cell>"+pv.getProduct_name()+"</cell>";
	str+="</row>";
	
	str+="<row>";
	str+="<cell>품목</cell>";
	str+="<cell>"+pv.getItem()+"</cell>";
	str+="</row>";
	
	str+="<row>";
	str+="<cell>품질</cell>";
	str+="<cell>"+pv.getQuality()+"</cell>";
	str+="</row>";
	
	str+="<row>";
	str+="<cell>상태</cell>";
	str+="<cell>"+pv.getCondition()+"</cell>";
	str+="</row>";
	
	
	str+="</rows>";
	out.print(str);
%>