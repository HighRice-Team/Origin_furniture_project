package com.bit_fr.vo;

public class AddressVo {
	private int address_id;
	private String address1;
	private String address2;
	private String address3;
	
	

	@Override
	public String toString() {
		return address1 + " " + address2
				+ " " + address3;
	}

	public int getAddress_id() {
		return address_id;
	}

	public void setAddress_id(int address_id) {
		this.address_id = address_id;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getAddress3() {
		return address3;
	}

	public void setAddress3(String address3) {
		this.address3 = address3;
	}

	public AddressVo(int address_id, String address1, String address2, String address3) {
		super();
		this.address_id = address_id;
		this.address1 = address1;
		this.address2 = address2;
		this.address3 = address3;
	}

	public AddressVo() {
		super();
		
	}

}
