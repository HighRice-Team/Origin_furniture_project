package com.bit_fr.action.qna;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.bit_fr.action.ShopAction;
import com.bit_fr.dao.QnaDao;
import com.bit_fr.vo.QnaVo;

public class UpdateQnaAction implements ShopAction {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		QnaVo q = new QnaVo();
		QnaDao dao = QnaDao.getInstance();
		q = dao.detailQna(request.getParameter("board_id"));
		String detailMember = request.getParameter("detailMember");
		
		
		request.setAttribute("q", q);
		request.setAttribute("detailMember",detailMember);
		
		return "qna/updateQna.jsp";
	}
}