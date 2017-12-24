package com.bit_fr.vo;

public class AccountVo {
	private int account_id;
	private String accoint_no;
	private String bank;
	private int balance;

	public int getAccount_id() {
		return account_id;
	}

	public void setAccount_id(int account_id) {
		this.account_id = account_id;
	}

	public String getAccoint_no() {
		return accoint_no;
	}

	public void setAccoint_no(String accoint_no) {
		this.accoint_no = accoint_no;
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

	public AccountVo(int account_id, String accoint_no, String bank, int balance) {
		super();
		this.account_id = account_id;
		this.accoint_no = accoint_no;
		this.bank = bank;
		this.balance = balance;
	}

	public AccountVo() {
		super();
		
	}

}
