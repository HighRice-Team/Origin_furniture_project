package com.bit_fr.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.bit_fr.vo.QnaVo;

public class QnaDao {
	private static QnaDao dao;
	public static int pageSIZE = 5;
	public static int totalRecord;
	public static int totalPage;

	private QnaDao() {
	}

	static {
		dao = new QnaDao();
	}

	public static QnaDao getInstance() {
		return dao;
	}

	public int countQna() {
		int re = -1;
		String sql = "SELECT board_id from qna";
		ArrayList<Integer> list = new ArrayList<Integer>();
		try {
			InitialContext context = new InitialContext();
			DataSource ds = (DataSource) context.lookup("java:/comp/env/bit");
			Connection conn = ds.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);

			try {

				while (rs.next()) {
					String str[] = rs.getString(1).split("_");
					list.add(Integer.parseInt(str[0]));
				}
				list.sort(null);
				re = (list.get(list.size() - 1)) + 1;

			} catch (ArrayIndexOutOfBoundsException e) {
				re = 1;
			}

			rs.close();
			stmt.close();
			conn.close();

		} catch (Exception e) {
			System.out.println(e);

		}

		return re;
	}

	public int insertQna(QnaVo q) {
		int re = -1;
		String sql = "insert into qna values(?,?,?,null,sysdate,?,?,?,?)";

		try {
			InitialContext context = new InitialContext();
			DataSource ds = (DataSource) context.lookup("java:/comp/env/bit");
			Connection conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, countQna() + "_" + "Q");
			pstmt.setString(2, q.getTitle());
			pstmt.setString(3, q.getMember_id());

			pstmt.setString(4, q.getContent());

			int b_ref = countQna();
			int b_level = 0;
			int b_step = 0;

			int pno = q.getB_ref();

			if (pno != 0) {
				b_ref = dao.detailQna(pno + "_" + "Q").getB_ref();
				b_level = dao.detailQna(pno + "_" + "Q").getB_level();
				b_step = dao.detailQna(pno + "_" + "Q").getB_step();

				updateStep(b_ref, b_step);

				b_level++;
				b_step++;
			}
			pstmt.setInt(5, b_ref);
			pstmt.setInt(6, b_level);
			pstmt.setInt(7, b_step);

			re = pstmt.executeUpdate();

			pstmt.close();
			conn.close();

		} catch (Exception e) {
			System.out.println(e);
		}
		return re;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public ArrayList<QnaVo> listQna(int pageNUM) {
		int start = (pageNUM - 1) * pageSIZE + 1;
		int end = start + pageSIZE - 1;

		totalRecord = getTotal();
		totalPage = totalRecord / pageSIZE;
		if (totalRecord % pageSIZE != 0)
			totalPage++;

		String sql = "select board_id, title, nvl(member_id, '관리자'), product_id, regdate, content, b_ref, b_level, b_step from";
		sql += "(select rownum n, board_id, title, member_id, product_id, regdate, content, b_ref, b_level, b_step from ";
		sql += " (select *";
		sql += " from qna";
		sql += " order by b_ref desc, b_step))a";
		sql += " where a.n >=" + start + " and a.n<=" + end + "";

		ArrayList<QnaVo> list = new ArrayList<QnaVo>();

		try {
			InitialContext context = new InitialContext();
			DataSource ds = (DataSource) context.lookup("java:/comp/env/bit");
			Connection conn = ds.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				list.add(new QnaVo(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getDate(5),
						rs.getString(6), rs.getInt(7), rs.getInt(8), rs.getInt(9)));
			}

			rs.close();
			stmt.close();
			conn.close();

		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}
	
	public ArrayList<QnaVo> listQna(){
		ArrayList<QnaVo> list = new ArrayList<QnaVo>();
		String sql = "select board_id, title, nvl(member_id, '관리자'), product_id, regdate, content, b_ref, b_level, b_step from qna order by b_ref desc, b_step";
		try {
			InitialContext context = new InitialContext();
			DataSource ds = (DataSource) context.lookup("java:/comp/env/bit");
			Connection conn = ds.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				list.add(new QnaVo(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getDate(5),
						rs.getString(6), rs.getInt(7), rs.getInt(8), rs.getInt(9)));
			}
			
			rs.close();
			stmt.close();
			conn.close();

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		
		return list;
	}

	private int getTotal() {
		int re = -1;
		String sql = "SELECT nvl(count(*),0) from qna";
		try {
			InitialContext context = new InitialContext();
			DataSource ds = (DataSource) context.lookup("java:/comp/env/bit");
			Connection conn = ds.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if (rs.next()) {
				re = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return re;
	}

	public QnaVo detailQna(String board_id) {
		QnaVo q = new QnaVo();
		 String sql = "Select board_id, title, nvl(member_id, '관리자'), product_id, regdate, content, b_ref, b_level, b_step from qna where board_id = ?";
		try {
			InitialContext context = new InitialContext();
			DataSource ds = (DataSource) context.lookup("java:/comp/env/bit");
			Connection conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board_id);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				q.setBoard_id(rs.getString(1));
				q.setTitle(rs.getString(2));
				q.setMember_id(rs.getString(3));
				q.setProduct_id(rs.getInt(4));
				q.setRegdate(rs.getDate(5));
				q.setContent(rs.getString(6));
				q.setB_ref(rs.getInt(7));
				q.setB_level(rs.getInt(8));
				q.setB_step(rs.getInt(9));
			}
			rs.close();
			pstmt.close();
			conn.close();

		} catch (Exception e) {
			System.out.println(e);
		}
		return q;
	}

	public int updateQna(QnaVo v) {
		int re = -1;
		String sql = "update qna set title = ?, content = ? where board_id = ?";
		try {
			InitialContext con = new InitialContext();
			DataSource ds = (DataSource) con.lookup("java:/comp/env/bit");
			Connection conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, v.getTitle());
			pstmt.setString(2, v.getContent());
			pstmt.setString(3, v.getBoard_id());

			re = pstmt.executeUpdate();

			pstmt.close();
			conn.close();

		} catch (Exception e) {
			System.out.println(e);
		}
		return re;
	}

	public int deleteQna(String board_id) {
		int re = -1;
		String sql = "DELETE qna where board_id = ?";

		try {
			InitialContext con = new InitialContext();
			DataSource ds = (DataSource) con.lookup("java:/comp/env/bit");
			Connection conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board_id);

			re = pstmt.executeUpdate();

			pstmt.close();
			conn.close();

		} catch (Exception e) {
			System.out.println(e);
		}
		return re;
	}

	private void updateStep(int b_ref, int b_step) {
		String sql = "update qna set b_step = b_step + 1 where b_ref=? and b_step > ?";

		try {
			InitialContext context = new InitialContext();
			DataSource ds = (DataSource) context.lookup("java:/comp/env/bit");
			Connection conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b_ref);
			pstmt.setInt(2, b_step);

			pstmt.executeUpdate();

			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public String getPageStr() {
		String str = "";

		for (int i = 1; i <= totalPage; i++) {
			str = str + "<a href = 'listQna.do?pageNUM=" + i + "'>" + i + "</a>&nbsp;";
		}
		return str;
	}
	

}