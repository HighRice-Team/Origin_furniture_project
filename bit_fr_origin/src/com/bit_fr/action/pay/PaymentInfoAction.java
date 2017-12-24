//�α��� ���� ���ǰ� �ݿ�

package com.bit_fr.action.pay;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bit_fr.action.ShopAction;
import com.bit_fr.dao.AddressDao;
import com.bit_fr.dao.MemberDao;
import com.bit_fr.dao.ProductDao;
import com.bit_fr.vo.AddressVo;
import com.bit_fr.vo.MemberVo;
import com.bit_fr.vo.ProductVo;

public class PaymentInfoAction implements ShopAction {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		int rent_month=Integer.parseInt(request.getParameter("rentMonth"));
		String rent_start = request.getParameter("rent_start");
		HttpSession session = request.getSession();
		String member_id=(String)session.getAttribute("id");
		
		ProductDao dao = ProductDao.getInstance();
		ProductVo v = dao.getProduct(product_id);
		MemberDao mem_dao = MemberDao.getInstance();
		MemberVo mem_v = mem_dao.getOne(member_id);
		AddressDao add_dao = AddressDao.getInstance();
		AddressVo add_v = add_dao.getAddress(mem_v.getAddress_id());
		String address = add_v.getAddress1()+add_v.getAddress2()+add_v.getAddress3();
		
		request.setAttribute("v", v);
		request.setAttribute("mem_v", mem_v);
		request.setAttribute("rent_month", rent_month);
		request.setAttribute("address", address);
		request.setAttribute("rent_start", rent_start);
		
		
		
		
		return "pay/paymentInfo.jsp";
	}

}
