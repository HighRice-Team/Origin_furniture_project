package com.bit_fr.action.qna;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit_fr.action.ShopAction;
public class GotomemberAction implements ShopAction {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String member_id = "";
		String str = "<p>회원만 이용 할 수 있습니다.</p><p>로그인 부탁드립니다.</p><hr>\r\n" + 
				"	<button onclick=\"login()\">로그인하기</button>&nbsp;<button onclick=\"back()\">뒤로가기</button>&nbsp;<button onclick=\"join()\">회원가입</button>";
		
		if(request.getSession().getAttribute("id")!= null) {
			member_id = request.getSession().getAttribute("id").toString();
		}
		if(!member_id.equals(""))
		{
			str = "<p>맞지않는 아이디 입니다.</p><p>아이디를 확인하여 주세요.</p><a href=\"listQna.do\">돌아가기</a>";
		}
		request.setAttribute("str", str);
		
		
		return "qna/gotomember.jsp";
	}

}
