package com.bit_fr.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FaqAction implements ShopAction {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		return "faq.jsp";
	}
}