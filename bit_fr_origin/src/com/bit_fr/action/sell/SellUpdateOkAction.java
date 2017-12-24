package com.bit_fr.action.sell;

import java.io.File;
import java.io.IOException;
import com.bit_fr.action.ShopAction;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit_fr.dao.SellDao;
import com.oreilly.servlet.MultipartRequest;

public class SellUpdateOkAction implements ShopAction {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		try{
			SellDao dao = SellDao.getInstance();
			String path = request.getRealPath("img/product/");
			System.out.println("path: "+path);
			MultipartRequest multi = new MultipartRequest(request, path,"UTF-8");
			
			int product_id = Integer.parseInt(multi.getParameter("product_id"));
			String old_main_img = dao.getProduct(product_id).getMain_img();
			String old_sub_img = dao.getProduct(product_id).getSub_img();
			
			File file1 = multi.getFile("main_img");
			File file2 = multi.getFile("sub_img");
			
			String main_img = "noimage.jpg";
			String sub_img = "noimage.jpg";
			
			if(file1!=null) {
				main_img = file1.getName();
			}
			if(file2!=null) {
				sub_img = file2.getName();
			}

			if(main_img.equals("noimage.jpg"))
				main_img = old_main_img;
			
			if(!sub_img.equals("noimage.jpg"))
				sub_img = sub_img;
			else
				sub_img = old_sub_img;
			


			String product_name = multi.getParameter("product_name");
			String item = multi.getParameter("item");
			String quality = multi.getParameter("quality");

			int re = dao.updateProduct(product_name, item, quality, main_img, sub_img, product_id);

			if(re==1 && !main_img.equals(path+old_main_img)) {
				File f_file1 = new File(path+old_main_img);
				f_file1.delete();
			}
			else if(re==1 && !sub_img.equals(path+old_sub_img)) {
				File f_file2 = new File(path+old_sub_img);
				f_file2.delete();
			}
			System.out.println(re);
			request.setAttribute("re", re);
		}catch(Exception e){
			System.out.println(e);
		}
		return "sell/sellUpdateOk.jsp";
	}
}
