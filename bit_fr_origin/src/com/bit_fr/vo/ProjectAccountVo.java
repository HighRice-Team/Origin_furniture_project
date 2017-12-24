package com.bit_fr.vo;

public class ProjectAccountVo {
	 private int account_id;
	 private String account_no;
	 private String bank;
	 private int balance;
	public ProjectAccountVo(int account_id, String account_no, String bank, int balance) {
		super();
		this.account_id = account_id;
		this.account_no = account_no;
		this.bank = bank;
		this.balance = balance;
	}
	public int getAccount_id() {
		return account_id;
	}
	public void setAccount_id(int account_id) {
		this.account_id = account_id;
	}
	public String getAccount_no() {
		return account_no;
	}
	public void setAccount_no(String account_no) {
		this.account_no = account_no;
	}
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
	}
	public int getBalance() {
		return balance;
	}
	public void setBalance(int balance) {
		this.balance = balance;
	}
	public ProjectAccountVo() {
		super();
	
	}
	 
	 
}
