<%@page import="com.bit_fr.dao.MemberDao"%>
<%@page import="com.bit_fr.vo.MemberVo"%>
<%@page import="com.bit_fr.dao.AccountDao"%>
<%@page import="com.bit_fr.vo.OrderListVo"%>
<%@page import="com.bit_fr.dao.OrderListDao"%>
<%@page import="com.bit_fr.vo.ProductVo"%>
<%@page import="com.bit_fr.dao.ProductDao"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	HttpSession session2 = request.getSession();
	String member_id =(String)session2.getAttribute("id");
	int price = Integer.parseInt(request.getParameter("price"));
	String member_pwd = request.getParameter("pwd2");
	String input_pwd = request.getParameter("pwd");
	int product_id = Integer.parseInt(request.getParameter("product_id"));
	String rent_start = request.getParameter("rent_start");
	String str="";
	MemberDao dao = MemberDao.getInstance();
	MemberVo mem_v = dao.getOne(member_id);
	int account_id = mem_v.getAccount_id();
	
	AccountDao account_dao = AccountDao.getInstance();
	int member_balance = account_dao.getBalance(account_id);
	if(member_pwd.equals(input_pwd)) {
		if(member_balance>=price)
		{
			account_dao.withdraw(account_id, price);
			str = "{\"str\":\"결제완료\"}";
			ProductDao product_dao = ProductDao.getInstance();
			ProductVo product_vo = product_dao.getProduct(product_id);
			if(product_vo.getCondition().equals("물품게시")){
				product_dao.changeCondition(product_id,"입금완료");
				OrderListDao orderlist_dao = OrderListDao.getInstance();
				OrderListVo orderlist_v = new OrderListVo();
				
				orderlist_v.setMember_id(member_id);
				orderlist_v.setProduct_id(product_id);
				orderlist_v.setRent_month(price/product_vo.getPrice());
				orderlist_v.setRent_start(rent_start);
				orderlist_dao.deleteOrderList(product_id);
				int re=orderlist_dao.insertOrderList(orderlist_v);
				re += orderlist_dao.updateRentend();
				if(re>0)
				{
					System.out.println("오더리스트 추가완료 페이먼트오케이");
				}
			}else{
				str ="{\"str\":\"판매가 완료된 상품입니다.\"}";
			}
		}else {
			str = "{\"str\":\"잔액이 부족합니다\"}";
		}
	}else {
		str = "{\"str\":\"비밀번호 오류\"}";
	}
	

%>
<%=str%>