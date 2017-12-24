package com.bit_fr.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.bit_fr.vo.OrderListVo;

public class AdminOrderListDao {
	private static AdminOrderListDao dao;

	private AdminOrderListDao() {
	};

	static {
		dao = new AdminOrderListDao();
	}

	public static AdminOrderListDao getInstance() {
		return dao;
	}

	public int getMyCondition(String member_id, String condition) {
		int re = -1;

		try {
			String sql = "select count(product_id) from orderlist where member_id=? and product_id in (select product_id from product where condition=?)";
			InitialContext context = new InitialContext();
			DataSource ds = (DataSource) context.lookup("java:/comp/env/bit");
			Connection conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member_id);
			pstmt.setString(2, condition);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next())
				re = rs.getInt(1);

			if (conn != null)
				conn.close();
			if (pstmt != null)
				pstmt.close();
			if (rs != null)
				rs.close();

		} catch (Exception e) {
			System.out.println(e);
		}
		return re;
	}

	public ArrayList<OrderListVo> getAll() {
		ArrayList<OrderListVo> list = new ArrayList<OrderListVo>();

		try {
			String sql = "select * from orderlist";
			InitialContext context = new InitialContext();
			DataSource ds = (DataSource) context.lookup("java:/comp/env/bit");
			Connection conn = ds.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);

			while (rs.next()) {
				list.add(new OrderListVo(rs.getInt(1), rs.getString(2), rs.getShort(3), rs.getDate(4), rs.getString(5),
						rs.getDate(6), rs.getInt(7)));
			}

			if (conn != null)
				conn.close();
			if (stmt != null)
				stmt.close();
			if (rs != null)
				rs.close();

		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}
	
	public int adminUpdateOrder(OrderListVo v) {
		int re = -1;
		String sql = "update orderlist set rent_start=?, rent_month = ? where order_id ="+v.getOrder_id();
		try {
			InitialContext context = new InitialContext();
			DataSource ds = (DataSource) context.lookup("java:/comp/env/bit");
			Connection conn = ds.getConnection();
			PreparedStatement pstmt =  conn.prepareStatement(sql);
			pstmt.setString(1, v.getRent_start());
			pstmt.setInt(2, v.getRent_month());
			re = pstmt.executeUpdate();
			
			if (conn != null)
				conn.close();
			if (pstmt != null)
				pstmt.close();
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		
		return re;
	}
	
	public int adminUpdateRent_end(int order_id) {
		int re = -1;
		String rent_end = "";
		String sql1 = "select add_months(rent_start, rent_month) from orderlist where order_id ="+order_id;
		String sql2 = "update orderlist set rent_end = ? where order_id ="+order_id;
		
		try {
			InitialContext context = new InitialContext();
			DataSource ds = (DataSource) context.lookup("java:/comp/env/bit");
			Connection conn = ds.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql1);
			if(rs.next()) {
				rent_end = rs.getString(1);
				rent_end = rent_end.substring(0, rent_end.indexOf(" ")+1);
			}
			
			PreparedStatement pstmt = conn.prepareStatement(sql2);
			pstmt.setString(1, rent_end);
			re = pstmt.executeUpdate();
			
			if (conn != null)
				conn.close();
			if (pstmt != null)
				pstmt.close();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		
		return re;
	}
	
	public int adminUpdateOrderCondition(int order_id, String condition)
	{
		int re = -1;
		int product_id = 0;
		String sql = "Select product_id from orderList where order_id = "+order_id;
		String sql2 = "update product set condition = ? where product_id = ?";
		try {
			InitialContext context = new InitialContext();
			DataSource ds = (DataSource) context.lookup("java:/comp/env/bit");
			Connection conn = ds.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()) {
				product_id = rs.getInt(1);
			}
			
			PreparedStatement pstmt = conn.prepareStatement(sql2);
			pstmt.setString(1, condition);
			pstmt.setInt(2, product_id);
		 	re = pstmt.executeUpdate();
		 	
			if (conn != null)
				conn.close();
			if (pstmt != null)
				pstmt.close();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		
		
		return re;
	}
}