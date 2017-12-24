package com.bit_fr.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.bit_fr.vo.AddressVo;

public class AddressDao {

	private static AddressDao dao;
	private AddressDao() {};
	static {
		dao = new AddressDao();
	}
	
	public static AddressDao getInstance()
	{
		return dao;
	}
	
	public int updateAddress(String address1,String address2,String address3,int address_id) {
		int re=-1;
		
		try {
				String sql="update address set address1=?,address2=?,address3=? where address_id=?";
				InitialContext context = new InitialContext();
				DataSource ds = (DataSource)context.lookup("java:/comp/env/bit");
				Connection conn = ds.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, address1);
				pstmt.setString(2, address2);
				pstmt.setString(3, address3);
				pstmt.setInt(4, address_id);
				
				re = pstmt.executeUpdate();
				if(conn!=null)
					conn.close();
				if(pstmt!=null)
					pstmt.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return re;
	}
	
	public AddressVo getOne(int address_id) {
		AddressVo v = new AddressVo();
		
		try {
				String sql="select * from address where address_id=?";
				InitialContext context = new InitialContext();
				DataSource ds = (DataSource)context.lookup("java:/comp/env/bit");
				Connection conn = ds.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, address_id);
				ResultSet rs = pstmt.executeQuery();
				
				if(rs.next())
				{
					v.setAddress_id(address_id);
					v.setAddress1(rs.getString(2));
					v.setAddress2(rs.getString(3));
					v.setAddress3(rs.getString(4));
				
				}
				
				if(conn!=null)
					conn.close();
				if(pstmt!=null)
					pstmt.close();
				if(rs!=null)
					rs.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return v;
	}
	public AddressVo getAddress(int address_id) {
		AddressVo v = new AddressVo();
		
		try {
			
			String sql="select * from address where address_id=?";
			InitialContext context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:/comp/env/bit");
			Connection conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, address_id);
			ResultSet rs=pstmt.executeQuery();
			
			if(rs.next())
			{
				v.setAddress_id(rs.getInt(1));
				v.setAddress1(rs.getString(2));
				v.setAddress2(rs.getString(3));
				v.setAddress3(rs.getString(4));
			}
			
			if(conn!=null)
				conn.close();
			if(pstmt!=null)
				pstmt.close();
			if(rs!=null)
				rs.close();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return v;
	}
	public int insertAddress(AddressVo v) {
		int re = -1;
		
		try {
			
				String sql = "insert into address values(?,?,?,?)";
				
				InitialContext context = new InitialContext();
				DataSource ds = (DataSource)context.lookup("java:/comp/env/bit");
				Connection conn = ds.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, v.getAddress_id());
				pstmt.setString(2, v.getAddress1());
				pstmt.setString(3, v.getAddress2());
				pstmt.setString(4, v.getAddress3());
				
				re=pstmt.executeUpdate();
				
				if(conn!=null)
					conn.close();
				if(pstmt!=null)
					pstmt.close();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return re;
	}
}
