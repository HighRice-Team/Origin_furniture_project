package com.bit_fr.action.join;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit_fr.action.ShopAction;
import com.bit_fr.dao.ProjectDao;

public class InsertMemberJoinAction implements ShopAction {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		ProjectDao dao = ProjectDao.getInstance();
		request.setAttribute("n", dao.getNoAcc());
		request.setAttribute("n2", dao.getNoAddr());

		return "join/insertMemberJoin.jsp";
	}
}