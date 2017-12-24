package com.bit_fr.action.orderlist;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit_fr.action.ShopAction;

public class OrderlistByConditionAction implements ShopAction {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("1");
		String condition = request.getParameter("condition");
		System.out.println(condition);
		request.setAttribute("condition", condition);
		
		return "orderlist/orderlistByCondition.jsp";
	}

}
