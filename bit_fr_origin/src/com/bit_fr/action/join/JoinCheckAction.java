package com.bit_fr.action.join;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit_fr.action.ShopAction;
public class JoinCheckAction implements ShopAction {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		return "join/joinCheck.jsp";
	}
}