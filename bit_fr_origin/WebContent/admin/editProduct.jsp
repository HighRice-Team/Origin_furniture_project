<%@page import="com.bit_fr.vo.AdminProductVo"%>
<%@page import="com.bit_fr.dao.ProductDao"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	AdminProductVo v = new AdminProductVo();
	v.setProduct_id(Integer.parseInt(request.getParameter("product_id")));
	v.setItem(request.getParameter("item"));
	v.setProduct_name(request.getParameter("product_name"));
	v.setCondition(request.getParameter("condition"));
	v.setQuality(request.getParameter("quality"));
	v.setPrice(Integer.parseInt(request.getParameter("price")));
	System.out.println(Integer.parseInt(request.getParameter("product_id")));
	ProductDao dao = ProductDao.getInstance();
	int re = -1;
	
	if(request.getParameter("oper").equals("edit")){
		re = dao.adminProductUpdate(v);
	}
	else if(request.getParameter("oper").equals("del")){
		re = dao.deleteProduct(v.getProduct_id());
	}
	
	String str = "{re:"+re+"}";
	out.print(str);
%>