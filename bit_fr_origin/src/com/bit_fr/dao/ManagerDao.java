package com.bit_fr.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.bit_fr.vo.ManagerVo;


public class ManagerDao {
   private static ManagerDao dao;

   private ManagerDao() {
   };

   static {
      dao = new ManagerDao();
   }

   public static ManagerDao getInstance() {
      return dao;
   }

   
   
   public int existMember(String mid) {
      int re = -1;

      try {
         String sql = "select count(id) from admin where id=?";
         InitialContext context = new InitialContext();
         DataSource ds = (DataSource) context.lookup("java:/comp/env/bit");
         Connection conn = ds.getConnection();
         PreparedStatement pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, mid);
         ResultSet rs = pstmt.executeQuery();

         if (rs.next()) {
            re = rs.getInt(1);
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
      return re;
   }

   public ManagerVo getOne(String mid) {
	   ManagerVo v = new ManagerVo();

      try {
         String sql = "select * from admin where id=?";
         InitialContext context = new InitialContext();
         DataSource ds = (DataSource) context.lookup("java:/comp/env/bit");
         Connection conn = ds.getConnection();
         PreparedStatement pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, mid);
         ResultSet rs = pstmt.executeQuery();

         if (rs.next()) {
            v.setName(rs.getString(1));
            v.setId(rs.getString(2));
            v.setPwd(rs.getString(3));
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
      return v;
   }

   public ArrayList<ManagerVo> getAll() {
      ArrayList<ManagerVo> list = new ArrayList<ManagerVo>();

      try {
         String sql = "select * from admin";
         InitialContext context = new InitialContext();
         DataSource ds = (DataSource) context.lookup("java:/comp/env/bit");
         Connection conn = ds.getConnection();
         Statement stmt = conn.createStatement();
         ResultSet rs = stmt.executeQuery(sql);

         while (rs.next()) {
            list.add(new ManagerVo(rs.getString(1), rs.getString(2), rs.getString(3)));

         }
         System.out.println(list);

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

}