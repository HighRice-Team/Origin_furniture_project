package com.bit_fr.vo;

public class SellVo {
	private int product_id;
	private String condition;
	private String product_name;
	private String item;
	private String quality;
	private String member_id;
	private int price;
	private String main_img;
	private String sub_img;
	public SellVo(int product_id, String condition, String product_name, String item, String quality,
			String member_id, int price, String main_img, String sub_img) {
		super();
		this.product_id = product_id;
		this.condition = condition;
		this.product_name = product_name;
		this.item = item;
		this.quality = quality;
		this.member_id = member_id;
		this.price = price;
		this.main_img = main_img;
		this.sub_img = sub_img;
	}
	public SellVo() {
		super();
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getItem() {
		return item;
	}
	public void setItem(String item) {
		this.item = item;
	}
	public String getQuality() {
		return quality;
	}
	public void setQuality(String quality) {
		this.quality = quality;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getMain_img() {
		return main_img;
	}
	public void setMain_img(String main_img) {
		this.main_img = main_img;
	}
	public String getSub_img() {
		return sub_img;
	}
	public void setSub_img(String sub_img) {
		this.sub_img = sub_img;
	}
}
