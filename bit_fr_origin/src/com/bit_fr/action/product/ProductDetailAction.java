package com.bit_fr.action.product;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bit_fr.action.ShopAction;
import com.bit_fr.dao.ProductDao;
import com.bit_fr.vo.ProductVo;

public class ProductDetailAction implements ShopAction {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String member_id =(String)session.getAttribute("id");
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		
		ProductDao dao = ProductDao.getInstance();
		ProductVo v = dao.getProduct(product_id);
		request.setAttribute("v", v);	
		request.setAttribute("member_id", member_id);	
		
		return "product/productDetail.jsp";
	}

}
