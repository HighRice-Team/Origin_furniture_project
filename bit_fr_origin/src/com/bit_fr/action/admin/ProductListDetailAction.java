package com.bit_fr.action.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit_fr.dao.ProductDao;
import com.bit_fr.vo.ProductVo;
import com.bit_fr.action.ShopAction;

public class ProductListDetailAction implements ShopAction {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ProductDao dao = ProductDao.getInstance();
		ProductVo pv = dao.getProduct(Integer.parseInt(request.getParameter("product_id")));
		request.setAttribute("list", pv);

		return "admin/productListDetail.jsp";
	}
}