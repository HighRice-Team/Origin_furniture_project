package com.bit_fr.action.qna;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit_fr.dao.QnaDao;
import com.bit_fr.vo.QnaVo;
import com.bit_fr.action.ShopAction;
public class DeleteQnaAction implements ShopAction {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		
		QnaVo q = new QnaVo();
		QnaDao dao = QnaDao.getInstance();
		q = dao.detailQna(request.getParameter("board_id"));
		
		
		request.setAttribute("q", q);
		
		return "qna/deleteQna.jsp";
	}

}
