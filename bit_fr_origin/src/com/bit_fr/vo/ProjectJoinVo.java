package com.bit_fr.vo;

public class ProjectJoinVo {
	 private String member_id;
	 private String pwd;
	 private String name;
	 private String jumin;
	 private String pwd_q;
	 private String pwd_a;
	 private String tel;
	 private int account_id;
	 private int address_id;
	public ProjectJoinVo(String member_id, String pwd, String name, String jumin, String pwd_q, String pwd_a,
			String tel, int account_id, int address_id) {
		super();
		this.member_id = member_id;
		this.pwd = pwd;
		this.name = name;
		this.jumin = jumin;
		this.pwd_q = pwd_q;
		this.pwd_a = pwd_a;
		this.tel = tel;
		this.account_id = account_id;
		this.address_id = address_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getJumin() {
		return jumin;
	}
	public void setJumin(String jumin) {
		this.jumin = jumin;
	}
	public String getPwd_q() {
		return pwd_q;
	}
	public void setPwd_q(String pwd_q) {
		this.pwd_q = pwd_q;
	}
	public String getPwd_a() {
		return pwd_a;
	}
	public void setPwd_a(String pwd_a) {
		this.pwd_a = pwd_a;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int getAccount_id() {
		return account_id;
	}
	public void setAccount_id(int account_id) {
		this.account_id = account_id;
	}
	public int getAddress_id() {
		return address_id;
	}
	public void setAddress_id(int address_id) {
		this.address_id = address_id;
	}
	public ProjectJoinVo() {
		super();
		
	}

	
	 
	 
	
}
