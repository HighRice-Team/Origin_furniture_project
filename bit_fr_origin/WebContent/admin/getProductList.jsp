<%@page import="com.bit_fr.vo.AdminProductVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bit_fr.dao.ProductDao"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	ProductDao dao = ProductDao.getInstance();
	String xml = "<rows>";
	xml+= "<page>1</page>";
	xml+= "<total>3</total>";
	xml+="<records>"+dao.countProduct()+"</records>";
	
	ArrayList<AdminProductVo> list = dao.getAdminAll();
	for(AdminProductVo v : list){
		xml+= "<row>";
		xml += "<cell>"+v.getProduct_id()+"</cell>";
		xml += "<cell>"+v.getItem()+"</cell>";
		xml += "<cell>"+v.getProduct_name()+"</cell>";
		xml += "<cell>"+v.getM_member_id()+"</cell>";
		xml += "<cell>"+v.getCondition()+"</cell>";
		xml += "<cell>"+v.getA_address2()+"</cell>";
		xml += "<cell>"+v.getQuality()+"</cell>";
		xml += "<cell>"+v.getPrice()+"</cell>";
		xml+= "</row>";
	}
	
	xml += "</rows>";
	out.print(xml);
%>