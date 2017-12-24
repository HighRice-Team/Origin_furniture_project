package com.bit_fr.action.qna;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit_fr.dao.QnaDao;
import com.bit_fr.vo.QnaVo;
import com.bit_fr.action.ShopAction;

public class ListQnaAction implements ShopAction {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int pageNUM = 1;
		if (request.getParameter("pageNUM") != null) {
			pageNUM = Integer.parseInt(request.getParameter("pageNUM"));
		}
		System.out.println(pageNUM);

		QnaDao dao = QnaDao.getInstance();
		ArrayList<QnaVo> list = dao.listQna(pageNUM);
		request.setAttribute("pageStr", dao.getPageStr());
		request.setAttribute("list", list);

		return "qna/listQna.jsp";
	}
}