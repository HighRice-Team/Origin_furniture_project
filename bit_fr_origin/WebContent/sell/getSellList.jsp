<%@page import="java.util.ArrayList"%>
<%@page import="com.bit_fr.vo.SellVo"%>
<%@page import="com.bit_fr.dao.SellDao"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String str = "<rows>";
	str += "<page>1</page>";
	str += "<total>1</total>";
	str += "<records>15</records>";
	
	String member_id = (String)session.getAttribute("id");
	
	SellDao dao = SellDao.getInstance();
	ArrayList<SellVo> list = dao.listAll(member_id);

	
	for(SellVo s:list){
		str += "<row>";
		str += "<cell>"+s.getProduct_id()+"</cell>";
		str += "<cell>"+s.getProduct_name()+"</cell>";
		str += "<cell>"+s.getItem()+"</cell>";
		str += "<cell>"+s.getQuality()+"</cell>";
		str += "<cell>"+s.getCondition()+"</cell>";
		str += "<cell>"+s.getMain_img()+"</cell>";
		str += "<cell>"+s.getSub_img()+"</cell>";
		str += "</row>";
	}
	str += "</rows>";
%>
<%=str%>
