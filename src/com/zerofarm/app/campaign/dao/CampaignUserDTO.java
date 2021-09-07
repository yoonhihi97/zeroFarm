package com.zerofarm.app.campaign.dao;

public class CampaignUserDTO {
	private int camusernum;
	private String email;
	private int campoint;
	private String regdate;
	private int camnum;
	
	public int getCamusernum() {
		return camusernum;
	}
	public String getEmail() {
		return email;
	}
	public int getCampoint() {
		return campoint;
	}
	public String getRegdate() {
		return regdate;
	}
	public int getCamnum() {
		return camnum;
	}
	public void setCamusernum(int camusernum) {
		this.camusernum = camusernum;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setCampoint(int campoint) {
		this.campoint = campoint;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public void setCamnum(int camnum) {
		this.camnum = camnum;
	}
	
}
