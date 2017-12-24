package com.bit_fr.action.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bit_fr.action.ShopAction;
import com.bit_fr.dao.MemberDao;
import com.bit_fr.vo.MemberVo;

public class LoginAction implements ShopAction {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String str = "";
		MemberDao dao = MemberDao.getInstance();
		request.setCharacterEncoding("utf-8");

		if (id != null && !id.equals("")) {
			int re = dao.existMember(id);
			if (re > 0) {
				MemberVo v = dao.getOne(id);
				boolean compare = v.getPwd().equals(pwd);
				if (!compare) {
					str = "비밀번호가 일치하지 않습니다.";
					request.setAttribute("str", str);
					return "login.jsp";
				}
				HttpSession session = request.getSession();
				session.setAttribute("id", id);
				session.setAttribute("pwd", pwd);
				
				return "loginOk.jsp";
			}
		}

		if (id == null) {
			return "login.jsp";
		}

		str = "존재하지 않는 아이디 입니다.";
		request.setAttribute("str", str);

		return "login.jsp";
	}
}