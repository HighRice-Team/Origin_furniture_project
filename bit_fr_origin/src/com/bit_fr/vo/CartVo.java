package com.bit_fr.vo;

public class CartVo {
	private int rownum;
	private String product_name;
	private String main_img;
	private int price;
	private int rent_month;
	private String product_id;
	private String condition;

	public int getRownum() {
		return rownum;
	}

	public void setRownum(int rownum) {
		this.rownum = rownum;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getMain_img() {
		return main_img;
	}

	public void setMain_img(String main_img) {
		this.main_img = main_img;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getRent_month() {
		return rent_month;
	}

	public void setRent_month(int rent_month) {
		this.rent_month = rent_month;
	}

	public String getProduct_id() {
		return product_id;
	}

	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public CartVo(int rownum, String product_name, String main_img, int price, int rent_month, String product_id,
			String condition) {
		super();
		this.rownum = rownum;
		this.product_name = product_name;
		this.main_img = main_img;
		this.price = price;
		this.rent_month = rent_month;
		this.product_id = product_id;
		this.condition = condition;
	}

	public CartVo() {
		super();
		
	}

}
