package com.bit_fr.action.qna;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit_fr.dao.QnaDao;
import com.bit_fr.action.ShopAction;
public class DeleteQnaOkAction implements ShopAction {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String board_id = request.getParameter("board_id");
		QnaDao dao = QnaDao.getInstance();
		int re = dao.deleteQna(board_id);
		
		request.setAttribute("re", re);		
		
		return "qna/deleteQnaOk.jsp";
	}

}
