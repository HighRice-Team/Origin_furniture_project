package com.bit_fr.action.qna;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.bit_fr.action.ShopAction;
public class InsertReplyAction implements ShopAction {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String b_ref = request.getParameter("b_ref");
		request.setAttribute("b_ref", b_ref);
		
		return "qna/insertReply.jsp";
	}
}