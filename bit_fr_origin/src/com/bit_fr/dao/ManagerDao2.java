package com.bit_fr.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ManagerDao2 {
	private static ManagerDao2 dao;

	private ManagerDao2() {
	}

	static {
		dao = new ManagerDao2();
	}

	public static ManagerDao2 getInstance() {
		return dao;
	}

	public int managerLogin(String id, String pwd) {
		int re = -1;
		String sql = "select count(*) from admin where id =? and pwd = ?";
		try {
			InitialContext context = new InitialContext();
			DataSource ds = (DataSource) context.lookup("java:/comp/env/bit");
			Connection conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				re = rs.getInt(1);
			}

			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return re;
	}
}