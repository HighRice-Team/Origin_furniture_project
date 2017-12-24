package com.bit_fr.action.qna;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit_fr.dao.QnaDao;
import com.bit_fr.vo.QnaVo;
import com.bit_fr.action.ShopAction;
public class InsertReplyOkAction implements ShopAction {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String title = request.getParameter("title");
		//String member_id = request.getParameter("member_id");
		String content = request.getParameter("content");
		int b_ref = Integer.parseInt(request.getParameter("b_ref"));
		
		QnaVo q = new QnaVo();
		q.setTitle(title);
		q.setMember_id(null);
		q.setContent(content);
		q.setB_ref(b_ref);
		
		QnaDao dao = QnaDao.getInstance();
		int re = dao.insertQna(q);
		
		request.setAttribute("re", re);
		
		return "qna/insertReplyOk.jsp";
	}
}