package com.bit_fr.action.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit_fr.action.ShopAction;
import com.bit_fr.dao.MemberDao;

public class ResetPwdAction implements ShopAction {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MemberDao dao = MemberDao.getInstance();
		String member_id = request.getParameter("member_id");
		int re = dao.resetPwd(member_id);
		request.setAttribute("re", re);
		return "admin/resetPwdOk.jsp";
	}
}
