package com.bit_fr.vo;

import java.sql.Date;

public class AdminOrderListVo {
	private int order_id;
	private String o_member_id;
	private String p_item;
	private String condition;
	private String p_member_id; 
	private String address2; 
	private Date rent_start; 
	private Date rent_end;
	private int rent_month;
	private int price;
	public AdminOrderListVo(int order_id, String o_member_id, String p_item, String condition, String p_member_id,
			String address2, Date rent_start, Date rent_end, int rent_month, int price) {
		super();
		this.order_id = order_id;
		this.o_member_id = o_member_id;
		this.p_item = p_item;
		this.condition = condition;
		this.p_member_id = p_member_id;
		this.address2 = address2;
		this.rent_start = rent_start;
		this.rent_end = rent_end;
		this.rent_month = rent_month;
		this.price = price;
	}
	public AdminOrderListVo() {
		super();
	
	}
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public String getO_member_id() {
		return o_member_id;
	}
	public void setO_member_id(String o_member_id) {
		this.o_member_id = o_member_id;
	}
	public String getP_item() {
		return p_item;
	}
	public void setP_item(String p_item) {
		this.p_item = p_item;
	}
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	public String getP_member_id() {
		return p_member_id;
	}
	public void setP_member_id(String p_member_id) {
		this.p_member_id = p_member_id;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public Date getRent_start() {
		return rent_start;
	}
	public void setRent_start(Date rent_start) {
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}

}
