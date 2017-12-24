package com.bit_fr.vo;


public class AdminProductVo {
	private int product_id;
	private String item;
	private String product_name;
	private String m_member_id;
	private String condition;
	private String a_address2;
	private String quality;
	private int price;
	public AdminProductVo() {
		super();
		
	}
	public AdminProductVo(int product_id, String item, String product_name, String m_member_id, String condition,
			String a_address2, String quality, int price) {
		super();
		this.product_id = product_id;
		this.item = item;
		this.product_name = product_name;
		this.m_member_id = m_member_id;
		this.condition = condition;
		this.a_address2 = a_address2;
		this.quality = quality;
		this.price = price;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getItem() {
		return item;
	}
	public void setItem(String item) {
		this.item = item;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getM_member_id() {
		return m_member_id;
	}
	public void setM_member_id(String m_member_id) {
		this.m_member_id = m_member_id;
	}
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	public String getA_address2() {
		return a_address2;
	}
	public void setA_address2(String a_address2) {
		this.a_address2 = a_address2;
	}
	public String getQuality() {
		return quality;
	}
	public void setQuality(String quality) {
		this.quality = quality;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
}
