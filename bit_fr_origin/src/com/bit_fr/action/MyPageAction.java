package com.bit_fr.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bit_fr.dao.MemberDao;
import com.bit_fr.dao.OrderListDao;
import com.bit_fr.dao.ProductDao;
import com.bit_fr.vo.MemberVo;
import com.bit_fr.vo.ProductVo;

public class MyPageAction implements ShopAction {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String member_id = "";

		if (session.getAttribute("id") != null && !session.getAttribute("id").equals("")) {
			member_id = (String) session.getAttribute("id");
		} else {
			return "login.jsp";
		}

		int min = 1;
		if (request.getParameter("min") != null && !request.getParameter("min").equals("")) {
			min = Integer.parseInt(request.getParameter("min"));
		}
		int max = min + 3;

		MemberDao dao_m = MemberDao.getInstance();
		MemberVo v_m = dao_m.getOne(member_id);
		request.setAttribute("member", v_m);
		request.setAttribute("member_name", v_m.getName());

		OrderListDao dao = OrderListDao.getInstance();
		int rent1 = dao.getMyCondition(member_id, "입금완료");
		int rent2 = dao.getMyCondition(member_id, "배송중");
		int rent3 = dao.getMyCondition(member_id, "대여중");
		int rent4 = dao.getMyCondition(member_id, "반납");

		request.setAttribute("rent1", rent1);
		request.setAttribute("rent2", rent2);
		request.setAttribute("rent3", rent3);
		request.setAttribute("rent4", rent4);

		ProductDao dao_p = ProductDao.getInstance();
		int total = dao_p.getTotal("select count(*) from product where member_id=" + "'" + member_id + "'");
		ArrayList<ProductVo> list = dao_p.getOne(member_id, min, max);
		request.setAttribute("list", list);
		request.setAttribute("min", min);
		request.setAttribute("total", total);
		request.setAttribute("len", list.size());

		return "myPage.jsp";
	}
}