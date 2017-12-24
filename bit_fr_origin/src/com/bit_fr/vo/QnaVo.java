package com.bit_fr.vo;

import java.util.Date;

public class QnaVo {

	private String board_id;
	private String title;
	private String member_id;
	private int product_id;
	private Date regdate;
	private String content;
	private int b_ref;
	private int b_level;
	private int b_step;

	public String getBoard_id() {
		return board_id;
	}

	public void setBoard_id(String board_id) {
		this.board_id = board_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getB_ref() {
		return b_ref;
	}

	public void setB_ref(int b_ref) {
		this.b_ref = b_ref;
	}

	public int getB_level() {
		return b_level;
	}

	public void setB_level(int b_level) {
		this.b_level = b_level;
	}

	public int getB_step() {
		return b_step;
	}

	public void setB_step(int b_step) {
		this.b_step = b_step;
	}

	public QnaVo(String board_id, String title, String member_id, int product_id, Date regdate, String content,
			int b_ref, int b_level, int b_step) {
		super();
		this.board_id = board_id;
		this.title = title;
		this.member_id = member_id;
		this.product_id = product_id;
		this.regdate = regdate;
		this.content = content;
		this.b_ref = b_ref;
		this.b_level = b_level;
		this.b_step = b_step;
	}

	public QnaVo() {
		super();
	}

}
