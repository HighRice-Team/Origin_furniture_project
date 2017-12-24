package com.bit_fr.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.bit_fr.vo.AdminMemberListVo;
import com.bit_fr.vo.MemberVo;

public class MemberDao {
   private static MemberDao dao;

   private MemberDao() {
   };

   static {
      dao = new MemberDao();
   }

   public static MemberDao getInstance() {
      return dao;
   }

   public int updatePwd(String member_id,String pwd) {
      int re=-1;
      
      try {
            String sql="update member set pwd=? where member_id=?";
            InitialContext context = new InitialContext();
            DataSource ds = (DataSource)context.lookup("java:/comp/env/bit");
            Connection conn = ds.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, pwd);
            pstmt.setString(2, member_id);
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
   
   public int resetPwd(String member_id) {
      int re = -1;
      String sql = "update member set pwd='0000' where member_id=?";
      
      try {
         InitialContext context = new InitialContext();
         DataSource ds = (DataSource) context.lookup("java:/comp/env/bit");
         Connection conn = ds.getConnection();
         PreparedStatement pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, member_id);
         re = pstmt.executeUpdate();
         
         if (conn != null)
            conn.close();
         if (pstmt != null)
            pstmt.close();
      } catch (Exception e) {
         System.out.println(e);
      }
      return re;   
}
   
   public ArrayList<AdminMemberListVo> getAdminAll(){
      ArrayList<AdminMemberListVo> list = new ArrayList<AdminMemberListVo>();
      String sql = "select m.member_id, m.name, a.address2, m.tel, (select count(*) from product p, member m where p.member_id=m.member_id), (select count(*) from orderlist o, member m where o.member_id=m.member_id) from member m, address a where m.address_id=a.address_id";
      try {
         InitialContext context = new InitialContext();
         DataSource ds = (DataSource) context.lookup("java:/comp/env/bit");
         Connection conn = ds.getConnection();
         Statement stmt = conn.createStatement();
         ResultSet rs = stmt.executeQuery(sql);

         while (rs.next()) {
            list.add(new AdminMemberListVo(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                  rs.getInt(5), rs.getInt(6)));
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
   
   public int countMember() {
      int re = -1;
      String sql = "SELECT count(*) from member";
      try {
         InitialContext context = new InitialContext();
         DataSource ds = (DataSource) context.lookup("java:/comp/env/bit");
         Connection conn = ds.getConnection();
         Statement stmt = conn.createStatement();
         ResultSet rs = stmt.executeQuery(sql);
         if(rs.next()) {
            re = rs.getInt(1);
         }
      } catch (Exception e) {
         // TODO: handle exception
         System.out.println(e);
      }
      
      return re;
   }
   
   public int updateMember(String pwd,String pwd_q,String pwd_a,String tel, String member_id) {
      int re =-1;
      
      try {
            String sql="update member set pwd=?,pwd_q=?,pwd_a=?,tel=? where member_id=?";
            InitialContext context = new InitialContext();
            DataSource ds = (DataSource) context.lookup("java:/comp/env/bit");
            Connection conn = ds.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, pwd);
            pstmt.setString(2, pwd_q);
            pstmt.setString(3, pwd_a);
            pstmt.setString(4, tel);
            pstmt.setString(5, member_id);
            
            re = pstmt.executeUpdate();
            
            if (conn != null)
               conn.close();
            if (pstmt != null)
               pstmt.close();
            
      } catch (Exception e) {
         // TODO: handle exception
      }
      
      return re;   
   }
   
   public int existMember(String member_id) {
      int re = -1;

      try {
         String sql = "select count(member_id) from member where member_id=?";
         InitialContext context = new InitialContext();
         DataSource ds = (DataSource) context.lookup("java:/comp/env/bit");
         Connection conn = ds.getConnection();
         PreparedStatement pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, member_id);
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

   public MemberVo getOne(String member_id) {
      MemberVo v = new MemberVo();

      try {
         String sql = "select * from member where member_id=?";
         InitialContext context = new InitialContext();
         DataSource ds = (DataSource) context.lookup("java:/comp/env/bit");
         Connection conn = ds.getConnection();
         PreparedStatement pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, member_id);
         ResultSet rs = pstmt.executeQuery();

         if (rs.next()) {
            v.setMember_id(rs.getString(1));
            v.setPwd(rs.getString(2));
            v.setName(rs.getString(3));
            v.setJumin(rs.getString(4));
            v.setPwd_q(rs.getString(5));
            v.setPwd_a(rs.getString(6));
            v.setTel(rs.getString(7));
            v.setAccount_id(rs.getInt(8));
            v.setAddress_id(rs.getInt(9));
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

   public ArrayList<MemberVo> getAll() {
      ArrayList<MemberVo> list = new ArrayList<MemberVo>();

      try {
         String sql = "select * from member";
         InitialContext context = new InitialContext();
         DataSource ds = (DataSource) context.lookup("java:/comp/env/bit");
         Connection conn = ds.getConnection();
         Statement stmt = conn.createStatement();
         ResultSet rs = stmt.executeQuery(sql);

         while (rs.next()) {
            list.add(new MemberVo(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                  rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8), rs.getInt(9)));

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
   
   public int adminUpdateMember(AdminMemberListVo v) {
      int re = -1;
      String sql = "update member set name =?, tel =? where member_id ="+v.getMember_id();
      try {
         InitialContext context = new InitialContext();
         DataSource ds = (DataSource) context.lookup("java:/comp/env/bit");
         Connection conn = ds.getConnection();
         PreparedStatement pstmt = conn.prepareStatement(sql);
         System.out.println(v.getName()+ v.getTel() + v.getMember_id());
         pstmt.setString(1, v.getName());
         pstmt.setString(2, v.getTel());
         re = pstmt.executeUpdate();
         
         pstmt.close();
         conn.close();
      } catch (Exception e) {
         // TODO: handle exception
         System.out.println(e);
      }
      return re;
   }
   
   public int adminUpdateAddress(AdminMemberListVo v) {
      int re = -1;
      int address = -1;
      
      String selsql = "select address_id from member where member_id = "+v.getMember_id();
      String upsql = "update address set address2 = ? where address_id = ?";
      try {
         InitialContext context = new InitialContext();
         DataSource ds = (DataSource) context.lookup("java:/comp/env/bit");
         Connection conn = ds.getConnection();
         conn.setAutoCommit(false);
         Statement stmt = conn.createStatement();
         ResultSet rs = stmt.executeQuery(selsql);
         if(rs.next()){ address = rs.getInt(1);}
         try {
            
            PreparedStatement pstmt2 = conn.prepareStatement(upsql);
            pstmt2.setString(1, v.getAddress());
            pstmt2.setInt(2, address);
            
            
            re = pstmt2.executeUpdate();
      
            conn.commit();

         } catch (Exception e) {
            // TODO: handle exception
            conn.rollback();
         }
         
         rs.close();
         stmt.close();
         conn.close();
         
      } catch (Exception e) {
         // TODO: handle exception
         System.out.println(e);
      }
      
      return re;
   }
}