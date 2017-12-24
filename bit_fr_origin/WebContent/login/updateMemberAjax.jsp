<%@page import="com.bit_fr.vo.AddressVo"%>
<%@page import="com.bit_fr.dao.AddressDao"%>
<%@page import="com.bit_fr.vo.AccountVo"%>
<%@page import="com.bit_fr.dao.AccountDao"%>
<%@page import="com.bit_fr.vo.MemberVo"%>
<%@page import="com.bit_fr.dao.MemberDao"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	HttpSession session2 = request.getSession();
	MemberDao dao = MemberDao.getInstance();
	MemberVo v = dao.getOne((String)session2.getAttribute("id"));
	int account_id = v.getAccount_id();
	int address_id = v.getAddress_id();
	
	AccountDao account_dao = AccountDao.getInstance();
	AccountVo account_v = account_dao.getOne(account_id);
	AddressDao address_dao = AddressDao.getInstance();
	AddressVo address_v = address_dao.getAddress(address_id);
	String str="{\"member_id\":\""+v.getMember_id()+"\",\"pwd\":\""+v.getPwd()+"\",\"name\":\""+v.getName()+"\",\"jumin\":\""+v.getJumin()+"\",\"pwd_q\":\""+v.getPwd_q()+"\",\"pwd_a\":\""+v.getPwd_a()+"\",\"tel\":\""+v.getTel()+"\",\"account_id\":\""+v.getAccount_id()+"\",\"address_id\":\""+v.getAddress_id()+"\",\"account_no\":\""+account_v.getAccoint_no()+"\",\"bank\":\""+account_v.getBank()+"\",\"balance\":\""+account_v.getBalance()+"\",\"address1\":\""+address_v.getAddress1()+"\",\"address2\":\""+address_v.getAddress2()+"\",\"address3\":\""+address_v.getAddress3()+"\"}";
%>
<%=str%>