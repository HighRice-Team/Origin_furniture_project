package com.bit_fr.action.pay;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bit_fr.action.ShopAction;
import com.bit_fr.dao.MemberDao;
import com.bit_fr.vo.MemberVo;

public class PaymentAction implements ShopAction {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("id");
		MemberDao dao = MemberDao.getInstance();
		MemberVo v = dao.getOne(member_id);
		String product_id = request.getParameter("product_id");
		String price = request.getParameter("price");
		String rent_start = request.getParameter("rent_start");
		String pwd = v.getPwd();
		
		request.setAttribute("price", price);
		request.setAttribute("pwd", pwd);	
		request.setAttribute("product_id", product_id);
		request.setAttribute("rent_start", rent_start);
		
		return "pay/payment.jsp";
	}

}
