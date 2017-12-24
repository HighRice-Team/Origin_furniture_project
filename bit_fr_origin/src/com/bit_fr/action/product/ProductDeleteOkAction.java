package com.bit_fr.action.product;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bit_fr.action.ShopAction;
import com.bit_fr.dao.ProductDao;
public class ProductDeleteOkAction implements ShopAction {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("1");
		HttpSession session = request.getSession();
		String pwd=(String)session.getAttribute("pwd");
		String id=(String)session.getAttribute("id");
		String input_pwd = request.getParameter("input_pwd");
		System.out.println("OKACTION PWD:"+pwd);
		System.out.println("OKACTION INPUT PWD:"+input_pwd);
		System.out.println("OKACTION ID:"+id);
		
		int product_id=Integer.parseInt(request.getParameter("product_id"));
		System.out.println("OKACTION PRODUCT_ID:"+product_id);
		int re=0;
		if(pwd.equals(input_pwd)) {
			ProductDao dao = ProductDao.getInstance();
			re = dao.deleteProduct(product_id);
			if(re>0) {
				request.setAttribute("str", "삭제완료");
			}
		}else {
			request.setAttribute("str", "비밀번호 불일치.");
			request.setAttribute("product_id", product_id);
		}
		
		
		return "product/productDeleteOk.jsp";
	}

}
