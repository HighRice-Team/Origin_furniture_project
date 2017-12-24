<%@page import="com.bit_fr.vo.AccountVo"%>
<%@page import="com.bit_fr.vo.AddressVo"%>
<%@page import="com.bit_fr.vo.MemberVo"%>
<%@page import="com.bit_fr.dao.AccountDao"%>
<%@page import="com.bit_fr.dao.AddressDao"%>
<%@page import="com.bit_fr.dao.MemberDao"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String str = "<rows>";
	str+="<page></page>";
	str+="<total></total>";
	str+="<records></records>";

	MemberDao dao = MemberDao.getInstance();
	AddressDao adao = AddressDao.getInstance();
	AccountDao acdao = AccountDao.getInstance();
	
	MemberVo mv = dao.getOne(request.getParameter("member_id"));
	AddressVo av = adao.getOne(mv.getAddress_id());
	AccountVo acv = acdao.getOne(mv.getAccount_id());
	
	str+="<row>";
	str+="<cell>회원 번호</cell>";
	str+="<cell>"+mv.getMember_id()+"</cell>";
	str+="</row>";
	
	str+="<row>";
	str+="<cell>비밀번호</cell>";
	str+="<cell>"+mv.getPwd()+"</cell>";
	str+="</row>";
	
	str+="<row>";
	str+="<cell>이름</cell>";
	str+="<cell>"+mv.getName()+"</cell>";
	str+="</row>";
	
	str+="<row>";
	str+="<cell>주민번호</cell>";
	str+="<cell>"+mv.getJumin()+"</cell>";
	str+="</row>";
	
	str+="<row>";
	str+="<cell>계좌번호</cell>";
	str+="<cell>"+acv.getAccoint_no()+"</cell>";
	str+="</row>";
	
	str+="<row>";
	str+="<cell>주소</cell>";
	str+="<cell>"+av.toString()+"</cell>";
	str+="</row>";
	
	str+="<row>";
	str+="<cell>핸드폰 번호</cell>";
	str+="<cell>"+mv.getTel()+"</cell>";
	str+="</row>";
	
	str+="</rows>";
	out.print(str);
%>