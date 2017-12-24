package com.bit_fr.action;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit_fr.dao.AddressDao;
import com.bit_fr.dao.CartDao;
import com.bit_fr.dao.MemberDao;
import com.bit_fr.vo.AddressVo;
import com.bit_fr.vo.CartVo;
import com.bit_fr.vo.MemberVo;

public class CartListAction implements ShopAction {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String member = (String) request.getSession().getAttribute("id");
		CartDao cartDao = CartDao.getInstance();
		MemberDao memdao = MemberDao.getInstance();
		ArrayList<CartVo> list = cartDao.getMy(member);
		MemberVo mv = memdao.getOne(member);
		AddressDao adDao = AddressDao.getInstance();
		AddressVo ad = adDao.getOne(mv.getAddress_id());
	 	String adr = ad.toString();

		request.setAttribute("list", list);
		request.setAttribute("mv", mv);
		request.setAttribute("adr", adr);

		return "cartList.jsp";
	}
}
