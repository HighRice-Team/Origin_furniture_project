<%@page import="com.bit_fr.vo.OrderListVo"%>
<%@page import="com.bit_fr.vo.AdminOrderListVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bit_fr.dao.OrderListDao"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String member_id = (String)session.getAttribute("id");
	String condition = request.getParameter("condition");
	OrderListDao dao = OrderListDao.getInstance();
	System.out.println(condition);
	String str = "<rows>";
	str+= "<page>1</page>";
	str+= "<total>3</total>";
	str+= "<records>"+(dao.getMyOrder(member_id, condition))+"</records>";
	ArrayList<OrderListVo> list = new ArrayList<OrderListVo>();
	if(condition!=null)
	{
		System.out.println("if발동");
		list = dao.getMyOrder(member_id, condition);
	}else{
		System.out.println("else발동");
		list = dao.getMyOrder(member_id);
	}
// 	System.out.println(list.size());
	for(OrderListVo v : list){
		str+="<row>";
		str+="<cell>"+v.getOrder_id()+"</cell>";
		str+="<cell>"+v.getMember_id()+"</cell>";
		str+="<cell>"+v.getProduct_id()+"</cell>";
		str+="<cell>"+v.getPay_date()+"</cell>";
		str+="<cell>"+v.getRent_start().substring(0, v.getRent_start().indexOf(" "))+"</cell>";
		str+="<cell>"+v.getRent_end()+"</cell>";
		str+="<cell>"+v.getRent_month()+"</cell>";
		
		str+="</row>";
	}
	
	
	str+="</rows>";
	out.print(str);
%>