package com.zerofarm.app.funding.dao;

public class OrderDTO {
	private int ordernum;
	private String email;
	private String fundtitle;
	private int fundcnt;
	private int price;
	private String ordernow;
	
	public int getOrdernum() {
		return ordernum;
	}
	public String getEmail() {
		return email;
	}
	public String getFundtitle() {
		return fundtitle;
	}
	public int getFundcnt() {
		return fundcnt;
	}
	public int getPrice() {
		return price;
	}
	public String getOrdernow() {
		return ordernow;
	}
	public void setOrdernum(int ordernum) {
		this.ordernum = ordernum;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setFundtitle(String fundtitle) {
		this.fundtitle = fundtitle;
	}
	public void setFundcnt(int fundcnt) {
		this.fundcnt = fundcnt;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public void setOrdernow(String ordernow) {
		this.ordernow = ordernow;
	}
	
	
}
