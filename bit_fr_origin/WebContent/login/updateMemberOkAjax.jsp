<%@page import="com.bit_fr.dao.MemberDao"%>
<%@page import="com.bit_fr.vo.MemberVo"%>
<%@page import="com.bit_fr.dao.AddressDao"%>
<%@page import="com.bit_fr.dao.AccountDao"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	HttpSession session2 = request.getSession();
	String pwd = (String) session.getAttribute("pwd");
	String input_pwd = request.getParameter("j_pwd");
	String input_pwd2 = request.getParameter("pwd_chk");
	String str="";
	
	System.out.println(pwd);
	System.out.println(input_pwd);
	System.out.println(input_pwd2);
	
	if (input_pwd.equals(input_pwd2)) {
		String bank = request.getParameter("bank");
		String account = request.getParameter("account");
		String address1 = request.getParameter("address1");
		String address2 = request.getParameter("address2");
		String address3 = request.getParameter("address3");
		String pwd_q = request.getParameter("pwd_q");
		String pwd_a = request.getParameter("pwd_a");
		String tel = request.getParameter("tel");
		String member_id = (String) session.getAttribute("id");
		
		System.out.println(bank);
		System.out.println(account);
		System.out.println(address1);
		System.out.println(address2);
		System.out.println(address3);
		System.out.println(pwd_q);
		System.out.println(pwd_a);
		System.out.println(tel);
		System.out.println(member_id);
		
		if (input_pwd.equals(pwd)) {
			MemberDao mem_dao = MemberDao.getInstance();
			mem_dao.updateMember(input_pwd2, pwd_q, pwd_a, tel, member_id);
	
			MemberVo mem_v = mem_dao.getOne(member_id);
			int account_id = mem_v.getAccount_id();
			int address_id = mem_v.getAddress_id();
	
			AddressDao address_dao = AddressDao.getInstance();
			address_dao.updateAddress(address1, address2, address3, address_id);
	
			AccountDao account_dao = AccountDao.getInstance();
			account_dao.updateAccount(account, bank, account_id);
			str="회원정보 변경 완료";
	
		} else {
			str="비밀번호 오류.";
		}
	} else {
		str="입력한 두 비밀번호가 일치하지 않습니다.";
	}
	str = "{\"str\":\""+str+"\"}";
%>
<%=str%>