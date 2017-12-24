package com.bit_fr.action.join;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit_fr.action.ShopAction;
import com.bit_fr.dao.ProjectDao;
import com.bit_fr.vo.ProjectAccountVo;
import com.bit_fr.vo.ProjectAddressVo;
import com.bit_fr.vo.ProjectJoinVo;

public class InsertMemberJoinOkAction implements ShopAction {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		ProjectDao dao = ProjectDao.getInstance();

		ProjectJoinVo p = new ProjectJoinVo();
		ProjectAccountVo a = new ProjectAccountVo();
		ProjectAddressVo ad = new ProjectAddressVo();

		ad.setAddress_id(Integer.parseInt(request.getParameter("n2")));
		ad.setAddress1(request.getParameter("address1"));
		ad.setAddress2(request.getParameter("address2"));
		ad.setAddress3(request.getParameter("address3"));

		a.setAccount_id(Integer.parseInt(request.getParameter("n")));
		a.setAccount_no(request.getParameter("account"));
		a.setBank(request.getParameter("bank"));
		int re2 = dao.insertAccount(a);
		int re3 = dao.insertAddress(ad);

		p.setMember_id(request.getParameter("id"));
		p.setPwd(request.getParameter("j_pwd"));
		System.out.println(request.getParameter("j_pwd"));
		p.setName(request.getParameter("name"));
		p.setJumin(request.getParameter("jumin"));
		p.setTel(request.getParameter("tel"));
		p.setPwd_q(request.getParameter("pwd_q"));
		p.setPwd_a(request.getParameter("pwd_a"));

		int re = dao.insertJoin(p);
		request.setAttribute("re", re);
		request.setAttribute("re2", re2);
		request.setAttribute("re3", re3);
		System.out.println("**********************5");
		return "join/insertMemberJoinOk.jsp";
	}
}