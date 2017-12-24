package com.bit_fr.action.sell;

import java.io.File;
import java.io.IOException;
import com.bit_fr.action.ShopAction;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit_fr.dao.SellDao;

public class SellDeleteAction implements ShopAction {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		SellDao dao = SellDao.getInstance();
		String main_img = dao.getProduct(product_id).getMain_img();
		String sub_img = dao.getProduct(product_id).getSub_img();
		String path = request.getRealPath("img/product");
		
		int re = dao.deleteProduct(product_id);
		
		if(re==1 && main_img != null && !main_img.equals("")) {
			File main_file = new File(path+"/"+main_img);
			main_file.delete();
		}
		if(re==1 && sub_img != null && !sub_img.equals("")) {
			File sub_file = new File(path+"/"+sub_img);
			sub_file.delete();
		}
		
		request.setAttribute("re", re);
		return "sell/sellDelete.jsp";
	}
}
