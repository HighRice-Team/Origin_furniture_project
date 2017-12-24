package com.bit_fr.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.bit_fr.vo.AdminProductVo;
import com.bit_fr.vo.ProductVo;

public class ProductDao {
	private static ProductDao dao;
	
	static {
		dao = new ProductDao();
	}
	
	private ProductDao() {
	};
	
	public static ProductDao getInstance() {
		return dao;
	}
	
	public int deleteProduct(int product_id) {
		int re=-1;
		
		try {
				String sql="delete product where product_id=?";
				InitialContext context = new InitialContext();
				DataSource ds = (DataSource) context.lookup("java:/comp/env/bit");
				Connection conn = ds.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, product_id);
				re = pstmt.executeUpdate();
				
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
				
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return re;
	}
	
	public int getItem(String item) {
		int re=-1;
		
		try {
				String sql="select count(*) from product where item=? and condition='물품게시'";
				InitialContext context = new InitialContext();
				DataSource ds = (DataSource) context.lookup("java:/comp/env/bit");
				Connection conn = ds.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, item);
				ResultSet rs = pstmt.executeQuery();
				if(rs.next())
					re = rs.getInt(1);

				if (conn != null)
					conn.close();
				if (pstmt != null)
					pstmt.close();
				if (rs!=null)
					rs.close();
				
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return re;
	}
	
	public int getTotal() {
		int re=-1;
		
		try {
		
				String sql="select nvl(count(*),0) from product where condition='물품게시'";
				InitialContext context = new InitialContext();
				DataSource ds = (DataSource) context.lookup("java:/comp/env/bit");
				Connection conn = ds.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
				if(rs.next())
				{
					re = rs.getInt(1);
				}
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();			
		} catch (Exception e) {
			// TODO: handle exception
		}		
		return re;
	}
	
	public int changeCondition(int product_id,String condition) {
		int re=-1;
		
		try {
				String sql = "update product set condition=? where product_id=?";
				InitialContext context = new InitialContext();
				DataSource ds = (DataSource) context.lookup("java:/comp/env/bit");
				Connection conn = ds.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, condition);
				pstmt.setInt(2, product_id);
				re = pstmt.executeUpdate();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return re;
	}

	public int updateProduct(String product_name, String item, String quality, String main_img, String sub_img) {
		int re = -1;
		String sql = "update product set product_name=?, item=?, quality=?, main_img=?, sub_img=?";
		try {
			InitialContext context = new InitialContext();
			DataSource ds = (DataSource) context.lookup("java:/comp/env/bit");
			Connection conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			re = pstmt.executeUpdate();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return re;
	}

	public int insertProduct(ProductVo p) {
		int re = -1;
		String sql = "insert into product values(?,null,?,?,?,?,0,?,?)";
		try {
			InitialContext context = new InitialContext();
			DataSource ds = (DataSource) context.lookup("java:/comp/env/bit");
			Connection conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNextId());
			pstmt.setString(2, p.getCondition());
			pstmt.setString(3, p.getProduct_name());
			pstmt.setString(4, p.getItem());
			pstmt.setString(5, p.getQuality());
			pstmt.setString(6, p.getMember_id());
			pstmt.setString(7, p.getMain_img());
			pstmt.setString(8, p.getSub_img());
			re = pstmt.executeUpdate();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
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
			DataSource ds = (DataSource) context.lookup("java:/comp/env/bit");
			Connection conn = ds.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if (rs.next()) {
				product_id = rs.getInt(1) + 1;
			}
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return product_id;
	}

	public ProductVo getProduct(int product_id) {
		ProductVo p = new ProductVo();
		String sql = "select * from product where product_id=?";
		try {
			InitialContext context = new InitialContext();
			DataSource ds = (DataSource) context.lookup("java:/comp/env/bit");
			Connection conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, product_id);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
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
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				rs.close();
			}
			if (conn != null) {
				rs.close();
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return p;
		
	}
	public ArrayList<ProductVo> getCust(String sql2) {
		ArrayList<ProductVo> list = new ArrayList<ProductVo>();
		String sql = sql2;
		try {

			InitialContext context = new InitialContext();
			DataSource ds = (DataSource) context.lookup("java:/comp/env/bit");
			Connection conn = ds.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				list.add(new ProductVo(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getInt(7)));
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
	
	public int getTotal(String sql) {
		int re=-1;
		
		try {
			InitialContext context = new InitialContext();
			DataSource ds = (DataSource) context.lookup("java:/comp/env/bit");
			Connection conn = ds.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			
			if(rs.next())
				re = rs.getInt(1);

			if (conn != null)
				conn.close();
			if (stmt != null)
				stmt.close();
			if (rs != null)
				rs.close();

		} catch (Exception e) {
			System.out.println(e);
		}
		
		return re;
	}

	public ArrayList<ProductVo> getOne(String member_id,int min,int max) {
		ArrayList<ProductVo> list = new ArrayList<ProductVo>();

		try {
			String sql = "select * from(select rownum a,product_id,condition,product_name,item,quality,member_id,price,main_img,sub_img from(select * from product where member_id=? order by product_id)) where a>=? and a<=?";
			InitialContext context = new InitialContext();
			DataSource ds = (DataSource) context.lookup("java:/comp/env/bit");
			Connection conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member_id);
			pstmt.setInt(2, min);
			pstmt.setInt(3, max);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new ProductVo(rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6),
						rs.getString(7), rs.getInt(8), rs.getString(9), rs.getString(10)));
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

	public ArrayList<ProductVo> getAll() {
		ArrayList<ProductVo> list = new ArrayList<ProductVo>();

		try {
			String sql = "select * from product";
			InitialContext context = new InitialContext();
			DataSource ds = (DataSource) context.lookup("java:/comp/env/bit");
			Connection conn = ds.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);

			while (rs.next()) {
				list.add(new ProductVo(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getInt(7), rs.getString(8), rs.getString(9)));
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
	public ArrayList<AdminProductVo> getAdminAll() {
		ArrayList<AdminProductVo> list = new ArrayList<AdminProductVo>();

		try {
			String sql = "select product_id, item, product_name, m.member_id, condition, a.address2, quality, price from product p, member m, address a where p.member_id=m.member_id and m.address_id=a.address_id";
			InitialContext context = new InitialContext();
			DataSource ds = (DataSource) context.lookup("java:/comp/env/bit");
			Connection conn = ds.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);

			while (rs.next()) {
				list.add(new AdminProductVo(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8)));
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
	
	public int countProduct() {
		int re = -1;
		String sql = "SELECT COUNT(*) FROM PRODUCT";
		try {
			InitialContext context = new InitialContext();
			DataSource ds = (DataSource) context.lookup("java:/comp/env/bit");
			Connection conn = ds.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()) {
				re = rs.getInt(1);
			}
			
			if (rs != null) {
				rs.close();
			}

			if (stmt != null) {
				stmt.close();
			}

			if (conn != null) {
				conn.close();
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		
		return re;
	}
	
	public int adminProductUpdate(AdminProductVo v) {
		int re = -1;
		String sql = "update product set item = ?, product_name =?, condition = ?, quality =?, price = ? where product_id ="+v.getProduct_id();
		try {
			InitialContext context = new InitialContext();
			DataSource ds = (DataSource) context.lookup("java:/comp/env/bit");
			Connection conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, v.getItem());
			pstmt.setString(2, v.getProduct_name());
			pstmt.setString(3, v.getCondition());
			pstmt.setString(4, v.getQuality());
			pstmt.setInt(5, v.getPrice());
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