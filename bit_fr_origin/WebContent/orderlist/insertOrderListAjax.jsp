<%@page import="com.bit_fr.vo.OrderListVo"%>
<%@page import="com.bit_fr.dao.OrderListDao"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String member_id = (String)request.getSession().getAttribute("id");
	int product_id = Integer.parseInt(request.getParameter("product_id"));
	int rent_month = Integer.parseInt(request.getParameter("rent_month"));
	int re=0;
	System.out.println(member_id+"/"+product_id);
	OrderListDao dao = OrderListDao.getInstance();
	int chk_exist = dao.chkExist(member_id, product_id);
	
	System.out.println(chk_exist);
	if(chk_exist<1){
		OrderListVo orderlist_vo = new OrderListVo();
		orderlist_vo.setMember_id(member_id);
		orderlist_vo.setProduct_id(product_id);
		orderlist_vo.setRent_month(rent_month);
		dao.insertOrderList(orderlist_vo);
	}
	
	re = chk_exist;
	
	
	
	String str ="{\"re\":\""+re+"\"}";
%>
<%=str%>