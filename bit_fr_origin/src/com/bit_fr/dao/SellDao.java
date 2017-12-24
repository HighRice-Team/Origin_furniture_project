package com.bit_fr.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.bit_fr.vo.SellVo;

public class SellDao {
	private static SellDao dao;
	private SellDao() {}
	static {
		dao = new SellDao();
	}
	public static SellDao getInstance() {
		return dao;
	}
	
	public int deleteProduct(int product_id) {
		int re = -1;
		String sql = "delete product where product_id=?";
		try {
			InitialContext context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:/comp/env/bit");
			Connection conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, product_id);
			re = pstmt.executeUpdate();
			if(pstmt!=null)
				pstmt.close();
			if(conn!=null)
				conn.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return re;
	}
	
	public int updateProduct(String product_name, String item, String quality, String main_img, String sub_img, int product_id) {
		int re = -1;
		String sql = "update product set product_name=?, item=?, quality=?, main_img=?, sub_img=? where product_id=?";
		try {
			InitialContext context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:/comp/env/bit");
			Connection conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, product_name);
			pstmt.setString(2, item);
			pstmt.setString(3, quality);
			pstmt.setString(4, main_img);
			pstmt.setString(5, sub_img);
			pstmt.setInt(6, product_id);
			re = pstmt.executeUpdate();
			if(pstmt!=null)
				pstmt.close();
			if(conn!=null)
				conn.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return re;
	}
	
	public int insertProduct(SellVo p) {
		int re = -1;
		String sql = "insert into product values(?,'등록',?,?,?,?,0,?,?)";
		try {
			InitialContext context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:/comp/env/bit");
			Connection conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNextId());
			pstmt.setString(2, p.getProduct_name());
			pstmt.setString(3, p.getItem());
			pstmt.setString(4, p.getQuality());
			pstmt.setString(5, "a1");
			pstmt.setString(6, p.getMain_img());
			pstmt.setString(7, p.getSub_img());
			re = pstmt.executeUpdate();
			if(pstmt!=null)
				pstmt.close();
			if(conn!=null)
				conn.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return re;
	}

	public int getNextId() {
		int product_id = 0;
		String sql = "select nvl(max(product_id),0) from product";
		try {
			InitialContext context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:/comp/env/bit");
			Connection conn = ds.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()) {
				product_id = rs.getInt(1)+1;
			}
			if(rs!=null)
				rs.close();
			if(stmt!=null)
				stmt.close();
			if(conn!=null)
				conn.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return product_id;
	}

	public SellVo getProduct(int product_id) {
		SellVo p = new SellVo();
		String sql = "select * from product where product_id=?";
		try {
			InitialContext context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:/comp/env/bit");
			Connection conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, product_id);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				p.setProduct_id(rs.getInt(1));
				p.setCondition(rs.getString(2));
				p.setProduct_name(rs.getString(3));
				p.setItem(rs.getString(4));
				p.setQuality(rs.getString(5));
				p.setMember_id(rs.getString(6));
				p.setPrice(rs.getInt(7));
				p.setMain_img(rs.getString(8));
				p.setSub_img(rs.getString(9));
			}
			if(rs!=null) {
				rs.close();
			}
			if(pstmt!=null) {
				pstmt.close();
			}
			if(conn!=null) {
				conn.close();
			}			
		} catch (Exception e) {
			System.out.println(e);
		}
		return p;
	}
	
	public ArrayList<SellVo> listAll(String member_id){
		String sql = "select * from product where member_id=? order by product_id";
		ArrayList<SellVo> list = new ArrayList<SellVo>();
		try {
			InitialContext context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:/comp/env/bit");
			Connection conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member_id);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				SellVo p = new SellVo();
				p.setProduct_id(rs.getInt(1));
				p.setCondition(rs.getString(2));
				p.setProduct_name(rs.getString(3));
				p.setItem(rs.getString(4));
				p.setQuality(rs.getString(5));
				p.setMember_id(rs.getString(6));
				p.setPrice(rs.getInt(7));
				p.setMain_img(rs.getString(8));
				p.setSub_img(rs.getString(9));
				list.add(p);
			}
			if(rs!=null) {
				rs.close();
			}
			if(pstmt!=null) {
				pstmt.close();
			}
			if(conn!=null) {
				conn.close();
			}			

		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}
	
}
