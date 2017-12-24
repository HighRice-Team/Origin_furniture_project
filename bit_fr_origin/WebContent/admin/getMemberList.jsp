<%@page import="com.bit_fr.vo.AdminMemberListVo"%>
<%@page import="com.bit_fr.vo.MemberVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bit_fr.dao.MemberDao"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	MemberDao dao = MemberDao.getInstance();
	ArrayList<AdminMemberListVo> list = dao.getAdminAll();

	String str = "<rows>";
	str+="<page>1</page>";
	str+="<total>3</total>";
	str+="<records>"+dao.countMember()+"</records>";
	
	
	for(AdminMemberListVo v : list){
		str+="<row>";
		str+="<cell>"+v.getMember_id()+"</cell>";
		str+="<cell>"+v.getName()+"</cell>";
		str+="<cell>"+v.getAddress()+"</cell>";
		str+="<cell>"+v.getTel()+"</cell>";
		str+="<cell>"+v.getSellProduct()+"</cell>";
		str+="<cell>"+v.getRentProduct()+"</cell>";
		str+="</row>";
	}
	
	str += "</rows>";
	out.print(str);
%>