package com.bit_fr.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import com.bit_fr.vo.CartVo;

public class CartDao {

	private static CartDao dao;

	private CartDao() {
	};

	static {
		dao = new CartDao();
	}

	public static CartDao getInstance() {
		return dao;
	}

	public ArrayList<CartVo> getMy(String member_id) {
		ArrayList<CartVo> list = new ArrayList<CartVo>();

		try {
			String sql = "select rownum,product_name,main_img,price,rent_month,pr,con from(select product_name,main_img,price,rent_month,o.product_id pr,p.condition con  from orderlist o,product p where o.product_id=p.product_id and o.member_id=? and p.condition='물품게시' order by order_id desc)where rownum>=0 and rownum<=10";
			InitialContext context = new InitialContext();
			DataSource ds = (DataSource) context.lookup("java:/comp/env/bit");
			Connection conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member_id);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				list.add(new CartVo(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5),
						rs.getString(6), rs.getString(7)));
			}
			if (conn != null)
				conn.close();
			if (pstmt != null)
				pstmt.close();
			if (rs != null)
				rs.close();

		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}
}