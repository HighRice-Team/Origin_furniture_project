package com.bit_fr.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.bit_fr.vo.AccountVo;

public class AccountDao {
	private static AccountDao dao;
	private AccountDao() {};
	static {
		dao = new AccountDao();
	}
	
	public static AccountDao getInstance()
	{
		return dao;
	}
	
	public int updateAccount(String account_no,String bank,int account_id) {
		int re=-1;
		
		try {
				String sql="update account set account_no=?,bank=? where account_id=?";
				InitialContext context = new InitialContext();
				DataSource ds = (DataSource)context.lookup("java:/comp/env/bit");
				Connection conn = ds.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, account_no);
				pstmt.setString(2, bank);
				pstmt.setInt(3, account_id);
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
	
	public int withdraw(int account_id,int price)
	{
		int re=-1;
		
		try {
			
				String sql="update account set balance=(balance-?) where account_id=?";
				InitialContext context = new InitialContext();
				DataSource ds = (DataSource)context.lookup("java:/comp/env/bit");
				Connection conn = ds.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, price);
				pstmt.setInt(2, account_id);
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
	
	public int getBalance(int account_id) {
		int re=-1;
		
		try {
			
				String sql="select balance from account where account_id=?";
				InitialContext context = new InitialContext();
				DataSource ds = (DataSource)context.lookup("java:/comp/env/bit");
				Connection conn = ds.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, account_id);
				ResultSet rs = pstmt.executeQuery();
				if(rs.next())
				{
					re = rs.getInt(1);
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
		
		return re;	
	}
	
	public AccountVo getOne(int account_id) {
		AccountVo v = new AccountVo();
		
		try {
				String sql="select * from account where account_id=?";
				InitialContext context = new InitialContext();
				DataSource ds = (DataSource)context.lookup("java:/comp/env/bit");
				Connection conn = ds.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, account_id);
				ResultSet rs = pstmt.executeQuery();
				
				if(rs.next())
				{
					v.setAccount_id(account_id);
					v.setAccoint_no(rs.getString(2));
					v.setBank(rs.getString(3));
					v.setBalance(rs.getInt(4));
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
	
	public int insertAccount(AccountVo v)
	{
		int re=-1;
		
		try {
			
				String sql = "insert into account values(?,?,?,?)";
				InitialContext context = new InitialContext();
				DataSource ds = (DataSource)context.lookup("java:/comp/env/bit");
				Connection conn = ds.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, v.getAccount_id());
				pstmt.setString(2, v.getAccoint_no());
				pstmt.setString(3, v.getBank());
				pstmt.setInt(4, v.getBalance());
				
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
}
