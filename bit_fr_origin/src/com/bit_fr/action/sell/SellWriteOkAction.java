package com.bit_fr.action.sell;

import java.io.File;
import java.io.IOException;
import com.bit_fr.action.ShopAction;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bit_fr.dao.SellDao;
import com.bit_fr.vo.SellVo;
import com.oreilly.servlet.MultipartRequest;

public class SellWriteOkAction implements ShopAction {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		try{
			HttpSession session = request.getSession();
			String member_id=(String)session.getAttribute("id");
			String path = request.getRealPath("img/product");
			MultipartRequest multi = new MultipartRequest(request, path,"UTF-8");
			File file1 = multi.getFile("main_img");
			File file2 = multi.getFile("sub_img");
			String main_img = "noimage";
			String sub_img = "noimage";
			
			if(file1!=null) {
				main_img = file1.getName();
			}
			if(file2!=null) {
				sub_img = file2.getName();
			}

			SellDao dao = SellDao.getInstance();
			SellVo p = new SellVo();
			
			p.setProduct_id(Integer.parseInt(multi.getParameter("product_id")));
			p.setCondition("등록");
			p.setProduct_name(multi.getParameter("product_name"));
			p.setItem(multi.getParameter("item"));
			p.setQuality(multi.getParameter("quality"));
			p.setMember_id(member_id);
			p.setPrice(0);
			p.setMain_img(main_img);
			p.setSub_img(sub_img);
			
			int re = dao.insertProduct(p);
			
			if(re>0) {
				request.setAttribute("re", re);
			}
			else {
				System.out.println("등록실패");
			}
		}catch(Exception e){
			System.out.println(e);
		}
		return "sell/sellWriteOk.jsp";
	}
}
