package com.bit_fr.vo;

import java.sql.Date;

public class OrderListVo {
	private int order_id;
	private String member_id;
	private int product_id;
	private Date pay_date;
	private String rent_start;
	private Date rent_end;
	private int rent_month;

	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
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

	public Date getPay_date() {
		return pay_date;
	}

	public void setPay_date(Date pay_date) {
		this.pay_date = pay_date;
	}

	public String getRent_start() {
		return rent_start;
	}

	public void setRent_start(String rent_start) {
		this.rent_start = rent_start;
	}

	public Date getRent_end() {
		return rent_end;
	}

	public void setRent_end(Date rent_end) {
		this.rent_end = rent_end;
	}

	public int getRent_month() {
		return rent_month;
	}

	public void setRent_month(int rent_month) {
		this.rent_month = rent_month;
	}

	public OrderListVo(int order_id, String member_id, int product_id, Date pay_date, String rent_start, Date rent_end,
			int rent_month) {
		super();
		this.order_id = order_id;
		this.member_id = member_id;
		this.product_id = product_id;
		this.pay_date = pay_date;
		this.rent_start = rent_start;
		this.rent_end = rent_end;
		this.rent_month = rent_month;
	}

	public OrderListVo() {
		super();
		
	}

}
