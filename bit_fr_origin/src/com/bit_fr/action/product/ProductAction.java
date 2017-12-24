package com.bit_fr.action.product;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit_fr.action.ShopAction;
import com.bit_fr.dao.ProductDao;
import com.bit_fr.vo.ProductVo;

public class ProductAction implements ShopAction {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ProductDao dao = ProductDao.getInstance();
		int productMax=16;
		int pageNum=1;		
		if(request.getParameter("pageNum")!=null&&!request.getParameter("pageNum").equals(""))
		{
			pageNum=Integer.parseInt(request.getParameter("pageNum"));
		}
		int endNum = pageNum*productMax;
		int startNum = endNum-(productMax-1);
		
		String order = request.getParameter("order");
		String item = request.getParameter("item");
		String sql = "select * from (select rownum e,product_id,product_name,item,quality,main_img,price from (select product_id,product_name,item,quality,price,main_img from product where condition='물품게시' and item='"+item+"' order by ";
		if(order!=null&&!order.equals(""))
		{
			if(order.equals("quality"))
			{
				sql+="quality,";
			}else if(order.equals("price_min"))
			{
				sql+="price,";
			}else if(order.equals("price_max")) {
				sql+="price desc,";
			}
			request.setAttribute("order", order);
		}
		sql +=  "product_id desc))where e>="+startNum+" and e<="+endNum;
		
		ArrayList<ProductVo> list = dao.getCust(sql);
		int len = list.size();
		int item_len = dao.getItem(item);
		
		int pageMax = item_len/productMax;
		if(item_len%productMax!=0)
			pageMax++;
		
		request.setAttribute("len", len);
		request.setAttribute("list", list);
		request.setAttribute("item", item);
		request.setAttribute("pageMax", pageMax);
		

		
		return "product/product.jsp";
	}

}
