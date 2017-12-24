package com.bit_fr.action.qna;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit_fr.dao.QnaDao;
import com.bit_fr.vo.QnaVo;
import com.bit_fr.action.ShopAction;
public class InsertQnaOkAction implements ShopAction {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String title = request.getParameter("title");
		//String member_id = request.getParameter("member_id");
		String member_id = request.getSession().getAttribute("id")+"";
		String content = request.getParameter("content");
		
		QnaVo q = new QnaVo();
		q.setTitle(title);
		q.setMember_id(member_id);
		q.setContent(content);
		
		QnaDao dao = QnaDao.getInstance();
		int re = dao.insertQna(q);
		
		request.setAttribute("re", re);
		
		return "qna/insertQnaOk.jsp";
	}
}