package com.bit_fr.action.sell;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bit_fr.action.ShopAction;
import com.bit_fr.dao.MemberDao;
import com.bit_fr.dao.OrderListDao;
import com.bit_fr.dao.ProductDao;
import com.bit_fr.dao.SellDao;
import com.bit_fr.vo.MemberVo;
import com.bit_fr.vo.ProductVo;

public class SellListAction implements ShopAction {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String member_id = "";
		
		if (session.getAttribute("id") != null && !session.getAttribute("id").equals("")) {
			member_id = (String) session.getAttribute("id");
		}
		else {
			return "login.jsp";
		}
		
		SellDao dao = SellDao.getInstance();
		dao.listAll(member_id);
		request.setAttribute("member_id", member_id);
		return "sell/sellList.jsp";
	}
}