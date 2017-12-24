package com.bit_fr.action.orderlist;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit_fr.action.ShopAction;
import com.bit_fr.dao.OrderListDao;
import com.bit_fr.vo.OrderListVo;

public class InsertOrderlistAction implements ShopAction {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		String member_id = (String) request.getSession().getAttribute("id");
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		int rent_month = Integer.parseInt(request.getParameter("rent_month"));
		

		OrderListDao dao = OrderListDao.getInstance();
		OrderListVo orderlist_vo = new OrderListVo();
		orderlist_vo.setMember_id(member_id);
		orderlist_vo.setProduct_id(product_id);
		orderlist_vo.setRent_month(rent_month);
		
		dao.insertOrderList(orderlist_vo);	
		return "cartList.jsp";
	}

}
