package com.bit_fr.action.sell;

import java.io.IOException;
import com.bit_fr.action.ShopAction;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit_fr.dao.SellDao;

public class SellDetailAction implements ShopAction {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		SellDao dao = SellDao.getInstance();
		request.setAttribute("p", dao.getProduct(product_id));
		return "sell/sellDetail.jsp";
	}
}
