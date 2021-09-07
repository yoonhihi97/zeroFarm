package com.zerofarm.app.review.dao;

public class ReviewDTO {
	private int reviewnumber;
	private String email;
	private String wdate;
	private String udate;
	private int like;
	private String content;
	private int fundnum;
	
	public int getReviewnumber() {
		return reviewnumber;
	}
	public void setReviewnumber(int reviewnumber) {
		this.reviewnumber = reviewnumber;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	public String getUdate() {
		return udate;
	}
	public void setUdate(String udate) {
		this.udate = udate;
	}
	public int getLike() {
		return like;
	}
	public void setLike(int like) {
		this.like = like;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getFundnum() {
		return fundnum;
	}
	public void setFundnum(int fundnum) {
		this.fundnum = fundnum;
	}
	
	
}
