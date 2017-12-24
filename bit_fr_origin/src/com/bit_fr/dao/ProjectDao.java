package com.bit_fr.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.bit_fr.vo.ProjectAccountVo;
import com.bit_fr.vo.ProjectAddressVo;
import com.bit_fr.vo.ProjectJoinVo;

public class ProjectDao {
	private static ProjectDao dao;
	private ProjectDao(){}
	static {
		dao = new ProjectDao();
	}
	
	public static ProjectDao getInstance()
	{
		return dao;
	}
	
	public int getNoAcc()
	{
		int n = 0;
		String sql = "select nvl(max(account_id),0)+1 from account";
		try {
			
			Context context = new InitialContext();
			DataSource ds  =(DataSource) context.lookup("java:/comp/env/bit");
			Connection conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();

			if(rs.next())
			{
				n = rs.getInt(1);
			}
			
			if (rs != null) {
				rs.close();
			}

			if (pstmt != null) {
				pstmt.close();
			}

			if (conn != null) {
				conn.close();
			}
			
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		
		
		
		return n;
	}
	public int getNoAddr()
	{
		int n = 0;
		String sql = "select nvl(max(address_id),0)+1 from address";
		try {
			
			Context context = new InitialContext();
			DataSource ds  =(DataSource) context.lookup("java:/comp/env/bit");
			Connection conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next())
			{
				n = rs.getInt(1);
			}
			
			if( rs != null)
			{
				rs.close();
			}
			
			if(pstmt != null)
			{
				pstmt.close();
			}
			
			if(conn != null)
			{
				conn.close();
			}
			
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		
		
		
		return n;
	}
	public int insertAccount(ProjectAccountVo a)
	{
		int re = -1;
		String sql = "insert into account values(?,?,?,0)";
		try {
			Context context = new InitialContext();
			DataSource ds  =(DataSource) context.lookup("java:/comp/env/bit");
			Connection conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, a.getAccount_id());
			pstmt.setString(2, a.getAccount_no());
			pstmt.setString(3, a.getBank());
			re = pstmt.executeUpdate();
			
			if(pstmt != null)
			{
				pstmt.close();
			}
			
			if(conn != null)
			{
				pstmt.close();
			}
			
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		return re;
	}
	
	public int insertAddress(ProjectAddressVo ad)
	{
		int re = -1;
		
		String sql = "insert into address values(?,?,?,?)";
		try {
			Context context = new InitialContext();
			DataSource ds  =(DataSource) context.lookup("java:/comp/env/bit");
			Connection conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ad.getAddress_id());
			pstmt.setString(2, ad.getAddress1());
			pstmt.setString(3, ad.getAddress2());
			pstmt.setString(4, ad.getAddress3());
			re = pstmt.executeUpdate();
			
			if(pstmt != null)
			{
				pstmt.close();
			}
			
			if(conn != null)
			{
				pstmt.close();
			}
		}catch (Exception e) {
			
			System.out.println(e);
		}
		return re;
	}
	public int insertJoin(ProjectJoinVo p)
	{
		int re = -1;
		try {
			int n = getNoAcc();
			int n2 = getNoAddr();

			String sql = "insert into member values(?,?,?,?,?,?,?,?,?)";
			
			Context context = new InitialContext();
			DataSource ds  =(DataSource) context.lookup("java:/comp/env/bit");
			Connection conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
	
			pstmt.setString(1, p.getMember_id());
			pstmt.setString(2, p.getPwd());
			pstmt.setString(3, p.getName());
			pstmt.setString(4, p.getJumin());
			pstmt.setString(5, p.getPwd_q());
			pstmt.setString(6, p.getPwd_a());
			pstmt.setString(7, p.getTel());
			pstmt.setInt(8, n-1);
			pstmt.setInt(9, n2-1);
			re = pstmt.executeUpdate();
			
			if(pstmt != null)
			{
				pstmt.close();
			}
			
			if(conn != null)
			{
				pstmt.close();
			}
		
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		return re;
	}
	
	
	public boolean duplcheck(String member_id) {
		 boolean check = false;
		 try {
			 String sql= "select member_id from member where member_id = ?";
			 Context context = new InitialContext();
			 DataSource ds  =(DataSource) context.lookup("java:/comp/env/bit");
			 Connection conn = ds.getConnection();
			 PreparedStatement pstmt = conn.prepareStatement(sql);
			 pstmt.setString(1,member_id);
	         ResultSet rs = pstmt.executeQuery();
	         check = rs.next();
	         System.out.println(check);
	        
	         if(rs != null)
				{
					rs.close();
				}
	         if(pstmt != null)
				{
					pstmt.close();
				}
				
				if(conn != null)
				{
					pstmt.close();
				}
		 }catch (Exception e) {
			// TODO: handle exception
			 System.out.println(e);
		}
		 return check;
	}
	

	public ProjectJoinVo joinCheck2(String name, String jumin)
	{
		String sql = "select member_id from member where name=? and jumin=?";
		ProjectJoinVo sid = null;
		try
		{
			
			Context context = new InitialContext();
			DataSource ds  =(DataSource) context.lookup("java:/comp/env/bit");
			Connection conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, jumin);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				sid = new ProjectJoinVo();
				sid.setMember_id(rs.getString("member_id"));
			}
			if(rs != null)
			{
				rs.close();
			}
         if(pstmt != null)
			{
				pstmt.close();
			}
			
			if(conn != null)
			{
				pstmt.close();
			}
		}catch(Exception e){
			System.out.println(e);
		}
		return sid;
	}
	
}
