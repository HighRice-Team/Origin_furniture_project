package com.bit_fr.action.sell;

import java.io.IOException;
import com.bit_fr.action.ShopAction;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit_fr.dao.SellDao;

public class SellWriteAction implements ShopAction {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		SellDao dao = SellDao.getInstance();
		request.setAttribute("product_id", dao.getNextId());
		return "sell/sellWrite.jsp";
	}
}
