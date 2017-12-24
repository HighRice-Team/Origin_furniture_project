package com.bit_fr.vo;

public class AdminMemberListVo {
	private String member_id;
	private String name;
	private String address;
	private String tel;
	private int sellProduct;
	private int rentProduct;
	public AdminMemberListVo(String member_id, String name, String address, String tel, int sellProduct,
			int rentProduct) {
		super();
		this.member_id = member_id;
		this.name = name;
		this.address = address;
		this.tel = tel;
		this.sellProduct = sellProduct;
		this.rentProduct = rentProduct;
	}
	public AdminMemberListVo() {
		super();
		
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int getSellProduct() {
		return sellProduct;
	}
	public void setSellProduct(int sellProduct) {
		this.sellProduct = sellProduct;
	}
	public int getRentProduct() {
		return rentProduct;
	}
	public void setRentProduct(int rentProduct) {
		this.rentProduct = rentProduct;
	}
}
