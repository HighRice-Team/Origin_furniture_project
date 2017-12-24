package com.bit_fr.action.qna;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit_fr.action.ShopAction;
import com.bit_fr.dao.QnaDao;
import com.bit_fr.vo.QnaVo;

public class UpdateQnaOkAction implements ShopAction {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		String title = request.getParameter("title");
		String member_id = request.getSession().getAttribute("id")+"";
		String content = request.getParameter("content");
		String board_id = request.getParameter("board_id");
		
		QnaVo q = new QnaVo();
		q.setTitle(title);
		q.setMember_id(member_id);
		q.setContent(content);
		q.setBoard_id(board_id);
		
		QnaDao dao = QnaDao.getInstance();
		int re = dao.updateQna(q);
		
		request.setAttribute("re", re);
		
		return "qna/updateQnaOk.jsp";
	}
}