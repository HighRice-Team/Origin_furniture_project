<%@page import="javafx.scene.control.Alert"%>
<%@page import="com.bit_fr.vo.SellVo"%>
<%@page import="com.bit_fr.dao.SellDao"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String oper = request.getParameter("oper");
	int re = -1;
	SellDao dao = SellDao.getInstance();
	SellVo s = new SellVo();
	
	if(oper.equals("add")){
		s.setProduct_name(request.getParameter("product_name"));
		s.setCondition("");
		s.setItem(request.getParameter("item"));
		s.setQuality(request.getParameter("quality"));
		s.setMember_id("");
		s.setPrice(0);
		s.setMain_img(request.getParameter("main_img"));
		s.setSub_img(request.getParameter("sub_img"));
		re = dao.insertProduct(s);
	}
	else if(oper.equals("del")){
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		re = dao.deleteProduct(product_id);
	}
	else if(oper.equals("edit")){
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		String condition = request.getParameter("condition");
		String product_name = request.getParameter("product_name");
		String item = request.getParameter("item");
		String quality = request.getParameter("quality");
		String main_img = request.getParameter("main_img");
		String sub_img = request.getParameter("sub_img");
		re = dao.updateProduct(product_name, item, quality, main_img, sub_img, product_id);
	}
	String str = "{re:"+re+"}";
%>
<%=str%>
