package com.bit_fr.action.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit_fr.action.ShopAction;
import com.bit_fr.dao.AccountDao;
import com.bit_fr.dao.AddressDao;
import com.bit_fr.dao.MemberDao;
import com.bit_fr.vo.AccountVo;
import com.bit_fr.vo.AddressVo;
import com.bit_fr.vo.MemberVo;

public class MemberListDetailAction implements ShopAction {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MemberDao dao = MemberDao.getInstance();
		AddressDao adao = AddressDao.getInstance();
		AccountDao acdao = AccountDao.getInstance();

		MemberVo mv = dao.getOne(request.getParameter("member_id"));
		request.setAttribute("list", mv);

		int address_id = mv.getAddress_id();
		AddressVo av = adao.getOne(address_id);
		request.setAttribute("laddr", av);

		int account_id = mv.getAccount_id();
		AccountVo acv = acdao.getOne(account_id);
		request.setAttribute("lacc", acv);

		return "admin/memberListDetail.jsp";
	}
}