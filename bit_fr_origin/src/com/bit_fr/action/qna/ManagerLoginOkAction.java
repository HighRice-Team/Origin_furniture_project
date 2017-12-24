package com.bit_fr.action.qna;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.bit_fr.action.ShopAction;
import com.bit_fr.dao.ManagerDao2;
public class ManagerLoginOkAction implements ShopAction {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("mid");
		String pwd = request.getParameter("mpwd");
		
		ManagerDao2 dao = ManagerDao2.getInstance();
		int re = dao.managerLogin(id, pwd);
		
		request.getSession().setAttribute("re", re);
		
		
		return "qna/managerLoginOk.jsp";
	}
}