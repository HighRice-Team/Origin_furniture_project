package com.bit_fr.action.pay;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bit_fr.action.ShopAction;
import com.bit_fr.dao.AccountDao;
import com.bit_fr.dao.MemberDao;
import com.bit_fr.dao.OrderListDao;
import com.bit_fr.dao.ProductDao;
import com.bit_fr.vo.MemberVo;
import com.bit_fr.vo.OrderListVo;
import com.bit_fr.vo.ProductVo;

public class PaymentOkAction implements ShopAction {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String member_id =(String)session.getAttribute("id");
		int price = Integer.parseInt(request.getParameter("price"));
		String member_pwd = request.getParameter("pwd2");
		String input_pwd = request.getParameter("pwd");
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		
		MemberDao dao = MemberDao.getInstance();
		MemberVo mem_v = dao.getOne(member_id);
		int account_id = mem_v.getAccount_id();
		
		AccountDao account_dao = AccountDao.getInstance();
		int member_balance = account_dao.getBalance(account_id);
		if(member_pwd.equals(input_pwd)) {
			if(member_balance>=price)
			{
				account_dao.withdraw(account_id, price);
				request.setAttribute("str", "결제완료.");
				ProductDao product_dao = ProductDao.getInstance();
				ProductVo product_vo = product_dao.getProduct(product_id);
				product_dao.changeCondition(product_id,"입금완료");
				OrderListDao orderlist_dao = OrderListDao.getInstance();
				OrderListVo orderlist_v = new OrderListVo();
				
				orderlist_v.setMember_id(member_id);
				orderlist_v.setProduct_id(product_id);
				orderlist_v.setRent_month(price/product_vo.getPrice());
				int re=orderlist_dao.insertOrderList(orderlist_v);
				if(re>0)
					System.out.println("오더리스트 추가완료 페이먼트오케이");
			}else {
				request.setAttribute("str", "잔액이 부족합니다.");
			}
		}else {
			request.setAttribute("str", "비밀번호 오류.");
		}
		
		return "pay/paymentOk.jsp";
	}

}
