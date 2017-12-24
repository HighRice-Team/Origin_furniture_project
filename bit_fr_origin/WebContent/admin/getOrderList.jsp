<%@page import="com.bit_fr.vo.AdminOrderListVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bit_fr.dao.OrderListDao"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	OrderListDao dao = OrderListDao.getInstance();

	String str = "<rows>";
	str+= "<page>1</page>";
	str+= "<total>3</total>";
	str+= "<records>"+(dao.getMax()-1)+"</records>";

	
	ArrayList<AdminOrderListVo> list = dao.getAdminAll();
	
	for(AdminOrderListVo v : list){
		str+="<row>";
		str+="<cell>"+v.getOrder_id()+"</cell>";
		str+="<cell>"+v.getO_member_id()+"</cell>";
		str+="<cell>"+v.getP_item()+"</cell>";
		str+="<cell>"+v.getCondition()+"</cell>";
		str+="<cell>"+v.getP_member_id()+"</cell>";
		str+="<cell>"+v.getAddress2()+"</cell>";
		str+="<cell>"+v.getRent_start()+"</cell>";
		str+="<cell>"+v.getRent_end()+"</cell>";
		str+="<cell>"+v.getRent_month()+"</cell>";
		str+="<cell>"+v.getPrice()+"</cell>";
		
		str+="</row>";
	}
	
	
	str+="</rows>";
	out.print(str);
%>