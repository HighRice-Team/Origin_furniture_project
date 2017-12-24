package com.bit_fr.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.bit_fr.vo.AdminOrderListVo;
import com.bit_fr.vo.OrderListVo;

public class OrderListDao {
   private static OrderListDao dao;

   private OrderListDao() {
   };

   static {
      dao = new OrderListDao();
   }

   public static OrderListDao getInstance() {
      return dao;
   }
   
   public int deleteOrderList(int product_id) {
      int re = -1;
      
      try {
            String sql ="delete orderlist where product_id=?";
            InitialContext context = new InitialContext();
            DataSource ds = (DataSource)context.lookup("java:/comp/env/bit");
            Connection conn = ds.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, product_id);
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
   
   
   
   public int deleteOne(String member_id,int product_id) {
      int re=-1;
      
      try {
            String sql="delete orderlist where member_id=? and product_id=?";
            InitialContext context = new InitialContext();
            DataSource ds = (DataSource)context.lookup("java:/comp/env/bit");
            Connection conn = ds.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, member_id);
            pstmt.setInt(2, product_id);
            re=pstmt.executeUpdate();

            
            if (conn != null)
               conn.close();
            if (pstmt != null)
               pstmt.close();
      } catch (Exception e) {
         // TODO: handle exception
      }
      
      return re;
   }
   
   public int updateOne(String member_id,int product_id,int rent_month) {
      int re=-1;
      
      try {
            String sql="update orderlist set rent_month=? where member_id=? and product_id=?";
            InitialContext context = new InitialContext();
            DataSource ds = (DataSource)context.lookup("java:/comp/env/bit");
            Connection conn = ds.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, rent_month);
            pstmt.setString(2, member_id);
            pstmt.setInt(3, product_id);
            re=pstmt.executeUpdate();

            if (conn != null)
               conn.close();
            if (pstmt != null)
               pstmt.close();
      } catch (Exception e) {
         // TODO: handle exception
      }
      
      return re;
   }
   
   public int chkExist(String member_id,int product_id) {
      int re = -1;
      try {
            String sql="select count(*) from orderlist where member_id=? and product_id=?";
            InitialContext context = new InitialContext();
            DataSource ds = (DataSource)context.lookup("java:/comp/env/bit");
            Connection conn =ds.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, member_id);
            pstmt.setInt(2, product_id);
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
   
   public int insertOrderList(OrderListVo v) {
      int re=-1;
      
      try {         
            String sql="insert into orderlist values(?,?,?,sysdate,?,null,?)";
            InitialContext context = new InitialContext();
            DataSource ds = (DataSource) context.lookup("java:/comp/env/bit");
            Connection conn = ds.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, getMax());
            pstmt.setString(2, v.getMember_id());
            pstmt.setInt(3, v.getProduct_id());
            pstmt.setString(4, v.getRent_start());
            pstmt.setInt(5, v.getRent_month());
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
   
   public int updateRentend(){
      
      int order_id = getMax()-1;
      int re = -1;
      String sql = "update orderlist set rent_end = (select ADD_MONTHS(rent_start, rent_month) from orderlist where order_id =?) where order_id="+order_id;
      try {
         InitialContext context = new InitialContext();
         DataSource ds = (DataSource) context.lookup("java:/comp/env/bit");
         Connection conn = ds.getConnection();
         PreparedStatement pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, order_id);
         re = pstmt.executeUpdate();
         
         pstmt.close();
         conn.close();
      } catch (Exception e) {
         // TODO: handle exception
         System.out.println(e);
      }
      
      return re;
   }
   
   public int getMax() {
      int re=-1;
      
      try {
         
            String sql="select nvl(max(order_id)+1,0) from orderlist";
            InitialContext context = new InitialContext();
            DataSource ds = (DataSource) context.lookup("java:/comp/env/bit");
            Connection conn = ds.getConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            
            if(rs.next())
               re=rs.getInt(1);
         
      } catch (Exception e) {
         // TODO: handle exception
      }
      
      return re;
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
   
   public ArrayList<OrderListVo> getMyOrder(String member_id,String condition) {
      ArrayList<OrderListVo> list = new ArrayList<OrderListVo>();
      
      try {
         String sql = "select * from orderlist where member_id=? and product_id in(select product_id from product where condition=?)";
         InitialContext context = new InitialContext();
         DataSource ds = (DataSource) context.lookup("java:/comp/env/bit");
         Connection conn = ds.getConnection();
         PreparedStatement pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, member_id);
         pstmt.setString(2, condition);
         ResultSet rs = pstmt.executeQuery();

         while (rs.next()) {
            list.add(new OrderListVo(rs.getInt(1), rs.getString(2), rs.getShort(3), rs.getDate(4), rs.getString(5),
                  rs.getDate(6), rs.getInt(7)));
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
   
   public ArrayList<OrderListVo> getMyOrder(String member_id) {
      ArrayList<OrderListVo> list = new ArrayList<OrderListVo>();
      
      try {
         String sql = "select * from orderlist where member_id=?";
         InitialContext context = new InitialContext();
         DataSource ds = (DataSource) context.lookup("java:/comp/env/bit");
         Connection conn = ds.getConnection();
         PreparedStatement pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, member_id);
         ResultSet rs = pstmt.executeQuery();

         while (rs.next()) {
            list.add(new OrderListVo(rs.getInt(1), rs.getString(2), rs.getShort(3), rs.getDate(4), rs.getString(5),
                  rs.getDate(6), rs.getInt(7)));
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
   
   public ArrayList<AdminOrderListVo> getAdminAll() {
      ArrayList<AdminOrderListVo> list = new ArrayList<AdminOrderListVo>();

      try {
         String sql = "select order_id, o.member_id, p.item,condition, p.member_id, address2, rent_start, rent_end, rent_month, price from orderlist o, product p, member m, address a where o.product_id=p.product_id and p.member_id=m.member_id and m.address_id=a.address_id";
         InitialContext context = new InitialContext();
         DataSource ds = (DataSource) context.lookup("java:/comp/env/bit");
         Connection conn = ds.getConnection();
         Statement stmt = conn.createStatement();
         ResultSet rs = stmt.executeQuery(sql);

         while (rs.next()) {
            list.add(new AdminOrderListVo(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                  rs.getString(5), rs.getString(6), rs.getDate(7), rs.getDate(8), rs.getInt(9), rs.getInt(10)));
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
}