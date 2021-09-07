package com.zerofarm.app.funding.dao;

public class FundingDTO {
	private int fundnum;
	private String fundtitle;
	private String fundinfo;
	private String type;
	private String startdate;
	private String enddate;
	private int goalprice;
	private int nowprice;
	private String unit;
	private int price;
	private String email;
	

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public FundingDTO() {
	}
	
	public int getFundnum() {
		return fundnum;
	}

	public void setFundnum(int fundnum) {
		this.fundnum = fundnum;
	}

	public String getFundtitle() {
		return fundtitle;
	}

	public void setFundtitle(String fundtitle) {
		this.fundtitle = fundtitle;
	}

	public String getFundinfo() {
		return fundinfo;
	}
	public void setFundinfo(String fundinfo) {
		this.fundinfo = fundinfo;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	public int getGoalprice() {
		return goalprice;
	}
	public void setGoalprice(int goalprice) {
		this.goalprice = goalprice;
	}
	public int getNowprice() {
		return nowprice;
	}
	public void setNowprice(int nowprice) {
		this.nowprice = nowprice;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
}
