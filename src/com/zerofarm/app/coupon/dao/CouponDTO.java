package com.zerofarm.app.coupon.dao;

public class CouponDTO {
	private int couponcode;
	private String couponname;
	private String couponcreatedate;
	private int coupondiscount;
	private String couponexpdate;
	private String couponuse;
	private String email;
	
	public int getCouponcode() {
		return couponcode;
	}
	public void setCouponcode(int couponcode) {
		this.couponcode = couponcode;
	}
	public String getCouponname() {
		return couponname;
	}
	public void setCouponname(String couponname) {
		this.couponname = couponname;
	}
	public String getCouponcreatedate() {
		return couponcreatedate;
	}
	public void setCouponcreatedate(String couponcreatedate) {
		this.couponcreatedate = couponcreatedate;
	}
	public int getCoupondiscount() {
		return coupondiscount;
	}
	public void setCoupondiscount(int coupondiscount) {
		this.coupondiscount = coupondiscount;
	}
	public String getCouponexpdate() {
		return couponexpdate;
	}
	public void setCouponexpdate(String couponexpdate) {
		this.couponexpdate = couponexpdate;
	}
	public String getCouponuse() {
		return couponuse;
	}
	public void setCouponuse(String couponuse) {
		this.couponuse = couponuse;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
	
}
